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

/** 日志域ID，用于标识日志来源模块 */
const DOMAIN: number = 0xFF00;
/** 日志前缀，用于过滤和识别日志来源 */
const PREFIX: string = '[Sample_SystemLoad]';

/**
 * 日志工具类
 * 封装hilog接口，提供统一的日志记录能力
 * 支持debug、info、warn、error四个日志级别
 * 
 * @remarks
 * 该类为单例模式，通过导出的logger实例使用
 * 所有日志均带有统一的前缀标识，便于过滤
 * 
 * @example
 * ```typescript
 * import { logger } from '@ohos/systemload';
 * 
 * logger.debug('调试信息');
 * logger.info('普通信息');
 * logger.warn('警告信息');
 * logger.error('错误信息');
 * ```
 */
class Logger {
  /**
   * 记录调试级别日志
   * 用于开发过程中的调试信息输出
   * 
   * @param message - 日志消息内容
   * @remarks
   * 调试日志仅在开发环境可见，发布版本会被过滤
   */
  debug(message: string): void {
    // 调用hilog调试级别接口
    hilog.debug(DOMAIN, PREFIX, '%{public}s', message);
  }

  /**
   * 记录信息级别日志
   * 用于记录程序运行过程中的关键信息
   * 
   * @param message - 日志消息内容
   * @remarks
   * 信息日志用于跟踪程序执行流程
   */
  info(message: string): void {
    // 调用hilog信息级别接口
    hilog.info(DOMAIN, PREFIX, '%{public}s', message);
  }

  /**
   * 记录警告级别日志
   * 用于记录可能的问题或异常情况
   * 
   * @param message - 日志消息内容
   * @remarks
   * 警告日志表示潜在问题，但程序仍可继续运行
   */
  warn(message: string): void {
    // 调用hilog警告级别接口
    hilog.warn(DOMAIN, PREFIX, '%{public}s', message);
  }

  /**
   * 记录错误级别日志
   * 用于记录严重的错误信息
   * 
   * @param message - 日志消息内容
   * @remarks
   * 错误日志表示程序遇到无法继续的严重问题
   */
  error(message: string): void {
    // 调用hilog错误级别接口
    hilog.error(DOMAIN, PREFIX, '%{public}s', message);
  }
}

/** 全局日志实例，供整个应用使用 */
export const logger = new Logger();
