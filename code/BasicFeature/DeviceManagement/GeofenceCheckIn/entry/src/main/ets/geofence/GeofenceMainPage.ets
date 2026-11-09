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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { CheckInRecord, CheckInRecordItem, FenceStatusCard, Logger } from 'library';
import { GeofenceViewModel } from './viewmodel/GeofenceViewModel';
import { StatusRow } from './components/StatusRow';

// Horizontal padding used by the outermost page content column.
const PAGE_PADDING: number = 24;
// Default vertical spacing between stacked cards and list items.
const GUTTER: number = 12;
// Inner padding applied to every card container.
const CARD_PADDING: number = 16;
// Corner radius shared by all card containers.
const CARD_RADIUS: number = 12;
// Spacing used between controls inside rows and columns.
const CONTROLS_SPACE: number = 12;
// Standard height for capsule buttons.
const CONTROL_HEIGHT: number = 40;
// Height of single-line text inputs.
const INPUT_HEIGHT: number = 48;
// Corner radius applied to text inputs.
const INPUT_RADIUS: number = 8;
// Corner radius of small chip-like text actions.
const CHIP_RADIUS: number = 4;
// Horizontal padding of chip-like text actions.
const CHIP_PADDING_H: number = 8;
// Vertical padding of chip-like text actions.
const CHIP_PADDING_V: number = 12;
// Font size used inside text inputs and small buttons.
const INPUT_TEXT_SIZE: number = 14;
// Font size used for secondary labels and hints.
const LABEL_TEXT_SIZE: number = 12;
// Font size used for card titles.
const TITLE_TEXT_SIZE: number = 16;
// Font size used for the page headline.
const HEADLINE_TEXT_SIZE: number = 20;
// Line height used for multi-line body text.
const BODY_LINE_HEIGHT: number = 18;
// Counter that yields unique task ids for hiTraceMeter spans in this file.
let traceTaskIdCounter: number = 0;

/**
 * Main page of the geofence check-in sample.
 *
 * It renders the fence configuration card, the simulation demo card, the
 * permission and service status card and the check-in record history, all
 * driven by one shared GeofenceViewModel instance.
 */
@ComponentV2
export struct GeofenceMainPage {
  // Shared view model that owns every piece of page state.
  @Local vm: GeofenceViewModel = new GeofenceViewModel();

  /**
   * Component lifecycle hook that starts the view model launch flow.
   */
  aboutToAppear(): void {
    // Reserve a unique task id so this trace span can be matched in the profiler.
    const taskId: number = ++traceTaskIdCounter;
    Logger.info('GeofenceMainPage#aboutToAppear: page about to appear, starting view model launch');
    // Open the trace span for the page appear lifecycle.
    hiTraceMeter.startTrace('GeofenceMainPage#aboutToAppear', taskId);
    try {
      // Run the asynchronous launch flow and forward failures to run().
      this.run(this.vm.launch(this.hostContext()));
    } finally {
      // Close the trace span; the async launch body reports through vm.launch itself.
      hiTraceMeter.finishTrace('GeofenceMainPage#aboutToAppear', taskId);
    }
  }

  /**
   * Resolve the host UIAbility context required by permission and fence APIs.
   *
   * @returns The UIAbilityContext hosting this page.
   */
  private hostContext(): common.UIAbilityContext {
    // The host context is obtained through the current UI context.
    return this.getUIContext().getHostContext() as common.UIAbilityContext;
  }

  /**
   * Attach a shared error handler to a page action promise.
   *
   * @param action - Promise returned by a view model business method.
   */
  private run(action: Promise<void>): void {
    // Log unexpected failures so button actions never fail silently.
    action.catch((error: BusinessError) => {
      Logger.error('GeofenceMainPage#run: page action failed: ' + error.code + ', ' + error.message);
    });
  }

  /**
   * Builder that renders the page title and description header.
   */
  @Builder
  private pageHeader() {
    Column({ space: 4 }) {
      // Application title styled as the page headline.
      Text($r('app.string.gc_app_title'))
        .id('id_main_title')
        .fontSize(HEADLINE_TEXT_SIZE)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.gc_text_primary'))
      // Two-line description explaining what the sample does.
      Text($r('app.string.gc_app_desc'))
        .fontSize(LABEL_TEXT_SIZE)
        .lineHeight(BODY_LINE_HEIGHT)
        .fontColor($r('app.color.gc_text_secondary'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    // Stretch the header to full width and left-align its children.
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Builder that renders a shared card title.
   *
   * @param title - Title resource displayed at the top of a card.
   */
  @Builder
  private cardTitle(title: ResourceStr) {
    // Medium-weight title text shared by all cards.
    Text(title)
      .fontSize(TITLE_TEXT_SIZE)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.gc_text_primary'))
  }

  /**
   * Builder that renders the transient status banner while a message exists.
   */
  @Builder
  private messageView() {
    // Render the banner only while the view model holds a message.
    if (this.vm.message !== '') {
      Text(this.vm.message)
        .id('id_status_message')
        .fontSize(LABEL_TEXT_SIZE)
        .lineHeight(BODY_LINE_HEIGHT)
        // Error messages use the danger color, informational ones stay neutral.
        .fontColor(this.vm.messageIsError ? $r('app.color.gc_danger') : $r('app.color.gc_text_secondary'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
    }
  }

  /**
   * Builder that renders the fence configuration card with inputs and actions.
   */
  @Builder
  private configCard() {
    Column({ space: CONTROLS_SPACE }) {
      // Card headline for the configuration section.
      this.cardTitle($r('app.string.gc_app_section_config'))
      // Name input bound to the view model name field.
      TextInput({ text: this.vm.name, placeholder: $r('app.string.gc_app_placeholder_name') })
        .id('id_input_name')
        .height(INPUT_HEIGHT)
        .borderRadius(INPUT_RADIUS)
        .backgroundColor($r('app.color.gc_chip_bg'))
        .fontSize(INPUT_TEXT_SIZE)
        .fontColor($r('app.color.gc_text_primary'))
        .placeholderColor($r('app.color.gc_text_tertiary'))
        .onChange((value: string) => {
          this.vm.name = value;
        })
      // Row grouping the latitude and longitude inputs side by side.
      Row({ space: CONTROLS_SPACE }) {
        // Latitude input bound to the view model latitude text.
        TextInput({ text: this.vm.latitudeText, placeholder: $r('app.string.gc_app_placeholder_latitude') })
          .id('id_input_latitude')
          .type(InputType.NUMBER_DECIMAL)
          .height(INPUT_HEIGHT)
          .borderRadius(INPUT_RADIUS)
          .backgroundColor($r('app.color.gc_chip_bg'))
          .fontSize(INPUT_TEXT_SIZE)
          .fontColor($r('app.color.gc_text_primary'))
          .placeholderColor($r('app.color.gc_text_tertiary'))
          .layoutWeight(1)
          .onChange((value: string) => {
            this.vm.latitudeText = value;
          })
        // Longitude input bound to the view model longitude text.
        TextInput({ text: this.vm.longitudeText, placeholder: $r('app.string.gc_app_placeholder_longitude') })
          .id('id_input_longitude')
          .type(InputType.NUMBER_DECIMAL)
          .height(INPUT_HEIGHT)
          .borderRadius(INPUT_RADIUS)
          .backgroundColor($r('app.color.gc_chip_bg'))
          .fontSize(INPUT_TEXT_SIZE)
          .fontColor($r('app.color.gc_text_primary'))
          .placeholderColor($r('app.color.gc_text_tertiary'))
          .layoutWeight(1)
          .onChange((value: string) => {
            this.vm.longitudeText = value;
          })
      }
      .width('100%')
      // Row grouping the radius input with the locate button.
      Row({ space: CONTROLS_SPACE }) {
        // Radius input bound to the view model radius text.
        TextInput({ text: this.vm.radiusText, placeholder: $r('app.string.gc_app_placeholder_radius') })
          .id('id_input_radius')
          .type(InputType.NUMBER_DECIMAL)
          .height(INPUT_HEIGHT)
          .borderRadius(INPUT_RADIUS)
          .backgroundColor($r('app.color.gc_chip_bg'))
          .fontSize(INPUT_TEXT_SIZE)
          .fontColor($r('app.color.gc_text_primary'))
          .placeholderColor($r('app.color.gc_text_tertiary'))
          .layoutWeight(1)
          .onChange((value: string) => {
            this.vm.radiusText = value;
          })
        // Fills the coordinate inputs from the current device location.
        Button($r('app.string.gc_app_action_use_location'))
          .id('id_btn_use_location')
          .type(ButtonType.Capsule)
          .height(CONTROL_HEIGHT)
          .borderRadius(CONTROL_HEIGHT / 2)
          .padding({ left: 16, right: 16 })
          .fontSize(INPUT_TEXT_SIZE)
          .fontColor($r('app.color.gc_brand_primary'))
          .backgroundColor($r('app.color.gc_brand_light'))
          .enabled(!this.vm.busy)
          .onClick(() => {
            this.run(this.vm.useCurrentLocation(this.hostContext()));
          })
      }
      .width('100%')
      // Row grouping the save action with the fence enable/disable toggle.
      Row({ space: CONTROLS_SPACE }) {
        // Persists the entered configuration after validation.
        Button($r('app.string.gc_app_action_save'))
          .id('id_btn_save_config')
          .type(ButtonType.Capsule)
          .height(CONTROL_HEIGHT)
          .borderRadius(CONTROL_HEIGHT / 2)
          .layoutWeight(1)
          .fontSize(TITLE_TEXT_SIZE)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.gc_brand_primary'))
          .backgroundColor($r('app.color.gc_brand_light'))
          .enabled(!this.vm.busy)
          .onClick(() => {
            this.run(this.vm.saveConfig(this.hostContext()));
          })
        // The toggle switches branch based on the current fence state.
        if (this.vm.enabled) {
          // Removes the fence registration while it is enabled.
          Button($r('app.string.gc_app_action_disable'))
            .id('id_btn_disable_fence')
            .type(ButtonType.Capsule)
            .height(CONTROL_HEIGHT)
            .borderRadius(CONTROL_HEIGHT / 2)
            .layoutWeight(1)
            .fontSize(TITLE_TEXT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.gc_danger'))
            .backgroundColor($r('app.color.gc_danger_light'))
            .enabled(!this.vm.busy)
            .onClick(() => {
              this.run(this.vm.disableFence(this.hostContext()));
            })
        } else {
          // Registers the fence with the current configuration.
          Button($r('app.string.gc_app_action_enable'))
            .id('id_btn_enable_fence')
            .type(ButtonType.Capsule)
            .height(CONTROL_HEIGHT)
            .borderRadius(CONTROL_HEIGHT / 2)
            .layoutWeight(1)
            .fontSize(TITLE_TEXT_SIZE)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.White)
            .backgroundColor($r('app.color.gc_brand_primary'))
            .enabled(!this.vm.busy)
            .onClick(() => {
              this.run(this.vm.enableFence(this.hostContext()));
            })
        }
      }
      .width('100%')
      // Transient status banner shown under the action buttons.
      this.messageView()
    }
    // Card container styling shared by all cards.
    .width('100%')
    .padding(CARD_PADDING)
    .backgroundColor($r('app.color.gc_card_bg'))
    .borderRadius(CARD_RADIUS)
    .id('id_config_card')
  }

  /**
   * Builder that renders the simulation demo card.
   */
  @Builder
  private demoCard() {
    Column({ space: CONTROLS_SPACE }) {
      // Card headline for the demo section.
      this.cardTitle($r('app.string.gc_app_section_demo'))
      // Short hint explaining what the simulation buttons do.
      Text($r('app.string.gc_app_demo_desc'))
        .fontSize(LABEL_TEXT_SIZE)
        .lineHeight(BODY_LINE_HEIGHT)
        .fontColor($r('app.color.gc_text_secondary'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      // Row grouping the enter and exit simulation buttons.
      Row({ space: CONTROLS_SPACE }) {
        // Simulates an enter transition to create a demo check-in.
        Button($r('app.string.gc_app_action_simulate_enter'))
          .id('id_btn_simulate_enter')
          .type(ButtonType.Capsule)
          .height(CONTROL_HEIGHT)
          .borderRadius(CONTROL_HEIGHT / 2)
          .layoutWeight(1)
          .fontSize(INPUT_TEXT_SIZE)
          .fontColor($r('app.color.gc_brand_primary'))
          .backgroundColor($r('app.color.gc_brand_light'))
          .enabled(this.vm.hasConfig && !this.vm.busy)
          .onClick(() => {
            this.run(this.vm.simulateEnter(this.hostContext()));
          })
        // Simulates an exit transition to close the demo check-in.
        Button($r('app.string.gc_app_action_simulate_exit'))
          .id('id_btn_simulate_exit')
          .type(ButtonType.Capsule)
          .height(CONTROL_HEIGHT)
          .borderRadius(CONTROL_HEIGHT / 2)
          .layoutWeight(1)
          .fontSize(INPUT_TEXT_SIZE)
          .fontColor($r('app.color.gc_brand_primary'))
          .backgroundColor($r('app.color.gc_brand_light'))
          .enabled(this.vm.hasConfig && !this.vm.busy)
          .onClick(() => {
            this.run(this.vm.simulateExit(this.hostContext()));
          })
      }
      .width('100%')
    }
    // Card container styling for the demo section.
    .width('100%')
    .padding(CARD_PADDING)
    .backgroundColor($r('app.color.gc_card_bg'))
    .borderRadius(CARD_RADIUS)
  }

  /**
   * Builder that renders the permission and service status card.
   */
  @Builder
  private permissionCard() {
    Column({ space: CONTROLS_SPACE }) {
      // Header row holding the card title and a refresh shortcut.
      Row() {
        this.cardTitle($r('app.string.gc_app_section_permission'))
        // Spacer pushing the refresh action to the trailing edge.
        Blank()
        // Reloads every permission and service state when tapped.
        Text($r('app.string.gc_app_action_refresh'))
          .id('id_btn_refresh')
          .fontSize(LABEL_TEXT_SIZE)
          .fontColor($r('app.color.gc_brand_primary'))
          .padding({
            left: CHIP_PADDING_H,
            right: CHIP_PADDING_H,
            top: CHIP_PADDING_V,
            bottom: CHIP_PADDING_V
          })
          .borderRadius(CHIP_RADIUS)
          .onClick(() => {
            this.run(this.vm.refreshData(this.hostContext()));
          })
      }
      .width('100%')

      // Foreground location permission row with a grant action while missing.
      StatusRow({
        label: $r('app.string.gc_app_permission_foreground'),
        statusText: this.vm.foregroundGranted ? $r('app.string.gc_app_status_granted') :
          $r('app.string.gc_app_status_missing'),
        positive: this.vm.foregroundGranted,
        actionable: !this.vm.foregroundGranted,
        actionId: 'id_btn_permission_foreground',
        onAction: () => {
          this.run(this.vm.requestForegroundPermission(this.hostContext()));
        }
      })
      Divider().color($r('app.color.gc_divider'))
      // Background location permission row with a grant action while missing.
      StatusRow({
        label: $r('app.string.gc_app_permission_background'),
        statusText: this.vm.backgroundGranted ? $r('app.string.gc_app_status_granted') :
          $r('app.string.gc_app_status_missing'),
        positive: this.vm.backgroundGranted,
        actionable: !this.vm.backgroundGranted,
        actionId: 'id_btn_permission_background',
        onAction: () => {
          this.run(this.vm.requestBackgroundPermission(this.hostContext()));
        }
      })
      Divider().color($r('app.color.gc_divider'))
      // Notification permission row with an enable action while off.
      StatusRow({
        label: $r('app.string.gc_app_permission_notification'),
        statusText: this.vm.notificationEnabled ? $r('app.string.gc_app_status_on') :
          $r('app.string.gc_app_status_off'),
        positive: this.vm.notificationEnabled,
        actionable: !this.vm.notificationEnabled,
        actionId: 'id_btn_permission_notification',
        onAction: () => {
          this.run(this.vm.requestNotificationPermission(this.hostContext()));
        }
      })
      Divider().color($r('app.color.gc_divider'))
      // Read-only row showing the system location service switch state.
      StatusRow({
        label: $r('app.string.gc_app_status_location_service'),
        statusText: this.vm.locationEnabled ? $r('app.string.gc_app_status_on') :
          $r('app.string.gc_app_status_off'),
        positive: this.vm.locationEnabled
      })
      Divider().color($r('app.color.gc_divider'))
      // Read-only row showing whether the device supports geofences.
      StatusRow({
        label: $r('app.string.gc_app_status_capability'),
        statusText: this.vm.capabilitySupported ? $r('app.string.gc_app_status_supported') :
          $r('app.string.gc_app_status_unsupported'),
        positive: this.vm.capabilitySupported
      })
    }
    // Card container styling shared by all cards.
    .width('100%')
    .padding(CARD_PADDING)
    .backgroundColor($r('app.color.gc_card_bg'))
    .borderRadius(CARD_RADIUS)
    .id('id_permission_card')
  }

  /**
   * Builder that renders the check-in record history section.
   */
  @Builder
  private recordsSection() {
    Column({ space: CONTROLS_SPACE }) {
      // Section header with the record count and a clear shortcut.
      Row() {
        Text($r('app.string.gc_app_section_records'))
          .fontSize(TITLE_TEXT_SIZE)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.gc_text_primary'))
        // Shows how many records are currently stored.
        Text(this.vm.records.length.toString())
          .fontSize(LABEL_TEXT_SIZE)
          .fontColor($r('app.color.gc_text_tertiary'))
          .margin({ left: CHIP_PADDING_H })
        Blank()
        // Clears all records; disabled while the list is empty or busy.
        Text($r('app.string.gc_app_action_clear'))
          .id('id_btn_clear_records')
          .fontSize(LABEL_TEXT_SIZE)
          .fontColor($r('app.color.gc_danger'))
          .padding({
            left: CHIP_PADDING_H,
            right: CHIP_PADDING_H,
            top: CHIP_PADDING_V,
            bottom: CHIP_PADDING_V
          })
          .borderRadius(CHIP_RADIUS)
          .enabled(this.vm.records.length > 0 && !this.vm.busy)
          .onClick(() => {
            this.run(this.vm.clearRecords(this.hostContext()));
          })
      }
      .width('100%')

      // Empty-state placeholder shown when no records exist.
      if (this.vm.records.length === 0) {
        Column() {
          Text($r('app.string.gc_app_records_empty'))
            .fontSize(INPUT_TEXT_SIZE)
            .fontColor($r('app.color.gc_text_tertiary'))
        }
        .width('100%')
        .padding({ top: PAGE_PADDING, bottom: PAGE_PADDING })
        .backgroundColor($r('app.color.gc_card_bg'))
        .borderRadius(CARD_RADIUS)
        .id('id_records_empty')
      } else {
        // Record list built with Repeat for efficient item reuse.
        Column({ space: GUTTER }) {
          Repeat<CheckInRecord>(this.vm.records)
            .each((repeatItem: RepeatItem<CheckInRecord>) => {
              CheckInRecordItem({ record: repeatItem.item })
            })
            .key((item: CheckInRecord) => item.id.toString())
        }
        .width('100%')
        .id('id_record_list')
      }
    }
    .width('100%')
  }

  /**
   * Build the page layout with a scrollable responsive grid of cards.
   */
  build() {
    Column() {
      // Scrollable content area so long pages remain usable.
      Scroll() {
        Column({ space: GUTTER }) {
          // Page header with title and description.
          this.pageHeader()
          // Responsive grid splitting content into two columns on wide screens.
          GridRow({
            columns: { sm: 4, md: 8, lg: 12 },
            gutter: { x: GUTTER, y: GUTTER }
          }) {
            // Left column holding the configuration and demo cards.
            GridCol({ span: { sm: 4, md: 4, lg: 6 } }) {
              Column({ space: GUTTER }) {
                this.configCard()
                this.demoCard()
              }
              .width('100%')
            }
            // Right column holding the status, permission and record cards.
            GridCol({ span: { sm: 4, md: 4, lg: 6 } }) {
              Column({ space: GUTTER }) {
                Column() {
                  // Today summary card fed by the view model counters.
                  FenceStatusCard({
                    fenceEnabled: this.vm.enabled,
                    summary: { count: this.vm.todayCount, durationMs: this.vm.todayDurationMs }
                  })
                }
                // Container giving the status card a stable test id.
                .width('100%')
                .id('id_status_card')
                this.permissionCard()
                this.recordsSection()
              }
              .width('100%')
            }
          }
          .width('100%')
        }
        .width('100%')
        .padding({
          left: PAGE_PADDING,
          right: PAGE_PADDING,
          top: PAGE_PADDING,
          bottom: PAGE_PADDING
        })
      }
      // Scroll area takes the remaining height and hides its scroll bar.
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
      .id('id_main_scroll')
    }
    // Root container fills the window with the themed page background.
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.gc_page_bg'))
    .id('id_main_page')
  }
}
