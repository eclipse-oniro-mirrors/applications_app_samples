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

import { formBindingData } from '@kit.FormKit';
import Logger from '../util/Logger';
import { CommonEventConstants, EventSource } from '../util/Constants';
import { CommonEventPublisher } from './CommonEventPublisher';

/**
 * Message delivered by the click action of the service widget.
 */
export interface FormEventMessage {
  message?: string;
  data?: string;
}

/**
 * Result of reading the event data carried by the widget message.
 */
export interface ParseResult {
  data: string;
  valid: boolean;
  reason: string;
}

/**
 * Publishes the custom common event triggered by the widget, replaced by tests to inspect the calls.
 */
export interface FormEventPublisher {
  publish(data: string, sourceCode: number): Promise<void>;
}

class DefaultFormEventPublisher implements FormEventPublisher {
  publish(data: string, sourceCode: number): Promise<void> {
    return CommonEventPublisher.publish(data, sourceCode);
  }
}

/**
 * Builds the widget binding data and turns widget clicks into custom common events.
 */
export class FormEventService {
  private static publisher: FormEventPublisher = new DefaultFormEventPublisher();

  /**
   * Replaces the destination of the events triggered by the widget.
   *
   * @param publisher Publisher used by publishFromForm, defaults to the common event framework.
   */
  static setPublisher(publisher: FormEventPublisher): void {
    FormEventService.publisher = publisher;
  }
  /**
   * Creates the binding data rendered by the service widget.
   *
   * @param publishCount Number of events published by the widget.
   * @returns Binding data that carries the publish count.
   */
  static createBindingData(publishCount: number): formBindingData.FormBindingData {
    let params: Record<string, Object> = {
      'publishCount': publishCount
    };
    return formBindingData.createFormBindingData(params);
  }

  /**
   * Checks whether the publish count can be rendered by the widget.
   *
   * @param publishCount Number of events published by the widget.
   * @returns True for non negative safe integers.
   */
  static isValidPublishCount(publishCount: number): boolean {
    return Number.isFinite(publishCount) && Math.floor(publishCount) === publishCount &&
      publishCount >= 0 && publishCount <= Number.MAX_SAFE_INTEGER;
  }

  /**
   * Reads the event data carried by the click action of the widget.
   *
   * @param message Message passed to onFormEvent, usually a JSON string.
   * @returns Event data, OutApp when the message is empty or invalid.
   */
  static parseEventData(message: string): string {
    return FormEventService.parseMessage(message).data;
  }

  /**
   * Reads the message and reports why the payload is not usable.
   *
   * @param message Message passed to onFormEvent, usually a JSON string.
   * @returns Event data together with whether it is valid and the failure reason.
   */
  static parseMessage(message: string): ParseResult {
    if (message.length === 0) {
      return { data: CommonEventConstants.DATA_OUT_APP, valid: false, reason: 'empty-message' };
    }
    try {
      let params: Record<string, Object> = JSON.parse(message) as Record<string, Object>;
      let value: Object | undefined = params['data'];
      if (value === undefined) {
        return { data: CommonEventConstants.DATA_OUT_APP, valid: false, reason: 'missing-data' };
      }
      if (typeof value !== 'string') {
        return { data: CommonEventConstants.DATA_OUT_APP, valid: false, reason: 'non-string-data' };
      }
      let data: string = value as string;
      if (data.length === 0) {
        return { data: CommonEventConstants.DATA_OUT_APP, valid: false, reason: 'empty-data' };
      }
      return { data: data, valid: true, reason: '' };
    } catch (error) {
      Logger.warn(`Failed to parse the widget message: ${(error as Error).message}`);
      return { data: CommonEventConstants.DATA_OUT_APP, valid: false, reason: 'invalid-json' };
    }
  }

  /**
   * Publishes the custom common event triggered by the widget.
   *
   * @param message Message passed to onFormEvent.
   */
  static publishFromForm(message: string): Promise<void> {
    let data: string = FormEventService.parseEventData(message);
    return FormEventService.publisher.publish(data, EventSource.FORM);
  }
}
