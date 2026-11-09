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

import { AppDetailParam, InfoRow, LogPanel, allowedLabel, backgroundPolicyLabel, SectionCard,
  uidPolicyLabel } from 'library';
import { NsNav } from './AppListPage';
import { AppDetailViewModel } from '../viewmodel/AppDetailViewModel';
import { UidPolicyMode } from '../viewmodel/PolicyViewModel';

// Spacing between cards and inner sections.
const CARD_SPACE: number = 12;
// Size of the identity block in the overview header.
const IDENTITY_SIZE: number = 48;

/**
 * Application detail page. It shows the application identity plus the aggregated per-UID
 * access policy, UID policy and background policy. Every restricted system call degrades
 * into a hint and a log entry instead of a crash, mirroring the PolicyPage behaviour.
 */
@ComponentV2
export struct AppDetailPage {
  // View model that holds the aggregated policy state and the log entries.
  @Local vm: AppDetailViewModel = new AppDetailViewModel();

  /**
   * Read the route parameter pushed by the caller and start the aggregated load.
   */
  aboutToAppear(): void {
    // Read the parameter remembered by the navigation helper.
    const detail: AppDetailParam | undefined = NsNav.detail;
    // A missing parameter only happens on a deep link, so uid 0 stays harmless and degraded.
    const uid: number = detail === undefined ? 0 : detail.uid;
    const bundleName: string = detail === undefined || detail.bundleName === undefined ? '' : detail.bundleName;
    const appName: string = detail === undefined || detail.appName === undefined ? '' : detail.appName;
    // Bind the host context so the icon resolution can build cross-package contexts.
    const context = this.getUIContext().getHostContext();
    // Load the three policy domains of the UID.
    this.vm.loadDetail(uid, bundleName, appName, context);
  }

  /**
   * Build the overview card with the identity block and the UID and bundle name rows.
   */
  @Builder
  overviewCard() {
    SectionCard({
      idPrefix: 'id_app_detail_overview',
      title: $r('app.string.ns_app_detail_overview')
    }) {
      Row({ space: 12 }) {
        // Show the decoded application icon when available, the initial block otherwise.
        if (this.vm.appIcon !== undefined) {
          Image(this.vm.appIcon)
            .id('id_app_detail_avatar')
            .width(IDENTITY_SIZE)
            .height(IDENTITY_SIZE)
            .borderRadius(8)
            .objectFit(ImageFit.Cover)
        } else {
          Text(this.vm.appName.length > 0 ? this.vm.appName.charAt(0).toUpperCase() : '?')
            .id('id_app_detail_avatar')
            .width(IDENTITY_SIZE)
            .height(IDENTITY_SIZE)
            .borderRadius(8)
            .backgroundColor($r('app.color.brand_light'))
            .fontColor($r('app.color.brand_primary'))
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .textAlign(TextAlign.Center)
        }
        Column({ space: 2 }) {
          Text(this.vm.appName)
            .id('id_app_detail_name')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(this.vm.bundleName.length > 0 ? this.vm.bundleName : $r('app.string.ns_common_dash'))
            .id('id_app_detail_bundle_text')
            .fontSize(12)
            .fontColor($r('app.color.text_tertiary'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .id('id_app_detail_header')
      .width('100%')
      .alignItems(VerticalAlign.Center)

      InfoRow({
        idPrefix: 'id_app_detail_uid_row',
        label: $r('app.string.ns_common_uid'),
        value: this.vm.uid.toString()
      })
      InfoRow({
        idPrefix: 'id_app_detail_bundle_row',
        label: $r('app.string.ns_app_detail_bundle'),
        value: this.vm.bundleName.length > 0 ? this.vm.bundleName : $r('app.string.ns_common_dash')
      })
    }
  }

  /**
   * Build the per-UID access policy card with the Wi-Fi and cellular states.
   */
  @Builder
  accessCard() {
    SectionCard({
      idPrefix: 'id_app_detail_access',
      title: $r('app.string.ns_app_detail_access_title')
    }) {
      Column({ space: CARD_SPACE }) {
        InfoRow({
          idPrefix: 'id_app_detail_access_wifi',
          label: $r('app.string.ns_pol_access_wifi'),
          value: this.vm.accessLoaded ? allowedLabel(this.vm.allowWiFi) : $r('app.string.ns_common_dash'),
          valueColor: this.vm.accessLoaded ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
        })
        InfoRow({
          idPrefix: 'id_app_detail_access_cellular',
          label: $r('app.string.ns_pol_access_cellular'),
          value: this.vm.accessLoaded ? allowedLabel(this.vm.allowCellular) : $r('app.string.ns_common_dash'),
          valueColor: this.vm.accessLoaded ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  /**
   * Build the UID policy card with the query rows and the allow, reject and clear actions.
   */
  @Builder
  uidPolicyCard() {
    SectionCard({
      idPrefix: 'id_app_detail_uid_policy',
      title: $r('app.string.ns_pol_uid_title')
    }) {
      Column({ space: CARD_SPACE }) {
        InfoRow({
          idPrefix: 'id_app_detail_uid_policy_value',
          label: $r('app.string.ns_pol_uid_policy'),
          value: this.vm.uidLoaded ? uidPolicyLabel(this.vm.uidPolicy) : $r('app.string.ns_common_dash')
        })
        InfoRow({
          idPrefix: 'id_app_detail_uid_policy_metered',
          label: $r('app.string.ns_pol_uid_metered'),
          value: this.vm.uidLoaded ? allowedLabel(this.vm.meteredAllowed) : $r('app.string.ns_common_dash'),
          valueColor: this.vm.uidLoaded ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
        })
        InfoRow({
          idPrefix: 'id_app_detail_uid_policy_iface',
          label: $r('app.string.ns_pol_uid_iface'),
          value: this.vm.uidLoaded ? allowedLabel(this.vm.ifaceAllowed) : $r('app.string.ns_common_dash'),
          valueColor: this.vm.uidLoaded ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
        })
        // Show the restriction hint when the device is not system-signed.
        if (!this.vm.systemAvailable) {
          Text($r('app.string.ns_pol_restricted'))
            .id('id_app_detail_restricted')
            .fontSize(12)
            .fontColor($r('app.color.warning'))
            .width('100%')
        }
        Row({ space: 8 }) {
          Button($r('app.string.ns_pol_uid_allow'))
            .id('id_app_detail_uid_allow')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(12)
            .fontColor($r('app.color.card_bg'))
            .backgroundColor($r('app.color.brand_primary'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              // Allow metered background traffic for this application.
              this.vm.applyUidPolicy(UidPolicyMode.ALLOW);
            })
          Button($r('app.string.ns_pol_uid_reject'))
            .id('id_app_detail_uid_reject')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(12)
            .fontColor($r('app.color.card_bg'))
            .backgroundColor($r('app.color.brand_primary'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              // Reject metered background traffic for this application.
              this.vm.applyUidPolicy(UidPolicyMode.REJECT);
            })
          Button($r('app.string.ns_pol_uid_clear'))
            .id('id_app_detail_uid_clear')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(12)
            .fontColor($r('app.color.brand_primary'))
            .backgroundColor($r('app.color.brand_light'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              // Clear the per-UID policy back to the default state.
              this.vm.applyUidPolicy(UidPolicyMode.NONE);
            })
        }
        .id('id_app_detail_uid_actions')
        .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  /**
   * Build the per-UID background policy card with the current policy value.
   */
  @Builder
  backgroundCard() {
    SectionCard({
      idPrefix: 'id_app_detail_background',
      title: $r('app.string.ns_pol_background_title')
    }) {
      Column({ space: CARD_SPACE }) {
        InfoRow({
          idPrefix: 'id_app_detail_background_policy',
          label: $r('app.string.ns_pol_background_policy'),
          value: this.vm.bgLoaded ? backgroundPolicyLabel(this.vm.bgPolicy) : $r('app.string.ns_common_dash')
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  /**
   * Build the trust list card with the idle and power save membership rows and the actions.
   */
  @Builder
  trustlistCard() {
    SectionCard({
      idPrefix: 'id_app_detail_trustlist',
      title: $r('app.string.ns_app_detail_trustlist_title')
    }) {
      Column({ space: CARD_SPACE }) {
        InfoRow({
          idPrefix: 'id_app_detail_trustlist_idle',
          label: $r('app.string.ns_pol_trustlist_idle'),
          value: this.vm.trustlistLoaded ? allowedLabel(this.vm.inIdleTrustlist) : $r('app.string.ns_common_dash'),
          valueColor: this.vm.trustlistLoaded ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
        })
        InfoRow({
          idPrefix: 'id_app_detail_trustlist_power',
          label: $r('app.string.ns_pol_trustlist_power'),
          value: this.vm.trustlistLoaded ? allowedLabel(this.vm.inPowerTrustlist) : $r('app.string.ns_common_dash'),
          valueColor: this.vm.trustlistLoaded ? $r('app.color.text_primary') : $r('app.color.text_tertiary')
        })
        // Show the restriction hint when the device is not system-signed.
        if (!this.vm.systemAvailable) {
          Text($r('app.string.ns_pol_restricted'))
            .id('id_app_detail_trustlist_restricted')
            .fontSize(12)
            .fontColor($r('app.color.warning'))
            .width('100%')
        }
        Row({ space: 8 }) {
          Button($r('app.string.ns_app_detail_trustlist_add'))
            .id('id_app_detail_trustlist_add')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(12)
            .fontColor($r('app.color.card_bg'))
            .backgroundColor($r('app.color.brand_primary'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              // Add this application to both trust lists.
              this.vm.applyTrustlist(true);
            })
          Button($r('app.string.ns_app_detail_trustlist_remove'))
            .id('id_app_detail_trustlist_remove')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(12)
            .fontColor($r('app.color.brand_primary'))
            .backgroundColor($r('app.color.brand_light'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              // Remove this application from both trust lists.
              this.vm.applyTrustlist(false);
            })
        }
        .id('id_app_detail_trustlist_actions')
        .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  /**
   * Build the scrollable detail page with the five policy cards and the shared log panel.
   */
  build() {
    Scroll() {
      Column({ space: CARD_SPACE }) {
        this.overviewCard()
        this.accessCard()
        this.uidPolicyCard()
        this.backgroundCard()
        this.trustlistCard()
        LogPanel({
          idPrefix: 'id_app_detail_log',
          logs: this.vm.logs,
          onClear: () => {
            // Clear the detail log list through the view model.
            this.vm.clearLogs();
          }
        })
      }
      .id('id_app_detail_content')
      .width('100%')
      .padding(16)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
    .id('id_app_detail_page')
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .backgroundColor($r('app.color.page_bg'))
  }
}

/**
 * NavDestination wrapper registered by the MainPage route map.
 */
@Builder
export function AppDetailPageBuilder() {
  NavDestination() {
    AppDetailPage()
  }
  .title($r('app.string.ns_app_detail_title'))
  .backgroundColor($r('app.color.page_bg'))
}
