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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// HTTP 方法枚举
// ========================================

/**
 * HTTP 请求方法枚举。
 * 定义标准的 RESTful HTTP 方法类型。
 */
export enum HttpMethod {
  /** GET 请求，用于获取资源 */
  GET = 'GET',
  /** POST 请求，用于创建资源 */
  POST = 'POST',
  /** PUT 请求，用于全量更新资源 */
  PUT = 'PUT',
  /** DELETE 请求，用于删除资源 */
  DELETE = 'DELETE',
  /** PATCH 请求，用于局部更新资源 */
  PATCH = 'PATCH'
}

// ========================================
// HTTP 响应接口
// ========================================

/**
 * HTTP 响应数据接口。
 * 封装服务器返回的完整响应信息。
 */
export interface HttpResponse {
  /** HTTP 状态码 */
  status: number;
  /** 响应体数据 */
  data: string;
  /** 响应头键值对 */
  headers: Map<string, string>;
  /** 响应时间戳（毫秒） */
  timestamp: number;
}

// ========================================
// HTTP 请求配置接口
// ========================================

/**
 * HTTP 请求配置接口。
 * 定义发起 HTTP 请求所需的全部参数。
 */
export interface HttpRequestConfig {
  /** 请求 URL 地址 */
  url: string;
  /** 请求方法 */
  method: HttpMethod;
  /** 请求头键值对 */
  headers: Map<string, string>;
  /** 请求体内容 */
  body: string;
  /** 请求超时时间（毫秒） */
  timeout: number;
}

// ========================================
// 拦截器接口
// ========================================

/**
 * 请求拦截器接口。
 * 在请求发送前对请求配置进行预处理。
 */
export interface RequestInterceptor {
  /**
   * 拦截并处理请求配置。
   * @param {HttpRequestConfig} config - 原始请求配置
   * @returns {HttpRequestConfig} 处理后的请求配置
   */
  onRequest(config: HttpRequestConfig): HttpRequestConfig;
}

/**
 * 响应拦截器接口。
 * 在收到响应后对响应数据进行后处理。
 */
export interface ResponseInterceptor {
  /**
   * 拦截并处理响应数据。
   * @param {HttpResponse} response - 原始响应数据
   * @returns {HttpResponse} 处理后的响应数据
   */
  onResponse(response: HttpResponse): HttpResponse;
}

// ========================================
// HTTP 工具类
// ========================================

/**
 * HTTP 工具类。
 * 提供 URL 构建、查询字符串解析、默认配置创建、
 * 状态码判断等静态方法，简化 HTTP 请求处理流程。
 */
export class HttpUtils {
  /** 默认请求超时时间（毫秒） */
  private static readonly DEFAULT_TIMEOUT: number = SystemConfigConstants.OPERATION_TIMEOUT_MS;
  /** 默认 Content-Type */
  private static readonly DEFAULT_CONTENT_TYPE: string = 'application/json';
  /** 默认 Accept 头 */
  private static readonly DEFAULT_ACCEPT: string = 'application/json';

  // ========================================
  // URL 构建与解析方法
  // ========================================

  /**
   * 构建带查询参数的完整 URL。
   * 将参数对象拼接为 URL 查询字符串并附加到基础 URL 后。
   * @param {string} base - 基础 URL 地址
   * @param {Map<string, string>} params - 查询参数键值对
   * @returns {string} 完整的 URL 字符串
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
   * 解析查询字符串为键值对映射。
   * 自动处理 URL 编码并忽略空参数。
   * @param {string} qs - 查询字符串（可带或不带 '?' 前缀）
   * @returns {Map<string, string>} 解析后的参数键值对
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
  // 配置创建方法
  // ========================================

  /**
   * 创建默认请求配置。
   * 返回包含默认超时、Content-Type 和 Accept 头的请求配置。
   * @returns {HttpRequestConfig} 默认请求配置
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
  // 状态码判断方法
  // ========================================

  /**
   * 判断 HTTP 状态码是否为成功状态。
   * 2xx 状态码表示请求成功处理。
   * @param {number} code - HTTP 状态码
   * @returns {boolean} 是否为成功状态
   */
  static isSuccessStatus(code: number): boolean {
    const result: boolean = code >= 200 && code < 300;
    hilog.debug(DOMAIN, TAG, 'HttpUtils isSuccessStatus: code=%{public}d, result=%{public}s',
      code, result.toString());
    return result;
  }

  /**
   * 判断 HTTP 状态码是否为客户端错误。
   * 4xx 状态码表示客户端请求有误。
   * @param {number} code - HTTP 状态码
   * @returns {boolean} 是否为客户端错误
   */
  static isClientError(code: number): boolean {
    const result: boolean = code >= 400 && code < 500;
    hilog.debug(DOMAIN, TAG, 'HttpUtils isClientError: code=%{public}d, result=%{public}s',
      code, result.toString());
    return result;
  }

  /**
   * 判断 HTTP 状态码是否为服务器错误。
   * 5xx 状态码表示服务器端处理异常。
   * @param {number} code - HTTP 状态码
   * @returns {boolean} 是否为服务器错误
   */
  static isServerError(code: number): boolean {
    const result: boolean = code >= 500 && code < 600;
    hilog.debug(DOMAIN, TAG, 'HttpUtils isServerError: code=%{public}d, result=%{public}s',
      code, result.toString());
    return result;
  }

  // ========================================
  // 辅助方法
  // ========================================

  /**
   * 获取状态码的中文描述文本。
   * @param {number} code - HTTP 状态码
   * @returns {string} 状态码描述文本
   */
  static getStatusText(code: number): string {
    const statusMap: Map<number, string> = new Map<number, string>([
      [200, '成功'], [201, '已创建'], [204, '无内容'], [301, '永久重定向'],
      [302, '临时重定向'], [400, '错误请求'], [401, '未授权'], [403, '禁止访问'],
      [404, '未找到'], [408, '请求超时'], [500, '服务器内部错误'],
      [502, '错误网关'], [503, '服务不可用']
    ]);
    return statusMap.get(code) ?? '未知状态';
  }
}
