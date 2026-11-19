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
import Logger from '../util/Logger';
import { CommonEventConstants } from '../util/Constants';

/**
 * Options of a parameterized publish request.
 */
export interface PublishOptions {
  data: string;
  sourceCode: number;
  eventName?: string;
  ordered?: boolean;
}

/**
 * Request assembled from the publish options.
 */
export interface PublishRequest {
  eventName: string;
  publishData: commonEventManager.CommonEventPublishData;
}

/**
 * Publishes the custom common event consumed by the host application.
 */
export class CommonEventPublisher {
  /**
   * Builds the publish data of the custom common event.
   *
   * @param data Event data, InApp or OutApp for the host application.
   * @param sourceCode Publisher source carried by the code field.
   * @param ordered Whether the event is delivered as an ordered common event.
   * @returns Publish data that can be passed to the common event framework.
   */
  static buildPublishData(data: string, sourceCode: number,
    ordered: boolean = false): commonEventManager.CommonEventPublishData {
    let publishData: commonEventManager.CommonEventPublishData = {
      code: sourceCode,
      data: data,
      isOrdered: ordered
    };
    return publishData;
  }

  /**
   * Assembles the publish request from the given options.
   *
   * @param options Data, source code and optional attributes of the event.
   * @returns Request with the event name and the publish data.
   */
  static buildRequest(options: PublishOptions): PublishRequest {
    let eventName: string = options.eventName ?? CommonEventConstants.EVENT_NAME;
    let publishData: commonEventManager.CommonEventPublishData =
      CommonEventPublisher.buildPublishData(options.data, options.sourceCode, options.ordered ?? false);
    return { eventName: eventName, publishData: publishData };
  }

  /**
   * Publishes the custom common event with the given options.
   *
   * @param options Data, source code and optional attributes of the event.
   */
  static publishWith(options: PublishOptions): Promise<void> {
    let request: PublishRequest = CommonEventPublisher.buildRequest(options);
    return CommonEventPublisher.publishWithOptions(request.eventName, request.publishData);
  }

  /**
   * Checks whether the data is one of the values understood by the host application.
   *
   * @param data Event data to check.
   * @returns True for InApp and OutApp.
   */
  static isSupportedData(data: string): boolean {
    return data === CommonEventConstants.DATA_IN_APP || data === CommonEventConstants.DATA_OUT_APP;
  }

  /**
   * Checks the data length accepted by the common event framework.
   *
   * @param data Event data to check.
   * @returns True when the data does not exceed 64 KB.
   */
  static isDataLengthValid(data: string): boolean {
    return data.length <= CommonEventConstants.MAX_EVENT_DATA_LENGTH;
  }

  /**
   * Publishes the custom common event.
   *
   * @param data Event data carried by the event.
   * @param sourceCode Publisher source carried by the code field.
   * @param ordered Whether the event is delivered as an ordered common event.
   */
  static publish(data: string, sourceCode: number, ordered: boolean = false): Promise<void> {
    let publishData: commonEventManager.CommonEventPublishData =
      CommonEventPublisher.buildPublishData(data, sourceCode, ordered);
    return CommonEventPublisher.publishWithOptions(CommonEventConstants.EVENT_NAME, publishData);
  }

  /**
   * Checks the publish request before it reaches the common event framework.
   *
   * @param eventName Name of the common event to publish.
   * @param publishData Data and attributes delivered with the event.
   * @returns An empty string when the request can be published.
   */
  static validatePublishRequest(eventName: string,
    publishData: commonEventManager.CommonEventPublishData): string {
    if (eventName.length === 0) {
      return 'The common event name must not be empty.';
    }
    if (eventName.trim().length !== eventName.length) {
      return 'The common event name must not start or end with spaces.';
    }
    let data: string = publishData.data ?? '';
    if (!CommonEventPublisher.isDataLengthValid(data)) {
      return 'The event data must not exceed 64 KB.';
    }
    return '';
  }

  /**
   * Publishes a common event with the given name and data.
   *
   * @param eventName Name of the common event to publish.
   * @param publishData Data and attributes delivered with the event.
   */
  static publishWithOptions(eventName: string,
    publishData: commonEventManager.CommonEventPublishData): Promise<void> {
    let reason: string = CommonEventPublisher.validatePublishRequest(eventName, publishData);
    if (reason.length > 0) {
      return Promise.reject(new Error(reason));
    }
    return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
      commonEventManager.publish(eventName, publishData, (error: BusinessError) => {
        if (error && error.code !== 0) {
          Logger.error(`Failed to publish ${eventName}, code: ${error.code}, message: ${error.message}`);
          reject(new Error(`Failed to publish ${eventName}, code: ${error.code}`));
          return;
        }
        Logger.info(`Succeeded in publishing ${eventName}, data: ${publishData.data ?? ''}`);
        resolve();
      });
    });
  }
}
