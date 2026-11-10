/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * HTTP方法枚举
 */
export enum HttpMethod {
  GET = 'GET',
  POST = 'POST',
  PUT = 'PUT',
  DELETE = 'DELETE',
  PATCH = 'PATCH'
}

/**
 * HTTP响应接口
 */
export interface HttpResponse {
  statusCode: number;
  data: string;
  headers: Record<string, string>;
}

/**
 * HTTP请求配置接口
 */
export interface HttpRequestConfig {
  url: string;
  method: HttpMethod;
  headers?: Record<string, string>;
  body?: string;
  timeout?: number;
}

/**
 * 请求拦截器接口
 */
export interface RequestInterceptor {
  onRequest(config: HttpRequestConfig): HttpRequestConfig;
}

/**
 * 响应拦截器接口
 */
export interface ResponseInterceptor {
  onResponse(response: HttpResponse): HttpResponse;
}

/**
 * HTTP工具类
 * 提供HTTP请求相关的实用方法
 */
export class HttpUtils {
  /** 请求拦截器列表 */
  private static requestInterceptors: RequestInterceptor[] = [];
  /** 响应拦截器列表 */
  private static responseInterceptors: ResponseInterceptor[] = [];
  /** 默认超时时间 */
  private static readonly DEFAULT_TIMEOUT: number = 30000;

  /**
   * 构建URL查询参数
   * @param params - 参数对象
   * @returns 查询参数字符串
   */
  static buildQueryString(params: Record<string, string>): string {
    const parts: string[] = [];
    for (const key of Object.keys(params)) {
      parts.push(encodeURIComponent(key) + '=' + encodeURIComponent(params[key]));
    }
    return parts.join('&');
  }

  /**
   * 解析URL查询参数
   * @param queryString - 查询字符串
   * @returns 参数对象
   */
  static parseQueryString(queryString: string): Record<string, string> {
    const result: Record<string, string> = {};
    if (!queryString) return result;
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
   * 构建完整的URL
   * @param baseUrl - 基础URL
   * @param path - 路径
   * @param params - 查询参数
   * @returns 完整的URL
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
   * 创建请求配置
   * @param url - 请求URL
   * @param method - HTTP方法
   * @param body - 请求体
   * @returns 请求配置
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
   * 添加请求拦截器
   * @param interceptor - 拦截器
   */
  static addRequestInterceptor(interceptor: RequestInterceptor): void {
    HttpUtils.requestInterceptors.push(interceptor);
  }

  /**
   * 添加响应拦截器
   * @param interceptor - 拦截器
   */
  static addResponseInterceptor(interceptor: ResponseInterceptor): void {
    HttpUtils.responseInterceptors.push(interceptor);
  }

  /**
   * 检查HTTP状态码是否成功
   * @param statusCode - HTTP状态码
   * @returns 是否成功
   */
  static isSuccess(statusCode: number): boolean {
    return statusCode >= 200 && statusCode < 300;
  }

  /**
   * 检查是否需要重定向
   * @param statusCode - HTTP状态码
   * @returns 是否需要重定向
   */
  static isRedirect(statusCode: number): boolean {
    return statusCode >= 300 && statusCode < 400;
  }

  /**
   * 检查是否为客户端错误
   * @param statusCode - HTTP状态码
   * @returns 是否为客户端错误
   */
  static isClientError(statusCode: number): boolean {
    return statusCode >= 400 && statusCode < 500;
  }

  /**
   * 检查是否为服务端错误
   * @param statusCode - HTTP状态码
   * @returns 是否为服务端错误
   */
  static isServerError(statusCode: number): boolean {
    return statusCode >= 500;
  }

  /**
   * 获取状态码描述
   * @param statusCode - HTTP状态码
   * @returns 状态码描述
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
   * 清除所有拦截器
   */
  static clearInterceptors(): void {
    HttpUtils.requestInterceptors = [];
    HttpUtils.responseInterceptors = [];
  }
}
