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
import { HttpProbeResult } from './SecurityTypes';
import { elapsedMilliseconds } from '../utils/Format';
import { Logger } from '../utils/Logger';

// Connect and read timeout in milliseconds for probe requests.
const TIMEOUT_MS: number = 10000;
// Platform error code reported when cleartext traffic is blocked by policy.
const CLEARTEXT_BLOCKED_CODE: number = 2300997;
// Inclusive lower bound of HTTP status codes treated as success.
const HTTP_OK_MIN: number = 200;
// Inclusive upper bound of HTTP status codes treated as success.
const HTTP_OK_MAX: number = 399;
// Fallback error code when no positive platform code is available.
const UNKNOWN_CODE: number = -1;

/**
 * Plain HTTP probe used to demonstrate the cleartext policy of network_config.json.
 */
export class HttpProbeService {
  /**
   * Send one plain HTTP GET request and classify the outcome.
   * Cleartext blocking by network_config.json surfaces as error code 2300997.
   * @param url target URL, expected to be plain http for the demo.
   * @returns a HttpProbeResult with status, error code and elapsed time; never throws.
   */
  static async probe(url: string): Promise<HttpProbeResult> {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.probe', 1);
    Logger.enter('[HttpProbeService#probe]', 'params: url ' + url);
    // Record the start time to compute the elapsed duration.
    const startedAt: number = Date.now();
    // Create an HTTP request object for one GET call.
    const request: http.HttpRequest = http.createHttp();
    // Configure timeouts and expect a plain string body.
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      connectTimeout: TIMEOUT_MS,
      readTimeout: TIMEOUT_MS,
      expectDataType: http.HttpDataType.STRING
    };
    try {
      // Perform the GET request and wait for the response.
      const response: http.HttpResponse = await request.request(url, options);
      // Compute the elapsed time from the start timestamp.
      const elapsed: number = elapsedMilliseconds(startedAt);
      // Treat 2xx/3xx status codes as a successful probe.
      const success: boolean = response.responseCode >= HTTP_OK_MIN && response.responseCode <= HTTP_OK_MAX;
      // Build the human readable outcome message.
      const message: string =
        success ? 'Request succeeded' : 'Unexpected HTTP status ' + response.responseCode.toString();
      Logger.info('[HttpProbe] ' + url + ' finished with HTTP ' + response.responseCode.toString());
      Logger.exit('[HttpProbeService#probe]', 'result: success ' + success.toString() + ', httpCode ' +
        response.responseCode.toString());
      // Close the trace section before returning the success result.
      Logger.endTrace('NetworkSecurity.security.probe', 1);
      return new HttpProbeResult(url, success, response.responseCode, 0, elapsed, message);
    } catch (error) {
      // Normalize the thrown value into a BusinessError to read its code.
      const err: BusinessError = error as BusinessError;
      // Use the platform error code, or -1 when no positive code is available.
      const code: number = err.code > 0 ? err.code : UNKNOWN_CODE;
      // Compute the elapsed time up to the failure.
      const elapsed: number = elapsedMilliseconds(startedAt);
      // Cleartext traffic blocked by the network security policy.
      if (code === CLEARTEXT_BLOCKED_CODE) {
        Logger.warn('[HttpProbe] Cleartext blocked by policy for ' + url);
        Logger.exit('[HttpProbeService#probe]', 'result: blocked, code ' + code.toString());
        // Close the trace section before returning the blocked result.
        Logger.endTrace('NetworkSecurity.security.probe', 1);
        return new HttpProbeResult(url, false, 0, code, elapsed,
          'Cleartext traffic blocked by network security policy, code ' + code.toString());
      }
      Logger.warn('[HttpProbe] ' + url + ' failed, code ' + code.toString());
      Logger.exit('[HttpProbeService#probe]', 'result: failed, code ' + code.toString());
      // Close the trace section before returning the failure result.
      Logger.endTrace('NetworkSecurity.security.probe', 1);
      return new HttpProbeResult(url, false, 0, code, elapsed, 'Request failed, code ' + code.toString());
    } finally {
      // Release the HTTP request object on every outcome path.
      request.destroy();
    }
  }
}
