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

import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import Logger from '../util/Logger';
import { CommonEventConstants, EventSource, SourceLabel, StatusLabel, UiConstants } from '../util/Constants';
import { EventRecord } from '../feature/EventRecordManager';
import { EventRecordStore } from '../feature/EventRecordStore';
import { HomeStateModel, HomeStatus } from '../feature/HomeStateModel';
import { SubscriptionManager } from '../feature/SubscriptionManager';

/**
 * Home page that publishes the custom common event and shows the events received by this sample.
 */
@Entry
@Component
struct Index {
  @State isSubscribed: boolean = false;
  @State isOperating: boolean = false;
  @State statusText: ResourceStr = $r('app.string.status_ready');
  @State receivedCount: number = 0;
  @State lastEventData: string = '';
  @State lastEventSource: ResourceStr = $r('app.string.value_none');
  @State records: EventRecord[] = [];
  private model: HomeStateModel = new HomeStateModel();

  aboutToAppear(): void {
    Logger.show('Index');
    this.subscribeEvent();
    this.restoreRecords();
  }

  aboutToDisappear(): void {
    Logger.hide('Index');
    this.model.persist();
    this.unsubscribeEvent();
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Text($r('app.string.index_title'))
            .id('home_title')
            .fontSize(UiConstants.TITLE_FONT_SIZE)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.primary_text'))
            .width(UiConstants.FULL_WIDTH_PERCENT)
            .textAlign(TextAlign.Start)
          Text($r('app.string.index_description'))
            .id('home_description')
            .fontSize(UiConstants.BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
            .width(UiConstants.FULL_WIDTH_PERCENT)
            .margin({ top: UiConstants.ITEM_SPACING })
            .textAlign(TextAlign.Start)
          this.InfoCard()
          this.StatusCard()
          this.ActionArea()
          this.RecordList()
        }
        .width(UiConstants.FULL_WIDTH_PERCENT)
          .constraintSize({ maxWidth: UiConstants.CONTENT_MAX_WIDTH })
          .padding(UiConstants.PAGE_PADDING)
          .alignItems(HorizontalAlign.Start)
      }
      .width(UiConstants.FULL_WIDTH_PERCENT)
        .height(UiConstants.FULL_HEIGHT_PERCENT)
        .align(Alignment.Top)
        .scrollBar(BarState.Auto)
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
      .height(UiConstants.FULL_HEIGHT_PERCENT)
      .backgroundColor($r('app.color.page_background'))
  }

  /**
   * Shows the event contract that is shared with the host application.
   */
  @Builder
  InfoCard() {
    Column() {
      Text($r('app.string.info_section_title'))
        .fontSize(UiConstants.CARD_TITLE_FONT_SIZE)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.primary_text'))
        .width(UiConstants.FULL_WIDTH_PERCENT)
      this.InfoRow($r('app.string.label_event_name'), CommonEventConstants.EVENT_NAME, 'event_name_text')
      this.InfoRow($r('app.string.label_bundle_name'), CommonEventConstants.BUNDLE_NAME, 'publisher_text')
      this.InfoRow($r('app.string.label_form_name'), CommonEventConstants.FORM_NAME, 'widget_text')
      this.InfoRow($r('app.string.label_permission'), 'ohos.permission.REQUIRE_FORM', 'permission_text')
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
      .padding(UiConstants.CARD_PADDING)
      .borderRadius(UiConstants.CARD_RADIUS)
      .backgroundColor($r('app.color.card_background'))
      .margin({ top: UiConstants.SECTION_SPACING })
      .alignItems(HorizontalAlign.Start)
  }

  /**
   * Shows the subscription state and the latest received event.
   */
  @Builder
  StatusCard() {
    Column() {
      Text($r('app.string.status_section_title'))
        .fontSize(UiConstants.CARD_TITLE_FONT_SIZE)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.primary_text'))
        .width(UiConstants.FULL_WIDTH_PERCENT)
      Row() {
        Text($r('app.string.label_subscribe_state'))
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.LABEL_WIDTH)
        Text(this.isSubscribed ? $r('app.string.value_subscribed') : $r('app.string.value_unsubscribed'))
          .id('subscribe_state_text')
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor(this.isSubscribed ? $r('app.color.state_active') : $r('app.color.secondary_text'))
          .layoutWeight(1)
      }
      .width(UiConstants.FULL_WIDTH_PERCENT)
        .margin({ top: UiConstants.ITEM_SPACING })
      Row() {
        Text($r('app.string.label_received_count'))
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.LABEL_WIDTH)
        Text(this.receivedCount.toString())
          .id('received_count_text')
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.primary_text'))
          .layoutWeight(1)
      }
      .width(UiConstants.FULL_WIDTH_PERCENT)
        .margin({ top: UiConstants.ITEM_SPACING })
      Row() {
        Text($r('app.string.label_last_event'))
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.LABEL_WIDTH)
        Text(this.lastEventData.length === 0 ? $r('app.string.value_none') : this.lastEventData)
          .id('last_event_data_text')
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.primary_text'))
          .layoutWeight(1)
      }
      .width(UiConstants.FULL_WIDTH_PERCENT)
        .margin({ top: UiConstants.ITEM_SPACING })
      Row() {
        Text($r('app.string.label_source'))
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.LABEL_WIDTH)
        Text(this.lastEventSource)
          .id('last_event_source_text')
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.primary_text'))
          .layoutWeight(1)
      }
      .width(UiConstants.FULL_WIDTH_PERCENT)
        .margin({ top: UiConstants.ITEM_SPACING })
      Text(this.statusText)
        .id('status_text')
        .fontSize(UiConstants.CAPTION_FONT_SIZE)
        .fontColor($r('app.color.secondary_text'))
        .width(UiConstants.FULL_WIDTH_PERCENT)
        .margin({ top: UiConstants.ITEM_SPACING })
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
      .padding(UiConstants.CARD_PADDING)
      .borderRadius(UiConstants.CARD_RADIUS)
      .backgroundColor($r('app.color.card_background'))
      .margin({ top: UiConstants.SECTION_SPACING })
      .alignItems(HorizontalAlign.Start)
  }

  /**
   * Provides the subscribe, publish and clear operations.
   */
  @Builder
  ActionArea() {
    Column() {
      Row() {
        Button(this.isSubscribed ? $r('app.string.unsubscribe_button') : $r('app.string.subscribe_button'))
          .id('subscribe_button')
          .height(UiConstants.BUTTON_HEIGHT)
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .backgroundColor($r('app.color.secondary_button_background'))
          .fontColor($r('app.color.secondary_button_font'))
          .layoutWeight(1)
          .onClick(() => {
            this.toggleSubscription();
          })
        Button($r('app.string.publish_button'))
          .id('publish_button')
          .height(UiConstants.BUTTON_HEIGHT)
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .backgroundColor($r('app.color.primary_button_background'))
          .fontColor($r('app.color.primary_button_font'))
          .enabled(!this.isOperating)
          .layoutWeight(1)
          .margin({ left: UiConstants.ITEM_SPACING })
          .onClick(() => {
            this.publishEvent();
          })
      }
      .width(UiConstants.FULL_WIDTH_PERCENT)

      Button($r('app.string.clear_button'))
        .id('clear_button')
        .height(UiConstants.BUTTON_HEIGHT)
        .width(UiConstants.FULL_WIDTH_PERCENT)
        .fontSize(UiConstants.BODY_FONT_SIZE)
        .backgroundColor($r('app.color.secondary_button_background'))
        .fontColor($r('app.color.secondary_button_font'))
        .margin({ top: UiConstants.ITEM_SPACING })
        .onClick(() => {
          this.clearRecords();
        })
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
      .margin({ top: UiConstants.SECTION_SPACING })
  }

  /**
   * Shows the received events in arrival order.
   */
  @Builder
  RecordList() {
    Column() {
      Text($r('app.string.records_section_title'))
        .fontSize(UiConstants.CARD_TITLE_FONT_SIZE)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.primary_text'))
        .width(UiConstants.FULL_WIDTH_PERCENT)
      if (this.records.length === 0) {
        Text($r('app.string.empty_records'))
          .id('empty_text')
          .fontSize(UiConstants.BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.FULL_WIDTH_PERCENT)
          .margin({ top: UiConstants.ITEM_SPACING })
      } else {
        ForEach(this.records, (record: EventRecord) => {
          Row() {
            Text(`#${record.sequence}`)
              .fontSize(UiConstants.BODY_FONT_SIZE)
              .fontColor($r('app.color.primary_text'))
              .width(UiConstants.LABEL_WIDTH)
            Column() {
              Text(record.data)
                .fontSize(UiConstants.BODY_FONT_SIZE)
                .fontColor($r('app.color.primary_text'))
                .width(UiConstants.FULL_WIDTH_PERCENT)
              Text(this.sourceLabelOf(record.sourceCode))
                .fontSize(UiConstants.CAPTION_FONT_SIZE)
                .fontColor($r('app.color.secondary_text'))
                .width(UiConstants.FULL_WIDTH_PERCENT)
            }
            .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            Text(record.receivedTime)
              .fontSize(UiConstants.CAPTION_FONT_SIZE)
              .fontColor($r('app.color.secondary_text'))
          }
          .id(`event_item_${record.sequence}`)
            .width(UiConstants.FULL_WIDTH_PERCENT)
            .padding(UiConstants.ITEM_SPACING)
            .borderRadius(UiConstants.ITEM_SPACING)
            .backgroundColor($r('app.color.record_background'))
            .margin({ top: UiConstants.ITEM_SPACING })
        }, (record: EventRecord) => record.sequence.toString())
      }
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
      .padding(UiConstants.CARD_PADDING)
      .borderRadius(UiConstants.CARD_RADIUS)
      .backgroundColor($r('app.color.card_background'))
      .margin({ top: UiConstants.SECTION_SPACING })
      .alignItems(HorizontalAlign.Start)
  }

  /**
   * Builds a label and value row of the event contract card.
   */
  @Builder
  InfoRow(label: Resource, value: string, valueId: string) {
    Row() {
      Text(label)
        .fontSize(UiConstants.BODY_FONT_SIZE)
        .fontColor($r('app.color.secondary_text'))
        .width(UiConstants.LABEL_WIDTH)
      Text(value)
        .id(valueId)
        .fontSize(UiConstants.BODY_FONT_SIZE)
        .fontColor($r('app.color.primary_text'))
        .layoutWeight(1)
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
    .margin({ top: UiConstants.ITEM_SPACING })
  }

  /**
   * Restores the persisted records into the model when the store can be created.
   */
  private restoreRecords(): void {
    let context: common.Context | undefined = this.getUIContext().getHostContext() as common.Context;
    if (context === undefined) {
      return;
    }
    EventRecordStore.create(context).then((store: EventRecordStore) => {
      this.model.setStore(store);
      this.model.restore();
      this.syncFromModel();
    }).catch((error: BusinessError) => {
      Logger.error(`Failed to restore the event records, code: ${error.code}`);
    });
  }

  private subscribeEvent(): void {
    if (this.isSubscribed) {
      return;
    }
    this.subscription.start().then((succeeded: boolean) => {
      if (succeeded) {
        this.model.markSubscribed();
      } else {
        this.model.markSubscribeFailed();
      }
      this.syncFromModel();
    });
  }

  private unsubscribeEvent(): void {
    this.subscription.stop().then(() => {
      this.model.markUnsubscribed();
      this.syncFromModel();
    });
  }

  private onEventReceived = (error: BusinessError, event: commonEventManager.CommonEventData): void => {
    if (error && error.code !== 0) {
      Logger.error(`Failed to receive the custom common event, code: ${error.code}`);
      return;
    }
    let eventData: string = event.data === undefined ? CommonEventConstants.EMPTY_VALUE : event.data;
    let sourceCode: number = event.code === undefined ? EventSource.UNKNOWN : event.code;
    this.model.handleEvent(eventData, sourceCode);
    this.syncFromModel();
  };

  private subscription: SubscriptionManager = new SubscriptionManager(this.onEventReceived);

  private toggleSubscription(): void {
    if (this.isSubscribed) {
      this.unsubscribeEvent();
      return;
    }
    this.subscribeEvent();
  }

  private async publishEvent(): Promise<void> {
    if (this.isOperating) {
      return;
    }
    this.isOperating = true;
    this.statusText = this.statusResource(HomeStatus.PUBLISHING);
    let succeeded: boolean = await this.model.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
    this.syncFromModel();
    this.showToast(succeeded ? $r('app.string.toast_publish_success') : $r('app.string.toast_publish_failed'));
  }

  private showToast(message: Resource): void {
    try {
      this.getUIContext().getPromptAction().showToast({ message: message });
    } catch (error) {
      Logger.warn(`Failed to show the toast: ${(error as BusinessError).message}`);
    }
  }

  private clearRecords(): void {
    this.model.clear();
    this.syncFromModel();
    Logger.info('Cleared the received event records.');
  }

  private syncFromModel(): void {
    this.isSubscribed = this.model.isSubscribed();
    this.isOperating = this.model.isOperating();
    this.records = this.model.getRecords();
    this.receivedCount = this.model.getReceivedCount();
    this.lastEventData = this.model.getLastEventData();
    this.lastEventSource = this.sourceLabelOf(this.model.getLastSourceCode());
    this.statusText = this.statusResource(this.model.getStatus());
  }

  private sourceLabelOf(sourceCode: number): Resource {
    if (sourceCode === HomeStateModel.NO_SOURCE) {
      return $r('app.string.value_none');
    }
    let key: string = SourceLabel.of(sourceCode);
    if (key === SourceLabel.FORM_KEY) {
      return $r('app.string.source_form');
    }
    if (key === SourceLabel.PAGE_KEY) {
      return $r('app.string.source_page');
    }
    return $r('app.string.source_external');
  }

  private statusResource(status: HomeStatus): Resource {
    let key: string = StatusLabel.of(status);
    if (key === StatusLabel.SUBSCRIBED_KEY) {
      return $r('app.string.status_subscribed');
    }
    if (key === StatusLabel.SUBSCRIBE_FAILED_KEY) {
      return $r('app.string.status_subscribe_failed');
    }
    if (key === StatusLabel.UNSUBSCRIBED_KEY) {
      return $r('app.string.status_unsubscribed');
    }
    if (key === StatusLabel.PUBLISHING_KEY) {
      return $r('app.string.status_publishing');
    }
    if (key === StatusLabel.PUBLISH_SUCCESS_KEY) {
      return $r('app.string.status_publish_success');
    }
    if (key === StatusLabel.PUBLISH_FAILED_KEY) {
      return $r('app.string.status_publish_failed');
    }
    if (key === StatusLabel.EVENT_RECEIVED_KEY) {
      return $r('app.string.status_event_received');
    }
    if (key === StatusLabel.CLEARED_KEY) {
      return $r('app.string.status_cleared');
    }
    return $r('app.string.status_ready');
  }
}