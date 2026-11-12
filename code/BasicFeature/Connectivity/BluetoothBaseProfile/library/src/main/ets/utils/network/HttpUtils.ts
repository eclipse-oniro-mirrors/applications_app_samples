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
 * HTTP method enum
 */
export enum HttpMethod {
  GET = 'GET',
  POST = 'POST',
  PUT = 'PUT',
  DELETE = 'DELETE',
  PATCH = 'PATCH'
}

/**
 * HTTP sound respond connect port
 */
export interface HttpResponse {
  statusCode: number;
  data: string;
  headers: Record<string, string>;
}

/**
 * HTTP request config connect port
 */
export interface HttpRequestConfig {
  url: string;
  method: HttpMethod;
  headers?: Record<string, string>;
  body?: string;
  timeout?: number;
}

/**
 * request interceptor interface
 */
export interface RequestInterceptor {
  onRequest(config: HttpRequestConfig): HttpRequestConfig;
}

/**
 * response interceptor interface
 */
export interface ResponseInterceptor {
  onResponse(response: HttpResponse): HttpResponse;
}

/**
 * HTTP utility class
 * provides HTTP request request relative relate actual use method method
 */
export class HttpUtils {
  /** request interceptor list */
  private static requestInterceptors: RequestInterceptor[] = [];
  /** response interceptor list */
  private static responseInterceptors: ResponseInterceptor[] = [];
  /** default timeout */
  private static readonly DEFAULT_TIMEOUT: number = 30000;

  /**
   * build URL query parameters
   * @param params - params against object
   * @returns query parameter string
   */
  static buildQueryString(params: Record<string, string>): string {
    const parts: string[] = [];
    for (const key of Object.keys(params)) {
      parts.push(`${encodeURIComponent(key)}=${encodeURIComponent(params[key])}`);
    }
    return parts.join('&');
  }

  /**
   * parse URL query parameters
   * @param queryString - query string
   * @returns params against object
   */
  static parseQueryString(queryString: string): Record<string, string> {
    const result: Record<string, string> = {};
    if (!queryString) {
      return result;
    }
    const clean: string = queryString.startsWith('?') ? queryString.substring(1) : queryString;
    const pairs: string[] = clean.split('&');
    for (const pair of pairs) {
      const eqIndex: number = pair.indexOf('=');
      if (eqIndex > 0) {
        const key: string = decodeURIComponent(pair.substring(0, eqIndex));
        const value: string = decodeURIComponent(pair.substring(eqIndex + 1));
        result[key] = value;
      }
    }
    return result;
  }

  /**
   * build full URL
   * @param baseUrl - base URL
   * @param path - path
   * @param params - check query params
   * @returns full URL
   */
  static buildUrl(baseUrl: string, path: string, params?: Record<string, string>): string {
    let url: string = baseUrl;
    if (path && !path.startsWith('/')) {
      url += '/';
    }
    url += path;
    if (params) {
      const qs: string = HttpUtils.buildQueryString(params);
      if (qs) {
        url += (url.indexOf('?') === -1 ? '?' : '&') + qs;
      }
    }
    return url;
  }

  /**
   * create request config
   * @param url - request URL
   * @param method - HTTP method method
   * @param body - request body
   * @returns request config
   */
  static createConfig(url: string, method: HttpMethod = HttpMethod.GET, body?: string): HttpRequestConfig {
    return {
      url: url,
      method: method,
      headers: { 'Content-Type': 'application/json' },
      body: body,
      timeout: HttpUtils.DEFAULT_TIMEOUT
    };
  }

  /**
   * add request interceptor
   * @param interceptor - interceptor
   */
  static addRequestInterceptor(interceptor: RequestInterceptor): void {
    HttpUtils.requestInterceptors.push(interceptor);
  }

  /**
   * add response interceptor
   * @param interceptor - interceptor
   */
  static addResponseInterceptor(interceptor: ResponseInterceptor): void {
    HttpUtils.responseInterceptors.push(interceptor);
  }

  /**
   * check HTTP state state code whether success
   * @param statusCode - HTTP state state code
   * @returns whether success
   */
  static isSuccess(statusCode: number): boolean {
    return statusCode >= 200 && statusCode < 300;
  }

  /**
   * check whether need redirect
   * @param statusCode - HTTP state state code
   * @returns whether need redirect
   */
  static isRedirect(statusCode: number): boolean {
    return statusCode >= 300 && statusCode < 400;
  }

  /**
   * check whether for client error
   * @param statusCode - HTTP state state code
   * @returns whether for client error
   */
  static isClientError(statusCode: number): boolean {
    return statusCode >= 400 && statusCode < 500;
  }

  /**
   * check whether for server error
   * @param statusCode - HTTP state state code
   * @returns whether for server error
   */
  static isServerError(statusCode: number): boolean {
    return statusCode >= 500;
  }

  /**
   * get state state code describe describe
   * @param statusCode - HTTP state state code
   * @returns state state code describe describe
   */
  static getStatusText(statusCode: number): string {
    const statusTexts: Record<number, string> = {
      200: 'OK', 201: 'Created', 204: 'No Content',
      301: 'Moved Permanently', 302: 'Found', 304: 'Not Modified',
      400: 'Bad Request', 401: 'Unauthorized', 403: 'Forbidden',
      404: 'Not Found', 405: 'Method Not Allowed', 408: 'Request Timeout',
      500: 'Internal Server Error', 502: 'Bad Gateway', 503: 'Service Unavailable'
    };
    return statusTexts[statusCode] || 'Unknown';
  }

  /**
   * clear all interceptors
   */
  static clearInterceptors(): void {
    HttpUtils.requestInterceptors = [];
    HttpUtils.responseInterceptors = [];
  }
}
