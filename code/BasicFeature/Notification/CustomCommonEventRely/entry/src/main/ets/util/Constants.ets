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

/**
 * Contract shared by the host application, the service widget and the page of this sample.
 */
export class CommonEventConstants {
  /**
   * Custom common event monitored by the host application.
   */
  static readonly EVENT_NAME: string = 'Acts_CommonEvent_Test';
  /**
   * Event data published by the host application itself.
   */
  static readonly DATA_IN_APP: string = 'InApp';
  /**
   * Event data published by this sample, which is an external application for the host.
   */
  static readonly DATA_OUT_APP: string = 'OutApp';
  /**
   * Bundle name of this sample, also the publisher bundle name checked by the host application.
   */
  static readonly BUNDLE_NAME: string = 'com.samples.customcommoneventrely';
  /**
   * Bundle name of the host application that shows the widgets of this sample.
   */
  static readonly HOST_BUNDLE_NAME: string = 'com.samples.customcommonevent';
  /**
   * Ability that provides the home page.
   */
  static readonly ABILITY_NAME: string = 'EntryAbility';
  /**
   * Ability that provides the service widget.
   */
  static readonly FORM_ABILITY_NAME: string = 'EntryFormAbility';
  /**
   * Service widget name configured in form_config.json.
   */
  static readonly FORM_NAME: string = 'publishCard';
  /**
   * Module that provides the service widget.
   */
  static readonly MODULE_NAME: string = 'entry';
  /**
   * Binding data key that carries the publish count of the widget.
   */
  static readonly FORM_COUNT_KEY: string = 'publishCount';
  /**
   * Event data carried by the card click action.
   */
  static readonly FORM_MESSAGE_KEY: string = 'message';
  /**
   * Maximum number of records kept by the home page.
   */
  static readonly MAX_RECORD_COUNT: number = 20;
  /**
   * Upper limit of the event data length accepted by the common event framework.
   */
  static readonly MAX_EVENT_DATA_LENGTH: number = 64 * 1024;
  /**
   * Empty value used when the publisher does not carry data or message.
   */
  static readonly EMPTY_VALUE: string = '';
}

/**
 * Source of a received common event, carried by the code field of the publish data.
 */
export class EventSource {
  static readonly UNKNOWN: number = 0;
  static readonly FORM: number = 1001;
  static readonly PAGE: number = 1002;
  static readonly NAME_EXTERNAL: string = 'external';
  static readonly NAME_FORM: string = 'form';
  static readonly NAME_PAGE: string = 'page';

  /**
   * Resolves the readable source name of an event.
   *
   * @param code Code field delivered by the publisher.
   * @returns Source name, external for unknown publishers.
   */
  static resolveName(code: number): string {
    if (code === EventSource.FORM) {
      return EventSource.NAME_FORM;
    }
    if (code === EventSource.PAGE) {
      return EventSource.NAME_PAGE;
    }
    return EventSource.NAME_EXTERNAL;
  }
}

/**
 * Resource keys used by the home page to describe the source of an event.
 */
export class SourceLabel {
  static readonly NONE_KEY: string = 'value_none';
  static readonly PREFIX: string = 'source_';
  static readonly FORM_KEY: string = 'source_form';
  static readonly PAGE_KEY: string = 'source_page';
  static readonly EXTERNAL_KEY: string = 'source_external';

  /**
   * @param code Code field delivered by the publisher.
   * @returns Resource key of the source label, external for unknown publishers.
   */
  static of(code: number): string {
    return `${SourceLabel.PREFIX}${EventSource.resolveName(code)}`;
  }
}

/**
 * Resource keys used by the home page to describe the current status.
 */
export class StatusLabel {
  static readonly PREFIX: string = 'status_';
  static readonly READY_KEY: string = 'status_ready';
  static readonly SUBSCRIBED_KEY: string = 'status_subscribed';
  static readonly SUBSCRIBE_FAILED_KEY: string = 'status_subscribe_failed';
  static readonly UNSUBSCRIBED_KEY: string = 'status_unsubscribed';
  static readonly PUBLISHING_KEY: string = 'status_publishing';
  static readonly PUBLISH_SUCCESS_KEY: string = 'status_publish_success';
  static readonly PUBLISH_FAILED_KEY: string = 'status_publish_failed';
  static readonly EVENT_RECEIVED_KEY: string = 'status_event_received';
  static readonly CLEARED_KEY: string = 'status_cleared';
  /**
   * Values that mirror HomeStatus, kept local so that this file does not depend on the model.
   */
  static readonly STATUS_SUBSCRIBED: number = 1;
  static readonly STATUS_SUBSCRIBE_FAILED: number = 2;
  static readonly STATUS_UNSUBSCRIBED: number = 3;
  static readonly STATUS_PUBLISHING: number = 4;
  static readonly STATUS_PUBLISH_SUCCESS: number = 5;
  static readonly STATUS_PUBLISH_FAILED: number = 6;
  static readonly STATUS_EVENT_RECEIVED: number = 7;
  static readonly STATUS_CLEARED: number = 8;

  /**
   * @param status Status value of the home page, mirrors HomeStatus.
   * @returns Resource key of the status label, ready for unknown values.
   */
  static of(status: number): string {
    if (status === StatusLabel.STATUS_SUBSCRIBED) {
      return StatusLabel.SUBSCRIBED_KEY;
    }
    if (status === StatusLabel.STATUS_SUBSCRIBE_FAILED) {
      return StatusLabel.SUBSCRIBE_FAILED_KEY;
    }
    if (status === StatusLabel.STATUS_UNSUBSCRIBED) {
      return StatusLabel.UNSUBSCRIBED_KEY;
    }
    if (status === StatusLabel.STATUS_PUBLISHING) {
      return StatusLabel.PUBLISHING_KEY;
    }
    if (status === StatusLabel.STATUS_PUBLISH_SUCCESS) {
      return StatusLabel.PUBLISH_SUCCESS_KEY;
    }
    if (status === StatusLabel.STATUS_PUBLISH_FAILED) {
      return StatusLabel.PUBLISH_FAILED_KEY;
    }
    if (status === StatusLabel.STATUS_EVENT_RECEIVED) {
      return StatusLabel.EVENT_RECEIVED_KEY;
    }
    if (status === StatusLabel.STATUS_CLEARED) {
      return StatusLabel.CLEARED_KEY;
    }
    return StatusLabel.READY_KEY;
  }
}

/**
 * Layout values of the home page and the service widget.
 */
export class UiConstants {
  static readonly PAGE_PADDING: number = 16;
  static readonly SECTION_SPACING: number = 12;
  static readonly ITEM_SPACING: number = 8;
  static readonly CARD_RADIUS: number = 16;
  static readonly CARD_PADDING: number = 12;
  static readonly TITLE_FONT_SIZE: number = 24;
  static readonly CARD_TITLE_FONT_SIZE: number = 16;
  static readonly BODY_FONT_SIZE: number = 14;
  static readonly CAPTION_FONT_SIZE: number = 12;
  static readonly LABEL_WIDTH: number = 96;
  static readonly BUTTON_HEIGHT: number = 40;
  static readonly CONTENT_MAX_WIDTH: number = 640;
  static readonly FULL_WIDTH_PERCENT: string = '100%';
  static readonly FULL_HEIGHT_PERCENT: string = '100%';
}
