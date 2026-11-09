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

import { emitter } from '@kit.BasicServicesKit';
import { AppInfoItem, InfoRow, LogPanel, PolicyEventItem, QuotaView, SectionCard, SwitchRow, allowedLabel,
  formatBytes, joinNumbers, limitActionLabel } from 'library';
import { NsNav } from './AppListPage';
import { AppListViewModel } from '../viewmodel/AppListViewModel';
import { NS_TRUSTLIST_DIRTY_EVENT, PolicyViewModel } from '../viewmodel/PolicyViewModel';

// Spacing between cards and inner sections.
const CARD_SPACE: number = 12;
// Page-level padding of the scroll content.
const PAGE_PADDING: number = 16;
// Spacing between rows and buttons inside a card.
const ROW_SPACE: number = 12;
// Maximum height of the policy event list.
const EVENT_LIST_HEIGHT: number = 180;

/**
 * Network policy page.
 * Most @ohos.net.policy APIs are @systemapi and need ohos.permission.MANAGE_NET_STRATEGY (system_basic),
 * a Full SDK and a system signature. Only getNetAccessPolicy() and showAppNetPolicySettings() are public,
 * so every system call is guarded by the view model and degrades into a log entry instead of a crash.
 */
@ComponentV2
export struct PolicyPage {
  // View model that holds all policy state and log entries.
  @Local vm: PolicyViewModel = new PolicyViewModel();
  // View model of the application picker shown in the trust list card sheet.
  pickerVm: AppListViewModel = new AppListViewModel();
  // Whether the application picker sheet is visible.
  @Local showPicker: boolean = false;

  /**
   * Bind the ability context to the view model and start the initial load.
   */
  aboutToAppear(): void {
    // Fetch the host context of the page for the view model.
    const context = this.getUIContext().getHostContext();
    // Bind only when the host context is available.
    if (context !== undefined) {
      this.vm.bind(context);
    }
    // This tab stays resident, so trust list changes from the detail page arrive through the emitter.
    emitter.on({ eventId: NS_TRUSTLIST_DIRTY_EVENT }, () => {
      // Refresh the trust list view after a detail page apply.
      this.vm.readTrustlist();
    });
  }

  /**
   * Stop the policy event listeners when the page disappears.
   */
  aboutToDisappear(): void {
    // Detach the listeners so they never leak with the page.
    this.vm.stopEvents();
    // Detach the trust list dirty listener as well.
    emitter.off(NS_TRUSTLIST_DIRTY_EVENT);
  }

  /**
   * Provide the brand color used by secondary buttons on this page.
   * @returns the brand primary color resource.
   */
  private secondaryColor(): ResourceColor {
    return $r('app.color.brand_primary');
  }

  /**
   * Build the notice card showing the system API availability status.
   */
  @Builder
  noticeCard() {
    SectionCard({
      idPrefix: 'id_policy_notice',
      title: $r('app.string.ns_pol_notice_title'),
      subtitle: $r('app.string.ns_pol_notice_desc')
    }) {
      Row({ space: ROW_SPACE }) {
        Text($r('app.string.ns_pol_status'))
          .id('id_policy_notice_status_label')
          .fontSize(12)
          .fontColor($r('app.color.text_tertiary'))
        Text(this.vm.systemAvailable ? $r('app.string.ns_pol_system_ok') : $r('app.string.ns_pol_restricted'))
          .id('id_policy_notice_status')
          .fontSize(12)
          .fontColor(this.vm.systemAvailable ? $r('app.color.success') : $r('app.color.warning'))
          .layoutWeight(1)
          .textAlign(TextAlign.End)
      }
      .id('id_policy_notice_status_row')
      .width('100%')
    }
  }

  /**
   * Build the background network policy card body with the switch and query actions.
   */
  @Builder
  backgroundContent() {
    Column({ space: CARD_SPACE }) {
      SwitchRow({
        idPrefix: 'id_policy_background_allow',
        label: $r('app.string.ns_pol_background_allow'),
        description: $r('app.string.ns_pol_background_allow_desc'),
        isOn: this.vm.background.allowed,
        active: !this.vm.busy,
        onToggle: (value: boolean) => {
          // Forward the switch value to the view model.
          this.vm.toggleBackground(value);
        }
      })
    }
    .id('id_policy_background_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Open the application picker sheet and refresh the installed application list.
   */
  openPicker(): void {
    // Show the picker sheet bound to the trust list card.
    this.showPicker = true;
    // Bind the host context so the picker load can request the runtime permission.
    const context = this.getUIContext().getHostContext();
    // Load or refresh the installed application list for the picker.
    this.pickerVm.load(context);
  }

  /**
   * Fill the tapped application UID into the trust list input.
   * @param uid application UID picked from the sheet.
   */
  pickApp(uid: number): void {
    // Close the picker sheet.
    this.showPicker = false;
    // Fill the picked UID into the trust list input without triggering any query.
    this.vm.trustlistUid = uid.toString();
  }

  /**
   * Build the searchable application picker sheet bound to the trust list card.
   */
  @Builder
  pickerSheet() {
    Column({ space: CARD_SPACE }) {
      Text($r('app.string.ns_app_detail_select'))
        .id('id_policy_picker_title')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
        .width('100%')

      TextInput({ placeholder: $r('app.string.ns_app_list_search') })
        .id('id_policy_picker_search')
        .height($r('app.float.control_height'))
        .fontSize(14)
        .fontColor($r('app.color.text_primary'))
        .placeholderColor($r('app.color.text_tertiary'))
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(8)
        .width('100%')
        .onChange((value: string) => {
          // Forward the keyword to the picker view model filter.
          this.pickerVm.filter(value);
        })

      // Show the loading hint while the list load is running.
      if (this.pickerVm.busy && !this.pickerVm.loaded) {
        Text($r('app.string.ns_app_list_loading'))
          .id('id_policy_picker_loading')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
      } else if (!this.pickerVm.loaded) {
        // Show the restriction hint on non-system-signed devices.
        Text(this.pickerVm.message)
          .id('id_policy_picker_message')
          .fontSize(14)
          .fontColor($r('app.color.warning'))
          .width('100%')
      } else if (this.pickerVm.filtered.length === 0) {
        // Show the empty hint when no application matches the keyword.
        Text($r('app.string.ns_app_list_empty'))
          .id('id_policy_picker_empty')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
      } else {
        List({ space: 4 }) {
          Repeat<AppInfoItem>(this.pickerVm.filtered)
            .each((repeatItem: RepeatItem<AppInfoItem>) => {
              ListItem() {
                Row({ space: ROW_SPACE }) {
                  Column({ space: 2 }) {
                    Text(repeatItem.item.appName)
                      .id('id_policy_picker_name_' + repeatItem.item.uid.toString())
                      .fontSize(14)
                      .fontColor($r('app.color.text_primary'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text(repeatItem.item.bundleName)
                      .id('id_policy_picker_bundle_' + repeatItem.item.uid.toString())
                      .fontSize(12)
                      .fontColor($r('app.color.text_tertiary'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                  }
                  .alignItems(HorizontalAlign.Start)
                  .layoutWeight(1)

                  Text('uid ' + repeatItem.item.uid.toString())
                    .id('id_policy_picker_uid_' + repeatItem.item.uid.toString())
                    .fontSize(12)
                    .fontColor($r('app.color.text_tertiary'))
                }
                .id('id_policy_picker_row_' + repeatItem.item.uid.toString())
                .width('100%')
                .height(48)
                .onClick(() => {
                  // Fill the picked UID and run the query.
                  this.pickApp(repeatItem.item.uid);
                })
              }
            })
            .key((item: AppInfoItem) => item.uid.toString())
        }
        .id('id_policy_picker_list')
        .width('100%')
        .layoutWeight(1)
        .divider({ strokeWidth: 0.5, color: $r('app.color.divider') })
        .scrollBar(BarState.Off)
      }
    }
    .id('id_policy_picker_sheet')
    .width('100%')
    .height('100%')
    .padding(PAGE_PADDING)
    .backgroundColor($r('app.color.page_bg'))
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build one quota policy item showing the warning, limit and period details.
   * @param item quota view model of one policy entry.
   * @param index position of the item used for ids and ordering.
   */
  @Builder
  quotaRow(item: QuotaView, index: number) {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text($r('app.string.ns_pol_quota_item'))
          .id('id_policy_quota_item_title_' + index.toString())
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
        Text((index + 1).toString())
          .id('id_policy_quota_item_index_' + index.toString())
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_secondary'))
      }
      .id('id_policy_quota_item_header_' + index.toString())
      .width('100%')
      InfoRow({
        idPrefix: 'id_policy_quota_item_warning_' + index.toString(),
        label: $r('app.string.ns_pol_quota_warning'),
        value: formatBytes(item.warningBytes)
      })
      InfoRow({
        idPrefix: 'id_policy_quota_item_limit_' + index.toString(),
        label: $r('app.string.ns_pol_quota_limit'),
        value: formatBytes(item.limitBytes)
      })
      InfoRow({
        idPrefix: 'id_policy_quota_item_action_' + index.toString(),
        label: $r('app.string.ns_pol_quota_action'),
        value: limitActionLabel(item.limitAction)
      })
      InfoRow({
        idPrefix: 'id_policy_quota_item_period_' + index.toString(),
        label: $r('app.string.ns_pol_quota_period'),
        value: item.periodDuration
      })
      InfoRow({
        idPrefix: 'id_policy_quota_item_metered_' + index.toString(),
        label: $r('app.string.ns_pol_quota_metered'),
        value: allowedLabel(item.metered)
      })
    }
    .id('id_policy_quota_item_' + index.toString())
    .width('100%')
    .padding({ top: 8, bottom: 8 })
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the quota policy card body with apply, reset and restore actions.
   */
  @Builder
  quotaContent() {
    Column({ space: CARD_SPACE }) {
      Row({ space: ROW_SPACE }) {
        Button($r('app.string.ns_pol_quota_apply'))
          .id('id_policy_quota_apply')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Apply the demo quota policy and refresh the list.
            this.vm.applyQuota();
          })
        Button($r('app.string.ns_common_query'))
          .id('id_policy_quota_read')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor(this.secondaryColor())
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Re-read the quota policies from the system.
            this.vm.readQuota();
          })
      }
      .id('id_policy_quota_actions_top')
      .width('100%')

      Row({ space: ROW_SPACE }) {
        Button($r('app.string.ns_pol_quota_reset'))
          .id('id_policy_quota_reset')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor(this.secondaryColor())
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Remove all quota policies of the default SIM.
            this.vm.resetQuota();
          })
        Button($r('app.string.ns_pol_quota_restore'))
          .id('id_policy_quota_restore')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor(this.secondaryColor())
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Restore the quota policies removed by the reset action.
            this.vm.restoreQuota();
          })
      }
      .id('id_policy_quota_actions_bottom')
      .width('100%')

      Text($r('app.string.ns_pol_quota_list'))
        .id('id_policy_quota_list_title')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
        .width('100%')

      // Render the quota list only when a loaded policy contains items.
      if (this.vm.quota.loaded && this.vm.quota.items.length > 0) {
        Column() {
          Repeat<QuotaView>(this.vm.quota.items)
            .each((repeatItem: RepeatItem<QuotaView>) => {
              this.quotaRow(repeatItem.item, repeatItem.index);
            })
            .key((item: QuotaView, index: number) => index.toString())
        }
        .id('id_policy_quota_list')
        .width('100%')
      } else {
        Text(this.vm.quota.loaded ? $r('app.string.ns_pol_quota_empty') : this.vm.quota.message)
          .id('id_policy_quota_empty')
          .fontSize(12)
          .fontColor(this.vm.quota.loaded ? $r('app.color.text_tertiary') : $r('app.color.warning'))
          .width('100%')
      }
    }
    .id('id_policy_quota_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the trust list card body with apply and read actions.
   */
  @Builder
  trustlistContent() {
    Column({ space: CARD_SPACE }) {
      TextInput({ text: this.vm.trustlistUid, placeholder: $r('app.string.ns_pol_uid_input') })
        .id('id_policy_trustlist_input')
        .height($r('app.float.control_height'))
        .fontSize(14)
        .fontColor($r('app.color.text_primary'))
        .placeholderColor($r('app.color.text_tertiary'))
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(8)
        .type(InputType.Number)
        .width('100%')
        .onChange((value: string) => {
          // Keep the manually typed UID in the view model for the apply action.
          this.vm.trustlistUid = value;
        })
      Button($r('app.string.ns_app_detail_select'))
        .id('id_policy_trustlist_pick')
        .width('100%')
        .height($r('app.float.control_height'))
        .fontSize(14)
        .fontColor(this.secondaryColor())
        .backgroundColor($r('app.color.brand_light'))
        .borderRadius(20)
        .onClick(() => {
          // Open the searchable application picker sheet.
          this.openPicker();
        })

      Row({ space: ROW_SPACE }) {
        Button($r('app.string.ns_pol_trustlist_apply'))
          .id('id_policy_trustlist_apply')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Add the entered UID to both system trust lists.
            this.vm.applyTrustlist();
          })
        Button($r('app.string.ns_common_query'))
          .id('id_policy_trustlist_read')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(14)
          .fontColor(this.secondaryColor())
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Re-read the device idle and power save trust lists.
            this.vm.readTrustlist();
          })
      }
      .id('id_policy_trustlist_actions')
      .width('100%')

      InfoRow({
        idPrefix: 'id_policy_trustlist_uid',
        label: $r('app.string.ns_pol_trustlist_uid_label'),
        value: this.vm.trustlistUid.length > 0 ? this.vm.trustlistUid : $r('app.string.ns_common_dash')
      })
      InfoRow({
        idPrefix: 'id_policy_trustlist_idle',
        label: $r('app.string.ns_pol_trustlist_idle'),
        value: this.vm.trustlist.loaded ? joinNumbers(this.vm.trustlist.deviceIdle) :
          $r('app.string.ns_common_dash')
      })
      InfoRow({
        idPrefix: 'id_policy_trustlist_power',
        label: $r('app.string.ns_pol_trustlist_power'),
        value: this.vm.trustlist.loaded ? joinNumbers(this.vm.trustlist.powerSave) :
          $r('app.string.ns_common_dash')
      })
    }
    .id('id_policy_trustlist_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build one policy event row showing the time, type and message.
   * @param item event view model rendered by this row.
   */
  @Builder
  eventRow(item: PolicyEventItem) {
    Row({ space: 8 }) {
      Text(item.time)
        .id('id_policy_event_time_' + item.id.toString())
        .fontSize(12)
        .fontColor($r('app.color.text_tertiary'))
      Text(item.type)
        .id('id_policy_event_type_' + item.id.toString())
        .fontSize(12)
        .fontColor($r('app.color.brand_primary'))
      // Render the payload UID as a tappable link when the event carries one.
      if (item.uid !== undefined) {
        Text('uid ' + item.uid.toString())
          .id('id_policy_event_uid_' + item.id.toString())
          .fontSize(12)
          .fontColor($r('app.color.brand_primary'))
          .onClick(() => {
            // Guard the optional uid before opening the detail page.
            if (item.uid !== undefined) {
              // Open the detail page of the application behind the event.
              NsNav.pushAppDetail(item.uid, '', '');
            }
          })
      }
      Text(item.text)
        .id('id_policy_event_text_' + item.id.toString())
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .layoutWeight(1)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .id('id_policy_event_row_' + item.id.toString())
    .width('100%')
    .padding({ top: 4, bottom: 4 })
    .alignItems(VerticalAlign.Top)
  }

  /**
   * Build the policy event card body with the start/stop toggle and event list.
   */
  @Builder
  eventContent() {
    Column({ space: CARD_SPACE }) {
      Button(this.vm.eventListening ? $r('app.string.ns_pol_event_stop') : $r('app.string.ns_pol_event_start'))
        .id('id_policy_event_toggle')
        .width('100%')
        .height($r('app.float.control_height'))
        .fontSize(14)
        .fontColor(this.vm.eventListening ? $r('app.color.card_bg') : this.secondaryColor())
        .backgroundColor(this.vm.eventListening ? $r('app.color.brand_primary') : $r('app.color.brand_light'))
        .borderRadius(20)
        .enabled(!this.vm.busy)
        .onClick(() => {
          // Start or stop the policy event listeners.
          this.vm.toggleEvents();
        })

      // Show the empty hint until the first event arrives.
      if (this.vm.events.length === 0) {
        Text($r('app.string.ns_pol_event_empty'))
          .id('id_policy_event_empty')
          .fontSize(12)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
      } else {
        List({ space: 4 }) {
          Repeat<PolicyEventItem>(this.vm.events)
            .each((repeatItem: RepeatItem<PolicyEventItem>) => {
              ListItem() {
                this.eventRow(repeatItem.item)
              }
            })
            .key((item: PolicyEventItem) => item.id.toString())
        }
        .id('id_policy_event_list')
        .width('100%')
        .constraintSize({ maxHeight: EVENT_LIST_HEIGHT })
        .divider({ strokeWidth: 0.5, color: $r('app.color.divider') })
        .scrollBar(BarState.Off)
      }
    }
    .id('id_policy_event_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the scrollable policy page with four demo sections and the shared log panel.
   */
  build() {
    Scroll() {
      Column({ space: CARD_SPACE }) {
        this.noticeCard()

        Row({ space: ROW_SPACE }) {
          Button($r('app.string.ns_app_list_title'))
            .id('id_policy_app_list_entry')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(14)
            .fontColor($r('app.color.brand_primary'))
            .backgroundColor($r('app.color.brand_light'))
            .borderRadius(20)
            .onClick(() => {
              // Open the installed application list page.
              NsNav.pushAppList();
            })
          Button($r('app.string.ns_pol_access_settings'))
            .id('id_policy_access_settings')
            .layoutWeight(1)
            .height($r('app.float.control_height'))
            .fontSize(14)
            .fontColor($r('app.color.card_bg'))
            .backgroundColor($r('app.color.brand_primary'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              // Jump to the system network access settings page.
              this.vm.openSettings();
            })
        }
        .id('id_policy_entry_actions')
        .width('100%')

        SectionCard({
          idPrefix: 'id_policy_background',
          title: $r('app.string.ns_pol_background_title'),
          subtitle: $r('app.string.ns_pol_background_desc')
        }) {
          this.backgroundContent()
        }

        SectionCard({
          idPrefix: 'id_policy_quota',
          title: $r('app.string.ns_pol_quota_title'),
          subtitle: $r('app.string.ns_pol_quota_desc')
        }) {
          this.quotaContent()
        }

        SectionCard({
          idPrefix: 'id_policy_trustlist',
          title: $r('app.string.ns_pol_trustlist_title'),
          subtitle: $r('app.string.ns_pol_trustlist_desc')
        }) {
          this.trustlistContent()
        }

        SectionCard({
          idPrefix: 'id_policy_event',
          title: $r('app.string.ns_pol_event_title'),
          subtitle: $r('app.string.ns_pol_event_desc')
        }) {
          this.eventContent()
        }

        LogPanel({
          idPrefix: 'id_policy_log',
          logs: this.vm.logs,
          onClear: () => {
            // Clear the policy log list through the view model.
            this.vm.clearLogs();
          }
        })
      }
      .id('id_policy_content')
      .width('100%')
      .padding(PAGE_PADDING)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
    .id('id_policy_page')
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .backgroundColor($r('app.color.page_bg'))
    .bindSheet(this.showPicker, this.pickerSheet(), { height: 420, showClose: true })
  }
}
