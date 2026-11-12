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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';
import { ResourceHelper } from '../basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// HTTP method enum
// ========================================

/**
 * HTTP request method enum.
 * Defines standard RESTful HTTP method types.
 */
export enum HttpMethod {
  /** GET request, retrieves a resource */
  GET = 'GET',
  /** POST request, creates a resource */
  POST = 'POST',
  /** PUT request, fully updates a resource */
  PUT = 'PUT',
  /** DELETE request, deletes a resource */
  DELETE = 'DELETE',
  /** PATCH request, partially updates a resource */
  PATCH = 'PATCH'
}

// ========================================
// HTTP response interface
// ========================================

/**
 * HTTP response data interface.
 * Encapsulates the full response returned by the server.
 */
export interface HttpResponse {
  /** HTTP status code */
  status: number;
  /** Response body data */
  data: string;
  /** Response header key-value pairs */
  headers: Map<string, string>;
  /** Response timestamp (milliseconds) */
  timestamp: number;
}

// ========================================
// HTTP request config interface
// ========================================

/**
 * HTTP request configuration interface.
 * Defines all parameters required to issue an HTTP request.
 */
export interface HttpRequestConfig {
  /** Request URL */
  url: string;
  /** Request method */
  method: HttpMethod;
  /** Request header key-value pairs */
  headers: Map<string, string>;
  /** Request body content */
  body: string;
  /** Request timeout (milliseconds) */
  timeout: number;
}

// ========================================
// Interceptor interfaces
// ========================================

/**
 * Request interceptor interface.
 * Preprocesses the request configuration before the request is sent.
 */
export interface RequestInterceptor {
  /**
   * Intercepts and processes the request configuration.
   * @param {HttpRequestConfig} config - Original request configuration
   * @returns {HttpRequestConfig} Processed request configuration
   */
  onRequest(config: HttpRequestConfig): HttpRequestConfig;
}

/**
 * Response interceptor interface.
 * Postprocesses the response data after it is received.
 */
export interface ResponseInterceptor {
  /**
   * Intercepts and processes the response data.
   * @param {HttpResponse} response - Original response data
   * @returns {HttpResponse} Processed response data
   */
  onResponse(response: HttpResponse): HttpResponse;
}

// ========================================
// HTTP utility class
// ========================================

/**
 * HTTP utility class.
 * Provides static methods for URL building, query string parsing,
 * default config creation and status code checking to simplify
 * the HTTP request handling flow.
 */
export class HttpUtils {
  /** Default request timeout (milliseconds) */
  private static readonly DEFAULT_TIMEOUT: number = SystemConfigConstants.OPERATION_TIMEOUT_MS;
  /** Default Content-Type */
  private static readonly DEFAULT_CONTENT_TYPE: string = 'application/json';
  /** Default Accept header */
  private static readonly DEFAULT_ACCEPT: string = 'application/json';

  // ========================================
  // URL building and parsing methods
  // ========================================

  /**
   * Builds a full URL with query parameters.
   * Joins the parameter map into a URL query string and appends it to the base URL.
   * @param {string} base - Base URL
   * @param {Map<string, string>} params - Query parameter key-value pairs
   * @returns {string} Complete URL string
   */
  static buildUrl(base: string, params: Map<string, string>): string {
    hilog.info(DOMAIN, TAG, 'HttpUtils buildUrl: building URL from base=%{public}s, paramCount=%{public}d',
      base, params.size);
    if (params.size === 0) {
      hilog.debug(DOMAIN, TAG, 'HttpUtils buildUrl: no params, returning base URL');
      return base;
    }
    let queryString: string = '';
    let isFirst: boolean = true;
    params.forEach((value: string, key: string) => {
      if (!isFirst) {
        queryString += '&';
      }
      queryString += encodeURIComponent(key) + '=' + encodeURIComponent(value);
      isFirst = false;
    });
    const separator: string = base.includes('?') ? '&' : '?';
    const result: string = base + separator + queryString;
    hilog.debug(DOMAIN, TAG, 'HttpUtils buildUrl: built URL length=%{public}d', result.length);
    return result;
  }

  /**
   * Parses a query string into a key-value map.
   * Handles URL encoding automatically and ignores empty parameters.
   * @param {string} qs - Query string (with or without a leading '?')
   * @returns {Map<string, string>} Parsed parameter key-value pairs
   */
  static parseQueryString(qs: string): Map<string, string> {
    hilog.info(DOMAIN, TAG, 'HttpUtils parseQueryString: parsing query string, length=%{public}d', qs.length);
    const result: Map<string, string> = new Map<string, string>();
    let cleanQs: string = qs;
    if (cleanQs.startsWith('?')) {
      cleanQs = cleanQs.substring(1);
    }
    if (cleanQs.length === 0) {
      hilog.debug(DOMAIN, TAG, 'HttpUtils parseQueryString: empty query string');
      return result;
    }
    const pairs: string[] = cleanQs.split('&');
    for (let i: number = 0; i < pairs.length; i++) {
      const pair: string = pairs[i];
      const eqIndex: number = pair.indexOf('=');
      if (eqIndex > 0) {
        const key: string = decodeURIComponent(pair.substring(0, eqIndex));
        const value: string = decodeURIComponent(pair.substring(eqIndex + 1));
        result.set(key, value);
        hilog.debug(DOMAIN, TAG, 'HttpUtils parseQueryString: parsed key=%{public}s', key);
      } else if (pair.length > 0) {
        result.set(decodeURIComponent(pair), '');
      }
    }
    hilog.info(DOMAIN, TAG, 'HttpUtils parseQueryString: parsed %{public}d params', result.size);
    return result;
  }

  // ========================================
  // Config creation methods
  // ========================================

  /**
   * Creates a default request configuration.
   * Returns a request config with default timeout, Content-Type and Accept headers.
   * @returns {HttpRequestConfig} Default request configuration
   */
  static createDefaultConfig(): HttpRequestConfig {
    hilog.info(DOMAIN, TAG, 'HttpUtils createDefaultConfig: creating default config');
    const headers: Map<string, string> = new Map<string, string>();
    headers.set('Content-Type', HttpUtils.DEFAULT_CONTENT_TYPE);
    headers.set('Accept', HttpUtils.DEFAULT_ACCEPT);
    headers.set('User-Agent', 'SystemConfig/1.0');
    const config: HttpRequestConfig = {
      url: '',
      method: HttpMethod.GET,
      headers: headers,
      body: '',
      timeout: HttpUtils.DEFAULT_TIMEOUT
    };
    hilog.debug(DOMAIN, TAG, 'HttpUtils createDefaultConfig: config created with timeout=%{public}d', config.timeout);
    return config;
  }

  // ========================================
  // Status code checking methods
  // ========================================

  /**
   * Checks whether an HTTP status code indicates success.
   * 2xx status codes mean the request was handled successfully.
   * @param {number} code - HTTP status code
   * @returns {boolean} Whether the status is a success
   */
  static isSuccessStatus(code: number): boolean {
    const result: boolean = code >= 200 && code < 300;
    hilog.debug(DOMAIN, TAG, 'HttpUtils isSuccessStatus: code=%{public}d, result=%{public}s',
      code, result.toString());
    return result;
  }

  /**
   * Checks whether an HTTP status code indicates a client error.
   * 4xx status codes mean the client request is faulty.
   * @param {number} code - HTTP status code
   * @returns {boolean} Whether the status is a client error
   */
  static isClientError(code: number): boolean {
    const result: boolean = code >= 400 && code < 500;
    hilog.debug(DOMAIN, TAG, 'HttpUtils isClientError: code=%{public}d, result=%{public}s',
      code, result.toString());
    return result;
  }

  /**
   * Checks whether an HTTP status code indicates a server error.
   * 5xx status codes mean server-side processing failed.
   * @param {number} code - HTTP status code
   * @returns {boolean} Whether the status is a server error
   */
  static isServerError(code: number): boolean {
    const result: boolean = code >= 500 && code < 600;
    hilog.debug(DOMAIN, TAG, 'HttpUtils isServerError: code=%{public}d, result=%{public}s',
      code, result.toString());
    return result;
  }

  // ========================================
  // Helper methods
  // ========================================

  /**
   * Gets the localized description text for a status code.
   * @param {number} code - HTTP status code
   * @returns {string} Status code description text
   */
  static getStatusText(code: number): string {
    const statusMap: Map<number, string> = new Map<number, string>([
      [200, 'http_status_200'], [201, 'http_status_201'], [204, 'http_status_204'], [301, 'http_status_301'],
      [302, 'http_status_302'], [400, 'http_status_400'], [401, 'http_status_401'], [403, 'http_status_403'],
      [404, 'http_status_404'], [408, 'http_status_408'], [500, 'http_status_500'],
      [502, 'http_status_502'], [503, 'http_status_503']
    ]);
    return ResourceHelper.getStringByName(statusMap.get(code) ?? 'http_status_unknown');
  }
}
