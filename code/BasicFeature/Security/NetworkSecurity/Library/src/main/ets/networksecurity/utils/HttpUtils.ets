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

import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';
import { AsyncUtils } from './AsyncUtils';

// Lowest HTTP status still counted as a success.
const STATUS_OK_MIN: number = 200;
// Highest HTTP status still counted as a success.
const STATUS_OK_MAX: number = 399;
// Default connect and read timeout in milliseconds.
const DEFAULT_TIMEOUT_MS: number = 10000;
// Default number of retries after the first failed attempt.
const DEFAULT_RETRY_COUNT: number = 1;
// Base delay before the first retry in milliseconds.
const BASE_RETRY_DELAY_MS: number = 500;
// Backoff multiplier applied per retry attempt.
const BACKOFF_BASE: number = 2;
// Prefix used for generic failure messages.
const FAIL_PREFIX: string = 'Request failed';
// Status code recorded when the request never reached an HTTP response.
const STATUS_NONE: number = 0;

/**
 * Outcome of a guarded HTTP call: status, body and either success state or
 * a failure description with the transport error code.
 */
export interface HttpCallResult {
  success: boolean;
  statusCode: number;
  body: string;
  errorCode: number;
  message: string;
}

/**
 * HTTP helpers built on the NetworkKit http module: guarded GET and POST
 * with connect/read timeouts, retry with exponential backoff and a status
 * classifier. Failures are reported inside HttpCallResult instead of
 * being thrown, so callers never need try/catch for these calls.
 */
export class HttpUtils {
  /**
   * Check whether an HTTP status code belongs to the success range.
   * @param statusCode HTTP status code to classify.
   * @returns true when the status is between 200 and 399 inclusive.
   */
  static isSuccessStatus(statusCode: number): boolean {
    const tag: string = '[HttpUtils#isSuccessStatus]';
    Logger.enter(tag, 'statusCode: ' + statusCode.toString());
    Logger.beginTrace('NetworkSecurity.utils.isSuccessStatus', 1);
    // 2xx and 3xx both count as transport level success.
    const result: boolean = statusCode >= STATUS_OK_MIN && statusCode <= STATUS_OK_MAX;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isSuccessStatus', 1);
    return result;
  }

  /**
   * Perform an HTTP GET with timeout and retries.
   * @param url absolute http or https URL to request.
   * @param timeoutMs connect and read timeout in milliseconds.
   * @param retryCount number of retries after the first failed attempt.
   * @returns an HttpCallResult describing the final attempt.
   */
  static async httpGet(url: string, timeoutMs: number = DEFAULT_TIMEOUT_MS,
    retryCount: number = DEFAULT_RETRY_COUNT): Promise<HttpCallResult> {
    const tag: string = '[HttpUtils#httpGet]';
    Logger.enter(tag, 'url: ' + url + ', timeout: ' + timeoutMs.toString() + ', retry: ' + retryCount.toString());
    Logger.beginTrace('NetworkSecurity.utils.httpGet', 1);
    // Build the GET options once and reuse them for every attempt.
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      connectTimeout: timeoutMs,
      readTimeout: timeoutMs,
      expectDataType: http.HttpDataType.STRING
    };
    const result: HttpCallResult = await HttpUtils.requestWithRetry(url, options, retryCount);
    Logger.exit(tag, 'success: ' + result.success.toString() + ', status: ' + result.statusCode.toString());
    Logger.endTrace('NetworkSecurity.utils.httpGet', 1);
    return result;
  }

  /**
   * Perform an HTTP POST with a text body, timeout and retries.
   * @param url absolute http or https URL to request.
   * @param body request payload sent as the request body.
   * @param timeoutMs connect and read timeout in milliseconds.
   * @param retryCount number of retries after the first failed attempt.
   * @returns an HttpCallResult describing the final attempt.
   */
  static async httpPost(url: string, body: string, timeoutMs: number = DEFAULT_TIMEOUT_MS,
    retryCount: number = DEFAULT_RETRY_COUNT): Promise<HttpCallResult> {
    const tag: string = '[HttpUtils#httpPost]';
    Logger.enter(tag, 'url: ' + url + ', bodyChars: ' + body.length.toString()
      + ', timeout: ' + timeoutMs.toString() + ', retry: ' + retryCount.toString());
    Logger.beginTrace('NetworkSecurity.utils.httpPost', 1);
    // POST shares the retry engine; only method and extraData differ.
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      extraData: body,
      connectTimeout: timeoutMs,
      readTimeout: timeoutMs,
      expectDataType: http.HttpDataType.STRING
    };
    const result: HttpCallResult = await HttpUtils.requestWithRetry(url, options, retryCount);
    Logger.exit(tag, 'success: ' + result.success.toString() + ', status: ' + result.statusCode.toString());
    Logger.endTrace('NetworkSecurity.utils.httpPost', 1);
    return result;
  }

  /**
   * Run one HTTP request with retries and exponential backoff. Only
   * transport failures are retried; non-success status codes are final.
   * @param url absolute URL to request.
   * @param options request options including method and timeouts.
   * @param retryCount number of retries after the first failed attempt.
   * @returns the outcome of the last attempt.
   */
  private static async requestWithRetry(url: string, options: http.HttpRequestOptions,
    retryCount: number): Promise<HttpCallResult> {
    // Clamp negative retry counts so at least one attempt always runs.
    const safeRetryCount: number = retryCount < 0 ? 0 : retryCount;
    // Seed the outcome with a failure shape for the guard path below.
    let result: HttpCallResult = {
      success: false, statusCode: STATUS_NONE, body: '',
      errorCode: STATUS_NONE, message: FAIL_PREFIX
    };
    for (let attempt = 0; attempt <= safeRetryCount; attempt++) {
      // Apply exponential backoff between attempts, never before the first.
      if (attempt > 0) {
        const backoff: number = BASE_RETRY_DELAY_MS * Math.pow(BACKOFF_BASE, attempt - 1);
        await AsyncUtils.delay(backoff);
      }
      result = await HttpUtils.attemptOnce(url, options);
      // Transport success is final; retry only when attemptOnce failed hard.
      if (result.errorCode === STATUS_NONE) {
        break;
      }
    }
    return result;
  }

  /**
   * Execute a single HTTP request and translate it into HttpCallResult.
   * @param url absolute URL to request.
   * @param options request options including method and timeouts.
   * @returns the outcome of this single attempt.
   */
  private static async attemptOnce(url: string, options: http.HttpRequestOptions): Promise<HttpCallResult> {
    // Create a fresh request object per attempt, it must not be reused.
    const request: http.HttpRequest = http.createHttp();
    try {
      const response: http.HttpResponse = await request.request(url, options);
      // The STRING data type makes the body arrive as plain text.
      const body: string = typeof response.result === 'string' ? response.result : '';
      const success: boolean = HttpUtils.isSuccessStatus(response.responseCode);
      const message: string = success ? 'Request succeeded' : 'Unexpected HTTP status ' + response.responseCode.toString();
      return { success: success, statusCode: response.responseCode, body: body,
        errorCode: STATUS_NONE, message: message };
    } catch (error) {
      // Transport errors carry a positive BusinessError code for the caller.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[HttpUtils#attemptOnce] ' + url + ' failed, code ' + err.code.toString());
      return { success: false, statusCode: STATUS_NONE, body: '',
        errorCode: err.code, message: FAIL_PREFIX + ', code ' + err.code.toString() };
    } finally {
      // destroy releases the native request resources in every path.
      request.destroy();
    }
  }
}
