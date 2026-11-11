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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HttpUtils, HttpMethod } from 'library';
import type { HttpRequestConfig } from 'library';
import { SystemConfigConstants } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// HttpUtils 工具类测试套件
// ========================================

/**
 * HttpUtils 工具类测试套件。
 * 测试 HttpUtils 类中 URL 构建、查询字符串解析、
 * 默认配置创建、状态码判断等方法的正确性。
 */
export default function httpUtilsTest(): void {
  describe('HttpUtilsTest', () => {

    // ========================================
    // buildUrl - URL 构建测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_0100
     * @tc.name testHttpUtils0001
     * @tc.desc 正向: URL 构建 - 无参数时返回 base URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0001: begin');
      const base: string = 'https://api.example.com/data';
      const params: Map<string, string> = new Map<string, string>();
      const result: string = HttpUtils.buildUrl(base, params);
      expect(result).assertEqual(base);
      expect(result.indexOf('?')).assertEqual(-1);
      expect(result.length).assertEqual(base.length);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0001: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0200
     * @tc.name testHttpUtils0002
     * @tc.desc 正向: URL 构建 - 单参数拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0002: begin');
      const base: string = 'https://api.example.com/data';
      const params: Map<string, string> = new Map<string, string>();
      params.set('key', 'value');
      const result: string = HttpUtils.buildUrl(base, params);
      expect(result.indexOf('?')).assertLarger(-1);
      expect(result.indexOf('key=value')).assertLarger(-1);
      expect(result.startsWith(base)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0002: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0300
     * @tc.name testHttpUtils0003
     * @tc.desc 正向: URL 构建 - 多参数拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0003: begin');
      const base: string = 'https://api.example.com/search';
      const params: Map<string, string> = new Map<string, string>();
      params.set('q', 'test');
      params.set('page', '1');
      params.set('size', '10');
      const result: string = HttpUtils.buildUrl(base, params);
      expect(result.indexOf('?')).assertLarger(-1);
      expect(result.indexOf('&')).assertLarger(-1);
      expect(result.indexOf('q=test')).assertLarger(-1);
      expect(result.indexOf('page=1')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0003: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0400
     * @tc.name testHttpUtils0004
     * @tc.desc 正向: URL 构建 - base 已有问号时使用 & 连接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0004: begin');
      const base: string = 'https://api.example.com/data?existing=param';
      const params: Map<string, string> = new Map<string, string>();
      params.set('new', 'value');
      const result: string = HttpUtils.buildUrl(base, params);
      expect(result.indexOf('?')).assertLarger(-1);
      expect(result.indexOf('existing=param')).assertLarger(-1);
      expect(result.indexOf('&new=value')).assertLarger(-1);
      expect(result.indexOf('&&')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0004: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0500
     * @tc.name testHttpUtils0005
     * @tc.desc 正向: URL 构建 - 特殊字符 URL 编码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0005: begin');
      const base: string = 'https://api.example.com/search';
      const params: Map<string, string> = new Map<string, string>();
      params.set('q', '测试中文');
      params.set('symbol', 'a&b=c');
      const result: string = HttpUtils.buildUrl(base, params);
      expect(result.indexOf('%')).assertLarger(-1);
      expect(result.indexOf('测试中文')).assertEqual(-1);
      expect(result.indexOf('a&b=c')).assertEqual(-1);
      expect(result.length).assertLarger(base.length + 10);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0005: end');
    });

    // ========================================
    // parseQueryString - 解析查询字符串测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_0600
     * @tc.name testHttpUtils0006
     * @tc.desc 正向: 解析查询串 - 标准格式
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0006: begin');
      const qs: string = '?a=1&b=2&c=3';
      const result: Map<string, string> = HttpUtils.parseQueryString(qs);
      expect(result.size).assertEqual(3);
      expect(result.get('a')).assertEqual('1');
      expect(result.get('b')).assertEqual('2');
      expect(result.get('c')).assertEqual('3');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0006: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0700
     * @tc.name testHttpUtils0007
     * @tc.desc 正向: 解析查询串 - 无前缀 ?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0007: begin');
      const qs: string = 'key1=value1&key2=value2';
      const result: Map<string, string> = HttpUtils.parseQueryString(qs);
      expect(result.size).assertEqual(2);
      expect(result.get('key1')).assertEqual('value1');
      expect(result.get('key2')).assertEqual('value2');
      expect(result.has('key1')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0007: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0800
     * @tc.name testHttpUtils0008
     * @tc.desc 正向: 解析查询串 - 空值处理
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0008: begin');
      const qs: string = 'key1=&key2=value2';
      const result: Map<string, string> = HttpUtils.parseQueryString(qs);
      expect(result.size).assertEqual(2);
      expect(result.get('key1')).assertEqual('');
      expect(result.get('key2')).assertEqual('value2');
      expect(result.has('key1')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0008: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_0900
     * @tc.name testHttpUtils0009
     * @tc.desc 正向: 解析查询串 - 仅键无等号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0009: begin');
      const qs: string = 'key1&key2=value2';
      const result: Map<string, string> = HttpUtils.parseQueryString(qs);
      expect(result.size).assertLarger(0);
      expect(result.get('key2')).assertEqual('value2');
      expect(result.has('key1')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0009: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1000
     * @tc.name testHttpUtils0010
     * @tc.desc 正向: 解析查询串 - URL 编码解码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0010: begin');
      const qs: string = 'name=%E6%B5%8B%E8%AF%95&symbol=a%26b';
      const result: Map<string, string> = HttpUtils.parseQueryString(qs);
      expect(result.size).assertEqual(2);
      expect(result.get('name')).assertEqual('测试');
      expect(result.get('symbol')).assertEqual('a&b');
      expect(result.get('name')?.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0010: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1100
     * @tc.name testHttpUtils0011
     * @tc.desc 边界: 解析空查询串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0011: begin');
      const qs1: string = '';
      const qs2: string = '?';
      const result1: Map<string, string> = HttpUtils.parseQueryString(qs1);
      const result2: Map<string, string> = HttpUtils.parseQueryString(qs2);
      expect(result1.size).assertEqual(0);
      expect(result2.size).assertEqual(0);
      expect(result1.size).assertEqual(result2.size);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0011: end');
    });

    // ========================================
    // createDefaultConfig - 默认配置测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_1200
     * @tc.name testHttpUtils0012
     * @tc.desc 正向: 默认配置 - 结构完整性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0012: begin');
      const config: HttpRequestConfig = HttpUtils.createDefaultConfig();
      expect(config.url).assertEqual('');
      expect(config.method).assertEqual(HttpMethod.GET);
      expect(config.body).assertEqual('');
      expect(config.headers.size).assertEqual(3);
      expect(config.timeout).assertEqual(10000);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0012: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1300
     * @tc.name testHttpUtils0013
     * @tc.desc 正向: 默认配置 - Content-Type 正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0013: begin');
      const config: HttpRequestConfig = HttpUtils.createDefaultConfig();
      expect(config.headers.has('Content-Type')).assertTrue();
      expect(config.headers.get('Content-Type')).assertEqual('application/json');
      expect(config.headers.size).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0013: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1400
     * @tc.name testHttpUtils0014
     * @tc.desc 正向: 默认配置 - 超时值等于常量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0014: begin');
      const config: HttpRequestConfig = HttpUtils.createDefaultConfig();
      expect(config.timeout).assertEqual(SystemConfigConstants.OPERATION_TIMEOUT_MS);
      expect(config.timeout).assertEqual(10000);
      expect(config.headers.has('Accept')).assertTrue();
      expect(config.headers.get('Accept')).assertEqual('application/json');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0014: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1500
     * @tc.name testHttpUtils0015
     * @tc.desc 正向: 默认配置 - User-Agent 设置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0015: begin');
      const config: HttpRequestConfig = HttpUtils.createDefaultConfig();
      expect(config.headers.has('User-Agent')).assertTrue();
      expect(config.headers.get('User-Agent')).assertEqual('SystemConfig/1.0');
      expect(config.headers.size).assertLarger(2);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0015: end');
    });

    // ========================================
    // isSuccessStatus - 成功状态判断测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_1600
     * @tc.name testHttpUtils0016
     * @tc.desc 正向: 成功状态 - 200 OK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0016: begin');
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      expect(HttpUtils.isSuccessStatus(201)).assertTrue();
      expect(HttpUtils.isSuccessStatus(204)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0016: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1700
     * @tc.name testHttpUtils0017
     * @tc.desc 正向: 成功状态 - 2xx 范围
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0017: begin');
      expect(HttpUtils.isSuccessStatus(299)).assertTrue();
      expect(HttpUtils.isSuccessStatus(250)).assertTrue();
      expect(HttpUtils.isSuccessStatus(202)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0017: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1800
     * @tc.name testHttpUtils0018
     * @tc.desc 边界: 成功状态 - 300 边界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0018: begin');
      expect(HttpUtils.isSuccessStatus(300)).assertFalse();
      expect(HttpUtils.isSuccessStatus(301)).assertFalse();
      expect(HttpUtils.isSuccessStatus(302)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0018: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_1900
     * @tc.name testHttpUtils0019
     * @tc.desc 边界: 成功状态 - 199 边界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0019: begin');
      expect(HttpUtils.isSuccessStatus(199)).assertFalse();
      expect(HttpUtils.isSuccessStatus(100)).assertFalse();
      expect(HttpUtils.isSuccessStatus(0)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0019: end');
    });

    // ========================================
    // isClientError - 客户端错误判断测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_2000
     * @tc.name testHttpUtils0020
     * @tc.desc 正向: 客户端错误 - 4xx 范围
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0020: begin');
      expect(HttpUtils.isClientError(400)).assertTrue();
      expect(HttpUtils.isClientError(401)).assertTrue();
      expect(HttpUtils.isClientError(403)).assertTrue();
      expect(HttpUtils.isClientError(404)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0020: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2100
     * @tc.name testHttpUtils0021
     * @tc.desc 正向: 客户端错误 - 4xx 上界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0021', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0021: begin');
      expect(HttpUtils.isClientError(499)).assertTrue();
      expect(HttpUtils.isClientError(422)).assertTrue();
      expect(HttpUtils.isClientError(429)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0021: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2200
     * @tc.name testHttpUtils0022
     * @tc.desc 边界: 客户端错误 - 399 下界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0022', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0022: begin');
      expect(HttpUtils.isClientError(399)).assertFalse();
      expect(HttpUtils.isClientError(300)).assertFalse();
      expect(HttpUtils.isClientError(200)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0022: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2300
     * @tc.name testHttpUtils0023
     * @tc.desc 边界: 客户端错误 - 500 上界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0023', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0023: begin');
      expect(HttpUtils.isClientError(500)).assertFalse();
      expect(HttpUtils.isClientError(503)).assertFalse();
      expect(HttpUtils.isClientError(600)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0023: end');
    });

    // ========================================
    // isServerError - 服务器错误判断测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_2400
     * @tc.name testHttpUtils0024
     * @tc.desc 正向: 服务器错误 - 5xx 范围
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0024', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0024: begin');
      expect(HttpUtils.isServerError(500)).assertTrue();
      expect(HttpUtils.isServerError(502)).assertTrue();
      expect(HttpUtils.isServerError(503)).assertTrue();
      expect(HttpUtils.isServerError(504)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0024: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2500
     * @tc.name testHttpUtils0025
     * @tc.desc 正向: 服务器错误 - 5xx 上界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0025', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0025: begin');
      expect(HttpUtils.isServerError(599)).assertTrue();
      expect(HttpUtils.isServerError(511)).assertTrue();
      expect(HttpUtils.isServerError(599)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0025: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2600
     * @tc.name testHttpUtils0026
     * @tc.desc 边界: 服务器错误 - 499 下界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0026', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0026: begin');
      expect(HttpUtils.isServerError(499)).assertFalse();
      expect(HttpUtils.isServerError(400)).assertFalse();
      expect(HttpUtils.isServerError(404)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0026: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2700
     * @tc.name testHttpUtils0027
     * @tc.desc 边界: 服务器错误 - 600 上界
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0027', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0027: begin');
      expect(HttpUtils.isServerError(600)).assertFalse();
      expect(HttpUtils.isServerError(601)).assertFalse();
      expect(HttpUtils.isServerError(700)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0027: end');
    });

    // ========================================
    // getStatusText - 状态文本获取测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_2800
     * @tc.name testHttpUtils0028
     * @tc.desc 正向: 状态文本 - 已知状态 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0028', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0028: begin');
      expect(HttpUtils.getStatusText(200)).assertEqual('成功');
      expect(HttpUtils.getStatusText(201)).assertEqual('已创建');
      expect(HttpUtils.getStatusText(204)).assertEqual('无内容');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0028: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_2900
     * @tc.name testHttpUtils0029
     * @tc.desc 正向: 状态文本 - 已知状态 3xx/4xx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0029', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0029: begin');
      expect(HttpUtils.getStatusText(301)).assertEqual('永久重定向');
      expect(HttpUtils.getStatusText(302)).assertEqual('临时重定向');
      expect(HttpUtils.getStatusText(400)).assertEqual('错误请求');
      expect(HttpUtils.getStatusText(401)).assertEqual('未授权');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0029: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_3000
     * @tc.name testHttpUtils0030
     * @tc.desc 正向: 状态文本 - 已知状态 4xx/5xx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0030', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0030: begin');
      expect(HttpUtils.getStatusText(403)).assertEqual('禁止访问');
      expect(HttpUtils.getStatusText(404)).assertEqual('未找到');
      expect(HttpUtils.getStatusText(408)).assertEqual('请求超时');
      expect(HttpUtils.getStatusText(500)).assertEqual('服务器内部错误');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0030: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_3100
     * @tc.name testHttpUtils0031
     * @tc.desc 正向: 状态文本 - 已知状态 5xx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0031', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0031: begin');
      expect(HttpUtils.getStatusText(502)).assertEqual('错误网关');
      expect(HttpUtils.getStatusText(503)).assertEqual('服务不可用');
      expect(HttpUtils.getStatusText(502).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testHttpUtils0031: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_3200
     * @tc.name testHttpUtils0032
     * @tc.desc 边界: 状态文本 - 未知状态
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0032', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0032: begin');
      expect(HttpUtils.getStatusText(999)).assertEqual('未知状态');
      expect(HttpUtils.getStatusText(0)).assertEqual('未知状态');
      expect(HttpUtils.getStatusText(100)).assertEqual('未知状态');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0032: end');
    });

    // ========================================
    // HttpMethod 枚举测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_3300
     * @tc.name testHttpUtils0033
     * @tc.desc 正向: HTTP 方法枚举值验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHttpUtils0033', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0033: begin');
      expect(HttpMethod.GET).assertEqual('GET');
      expect(HttpMethod.POST).assertEqual('POST');
      expect(HttpMethod.PUT).assertEqual('PUT');
      expect(HttpMethod.DELETE).assertEqual('DELETE');
      expect(HttpMethod.PATCH).assertEqual('PATCH');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0033: end');
    });

    // ========================================
    // 综合场景测试
    // ========================================

    /**
     * @tc.number SUB_HTTP_UTILS_3400
     * @tc.name testHttpUtils0034
     * @tc.desc 正向: URL 构建后解析往返一致性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0034', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0034: begin');
      const base: string = 'https://api.example.com/data';
      const params: Map<string, string> = new Map<string, string>();
      params.set('key1', 'value1');
      params.set('key2', 'value2');
      const builtUrl: string = HttpUtils.buildUrl(base, params);
      const queryPart: string = builtUrl.substring(builtUrl.indexOf('?') + 1);
      const parsed: Map<string, string> = HttpUtils.parseQueryString(queryPart);
      expect(parsed.size).assertEqual(2);
      expect(parsed.get('key1')).assertEqual('value1');
      expect(parsed.get('key2')).assertEqual('value2');
      hilog.info(DOMAIN, TAG, 'testHttpUtils0034: end');
    });

    /**
     * @tc.number SUB_HTTP_UTILS_3500
     * @tc.name testHttpUtils0035
     * @tc.desc 正向: 状态码判断全覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testHttpUtils0035', 0, () => {
      hilog.info(DOMAIN, TAG, 'testHttpUtils0035: begin');
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      expect(HttpUtils.isClientError(200)).assertFalse();
      expect(HttpUtils.isServerError(200)).assertFalse();
      expect(HttpUtils.isClientError(400)).assertTrue();
      expect(HttpUtils.isSuccessStatus(400)).assertFalse();
      expect(HttpUtils.isServerError(500)).assertTrue();
      expect(HttpUtils.isSuccessStatus(500)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testHttpUtils0035: end');
    });
  });
}
