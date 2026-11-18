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

import { deviceInfo, BusinessError } from '@kit.BasicServicesKit';
import { bundleManager } from '@kit.AbilityKit';
import { connection, http } from '@kit.NetworkKit';
import { Logger } from './Logger';

// Default timeout in milliseconds applied when callers do not provide one.
const DEFAULT_TIMEOUT_MS: number = 10000;
// Marker returned as response code when a request never reached the server.
const CODE_REQUEST_FAILED: number = -1;
// Lower bound of the successful HTTP response code range.
const HTTP_OK_MIN: number = 200;
// Upper bound (exclusive) of the successful HTTP response code range.
const HTTP_OK_MAX: number = 300;
// Content type header value used for JSON style POST requests.
const HEADER_JSON: string = 'application/json';
// Display name returned when the device has no usable network.
const NET_NAME_NONE: string = 'None';
// Display name returned when the network type cannot be resolved.
const NET_NAME_UNKNOWN: string = 'Unknown';
// Display name for the Wi-Fi bearer type.
const NET_NAME_WIFI: string = 'Wi-Fi';
// Display name for the cellular bearer type.
const NET_NAME_CELLULAR: string = 'Cellular';
// Display name for the ethernet bearer type.
const NET_NAME_ETHERNET: string = 'Ethernet';
// Display name for the bluetooth bearer type.
const NET_NAME_BLUETOOTH: string = 'Bluetooth';
// Display name for the VPN bearer type.
const NET_NAME_VPN: string = 'VPN';
// Net id value that marks the absence of a default network.
const NET_ID_NONE: number = 0;

/**
 * Unified result object of the HTTP helpers.
 * Callers read success first and then either the body or the error message.
 */
export interface HttpInvokeResult {
  /** Whether the request finished with a successful 2xx response code. */
  success: boolean;
  /** HTTP response code, or -1 when the request failed before any response arrived. */
  responseCode: number;
  /** Response body text when the server returned string data, otherwise empty. */
  body: string;
  /** Failure description, kept empty for successful requests. */
  errorMessage: string;
}

/**
 * Runtime and network utility class for the GeofenceCheckIn sample.
 * Exposes device info, bundle info, network status and simple HTTP GET/POST helpers on top of system kits.
 */
export class RuntimeNetUtil {
  /**
   * Get the certified model of the current device.
   * @returns the device model text such as TAS-AL00
   */
  public static getDeviceModel(): string {
    // Read the certified model directly from the device info service.
    return deviceInfo.productModel;
  }

  /**
   * Get the full system version name of the current device.
   * @returns the OS full name such as OpenHarmony-5.0.0.1
   */
  public static getOsFullName(): string {
    // Read the system version directly from the device info service.
    return deviceInfo.osFullName;
  }

  /**
   * Get the SDK API version of the current system.
   * @returns the numeric SDK API version
   */
  public static getSdkApiVersion(): number {
    // Read the numeric API version directly from the device info service.
    return deviceInfo.sdkApiVersion;
  }

  /**
   * Get the version name of the current application.
   * @returns the versionName configured in app.json5, or an empty string when it cannot be read
   */
  public static getAppVersionName(): string {
    // Trace the bundle query for later diagnosis.
    Logger.debug('RuntimeNetUtil#getAppVersionName: read app version name');
    try {
      // Query self bundle info with default flags which already carry name and version fields.
      const bundleInfo: bundleManager.BundleInfo =
        bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      return bundleInfo.versionName;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Return an empty string so callers can fall back to a placeholder text.
      Logger.error('RuntimeNetUtil#getAppVersionName: query failed, code: ' + e.code + ', message: ' + e.message);
      return '';
    }
  }

  /**
   * Get the bundle name of the current application.
   * @returns the bundleName configured in app.json5, or an empty string when it cannot be read
   */
  public static getBundleName(): string {
    // Trace the bundle query for later diagnosis.
    Logger.debug('RuntimeNetUtil#getBundleName: read bundle name');
    try {
      // Query self bundle info with default flags which already carry the bundle name.
      const bundleInfo: bundleManager.BundleInfo =
        bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      return bundleInfo.name;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Return an empty string so callers can handle the failure explicitly.
      Logger.error('RuntimeNetUtil#getBundleName: query failed, code: ' + e.code + ', message: ' + e.message);
      return '';
    }
  }

  /**
   * Check whether the device currently has a usable default network.
   * Requires the ohos.permission.GET_NETWORK_INFO permission.
   * @returns true when a default network is available, false when it is missing or the check fails
   */
  public static async isNetworkAvailable(): Promise<boolean> {
    // Trace the connectivity check before querying the network service.
    Logger.debug('RuntimeNetUtil#isNetworkAvailable: check default network');
    try {
      // Ask the connection service whether a default network exists.
      const hasNet: boolean = await connection.hasDefaultNet();
      // Trace the result so network issues can be spotted in logs.
      Logger.debug('RuntimeNetUtil#isNetworkAvailable: result: ' + hasNet);
      return hasNet;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Report no network instead of throwing to keep callers simple.
      Logger.error('RuntimeNetUtil#isNetworkAvailable: check failed, code: ' + e.code + ', message: ' + e.message);
      return false;
    }
  }

  /**
   * Resolve the display name of the current default network type.
   * Requires the ohos.permission.GET_NETWORK_INFO permission.
   * @returns names such as Wi-Fi, Cellular or None, or Unknown when the type cannot be resolved
   */
  public static getNetTypeName(): string {
    // Trace the type resolution before querying the network service.
    Logger.debug('RuntimeNetUtil#getNetTypeName: resolve current network type');
    try {
      // Get the default network handle synchronously for a quick snapshot.
      const netHandle: connection.NetHandle = connection.getDefaultNetSync();
      // A zero net id marks the absence of any default network.
      if (netHandle.netId === NET_ID_NONE) {
        return NET_NAME_NONE;
      }
      // Read the capability set of the default network.
      const capabilities: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
      const bearers: connection.NetBearType[] = capabilities.bearerTypes;
      // Map the first recognized bearer type to a display name.
      for (let i = 0; i < bearers.length; i++) {
        // Check each known bearer type in a stable order.
        if (bearers[i] === connection.NetBearType.BEARER_WIFI) {
          return NET_NAME_WIFI;
        }
        if (bearers[i] === connection.NetBearType.BEARER_CELLULAR) {
          return NET_NAME_CELLULAR;
        }
        if (bearers[i] === connection.NetBearType.BEARER_ETHERNET) {
          return NET_NAME_ETHERNET;
        }
        if (bearers[i] === connection.NetBearType.BEARER_BLUETOOTH) {
          return NET_NAME_BLUETOOTH;
        }
        if (bearers[i] === connection.NetBearType.BEARER_VPN) {
          return NET_NAME_VPN;
        }
      }
      return NET_NAME_UNKNOWN;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Return an explicit unknown name instead of throwing to keep callers simple.
      Logger.error('RuntimeNetUtil#getNetTypeName: resolve failed, code: ' + e.code + ', message: ' + e.message);
      return NET_NAME_UNKNOWN;
    }
  }

  /**
   * Send a simple HTTP GET request and wrap the outcome into a result object.
   * Requires the ohos.permission.INTERNET permission.
   * @param url the absolute request URL
   * @param timeoutMs optional read and connect timeout in milliseconds, defaults to 10000
   * @returns a named result object with success flag, response code, body and error message
   */
  public static async httpGet(url: string, timeoutMs?: number): Promise<HttpInvokeResult> {
    // Trace the outgoing request URL for later diagnosis.
    Logger.debug('RuntimeNetUtil#httpGet: request ' + url);
    // Build the GET options with a shared timeout for connect and read phases.
    const timeout: number = timeoutMs === undefined ? DEFAULT_TIMEOUT_MS : timeoutMs;
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      expectDataType: http.HttpDataType.STRING,
      readTimeout: timeout,
      connectTimeout: timeout
    };
    // Run the shared request flow so GET and POST stay consistent.
    return RuntimeNetUtil.executeRequest(url, options);
  }

  /**
   * Send a simple HTTP POST request with a text body and wrap the outcome into a result object.
   * Requires the ohos.permission.INTERNET permission.
   * @param url the absolute request URL
   * @param body the request body text sent through extraData
   * @param timeoutMs optional read and connect timeout in milliseconds, defaults to 10000
   * @returns a named result object with success flag, response code, body and error message
   */
  public static async httpPost(url: string, body: string, timeoutMs?: number): Promise<HttpInvokeResult> {
    // Trace the outgoing request URL and body size for later diagnosis.
    Logger.debug('RuntimeNetUtil#httpPost: request ' + url + ', body length: ' + body.length);
    // Declare the JSON content type header with a Record to satisfy typed object rules.
    const headers: Record<string, string> = { 'Content-Type': HEADER_JSON };
    // Build the POST options including the body and a shared timeout value.
    const timeout: number = timeoutMs === undefined ? DEFAULT_TIMEOUT_MS : timeoutMs;
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      header: headers,
      extraData: body,
      expectDataType: http.HttpDataType.STRING,
      readTimeout: timeout,
      connectTimeout: timeout
    };
    // Run the shared request flow so GET and POST stay consistent.
    return RuntimeNetUtil.executeRequest(url, options);
  }

  /**
   * Run one HTTP request with the given options and convert the outcome into a result object.
   * The request client is always destroyed so no connection resource leaks.
   * @param url the absolute request URL
   * @param options the request options built by the GET or POST entry method
   * @returns a named result object describing success, response code, body and error message
   */
  private static async executeRequest(url: string, options: http.HttpRequestOptions): Promise<HttpInvokeResult> {
    // Create one dedicated client per request as required by the http kit.
    const client: http.HttpRequest = http.createHttp();
    try {
      // Await the response of the network request.
      const response: http.HttpResponse = await client.request(url, options);
      const responseCode: number = response.responseCode;
      // Narrow the union result type without casts and keep only string bodies.
      let bodyText: string = '';
      if (typeof response.result === 'string') {
        bodyText = response.result;
      }
      // Accept only the 2xx range as a successful outcome.
      const success: boolean = responseCode >= HTTP_OK_MIN && responseCode < HTTP_OK_MAX;
      // Trace the final code so server side issues stay visible.
      Logger.debug('RuntimeNetUtil#executeRequest: finished, code: ' + responseCode + ', success: ' + success);
      // Wrap the outcome into the named result object for the caller.
      const result: HttpInvokeResult = {
        success: success,
        responseCode: responseCode,
        body: bodyText,
        errorMessage: success ? '' : 'HTTP error code: ' + responseCode
      };
      return result;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Log the transport level failure including code and message.
      Logger.error('RuntimeNetUtil#executeRequest: request failed, code: ' + e.code + ', message: ' + e.message);
      // Report the failure through the result object instead of throwing.
      const result: HttpInvokeResult = {
        success: false,
        responseCode: CODE_REQUEST_FAILED,
        body: '',
        errorMessage: e.message
      };
      return result;
    } finally {
      // Release the client resources to avoid memory leaks.
      client.destroy();
    }
  }
}
