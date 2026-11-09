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

import { systemLoad, BusinessError } from '@kit.BasicServicesKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { logger } from '../utils/Logger';

/**
 * 系统负载回调函数类型定义
 * @param level - 系统负载级别枚举值
 */
type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

/**
 * 系统负载错误类
 * 继承自Error，用于封装系统负载API调用失败时的错误信息
 * 保留原始BusinessError的code和message
 */
class SystemLoadError extends Error {
  public code: number;
  constructor(code: number, message: string) {
    super(message);
    this.code = code;
    this.name = 'SystemLoadError';
  }
}

/**
 * 系统负载服务类
 * 封装OpenHarmony系统负载API，提供统一的调用接口
 * 支持获取当前系统负载级别、注册/注销负载变化监听器
 * 
 * @remarks
 * 该类为静态工具类，不需要实例化
 * 所有方法均为静态方法，可直接通过类名调用
 * 
 * @example
 * ```typescript
 * // 获取当前系统负载
 * const level = await SystemLoadService.getLocalLevel();
 * 
 * // 注册监听器
 * SystemLoadService.onSystemLoadChange((level) => {
 *   logger.info('SystemLoadService', '系统负载变化: %{public}s', level.toString());
 * });
 * ```
 */
export class SystemLoadService {
  /** 日志标签 */
  private static readonly TAG: string = 'SystemLoadService';
  /** Trace名称 */
  private static readonly TRACE_NAME: string = 'SystemLoadService';

  /**
   * 获取当前系统负载级别
   * 异步调用系统API获取实时的系统负载状态
   * 
   * @returns Promise<systemLoad.SystemLoadLevel> 系统负载级别枚举值
   * @throws {BusinessError} 当系统API调用失败时抛出异常
   * 
   * @remarks
   * 返回值对应8个负载级别：
   * - LOW (0): 低负载
   * - NORMAL (1): 正常负载
   * - MEDIUM (2): 中等负载
   * - HIGH (3): 高负载
   * - OVERHEATED (4): 过热
   * - WARNING (5): 警告
   * - EMERGENCY (6): 紧急
   * - ESCAPE (7): 逃逸
   */
  static async getLocalLevel(): Promise<systemLoad.SystemLoadLevel> {
    // 记录方法入口日志
    logger.info(`${SystemLoadService.TAG} getLocalLevel() called`);
    // 开始性能追踪
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10001);
    try {
      // 调用系统API获取负载级别
      const level: systemLoad.SystemLoadLevel = await systemLoad.getLevel();
      // 记录获取结果
      logger.info(`${SystemLoadService.TAG} getLocalLevel() result: ${level}`);
      return level;
    } catch (error) {
      // 记录异常日志
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} getLocalLevel() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // 结束性能追踪
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10001);
    }
  }

  /**
   * 注册系统负载变化监听器
   * 当系统负载级别发生变化时，回调函数将被触发
   * 
   * @param callback - 负载变化回调函数，接收SystemLoadLevel参数
   * @throws {BusinessError} 当callback参数无效时抛出401错误
   * 
   * @remarks
   * - 同一回调函数可重复注册，但只会触发一次
   * - 回调函数在系统负载变化时异步执行
   * - 建议在页面销毁时注销监听器，避免内存泄漏
   */
  static onSystemLoadChange(callback: SystemLoadCallback): void {
    // 记录方法入口日志
    logger.info(`${SystemLoadService.TAG} onSystemLoadChange() called`);
    // 开始性能追踪
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10002);
    try {
      // 调用系统API注册监听器
      systemLoad.on('systemLoadChange', callback);
      // 记录注册成功
      logger.info(`${SystemLoadService.TAG} onSystemLoadChange() registered successfully`);
    } catch (error) {
      // 记录注册失败
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} onSystemLoadChange() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // 结束性能追踪
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10002);
    }
  }

  /**
   * 注销指定的系统负载变化监听器
   * 注销后，该回调函数将不再接收负载变化通知
   * 
   * @param callback - 需要注销的回调函数
   * @throws {BusinessError} 当callback未注册或无效时抛出401错误
   * 
   * @remarks
   * - 只能注销已注册的回调函数
   * - 注销未注册的回调会抛出401参数错误
   * - 建议成对使用onSystemLoadChange和offSystemLoadChange
   */
  static offSystemLoadChange(callback: SystemLoadCallback): void {
    // 记录方法入口日志
    logger.info(`${SystemLoadService.TAG} offSystemLoadChange() called`);
    // 开始性能追踪
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10003);
    try {
      // 调用系统API注销监听器
      systemLoad.off('systemLoadChange', callback);
      // 记录注销成功
      logger.info(`${SystemLoadService.TAG} offSystemLoadChange() unregistered successfully`);
    } catch (error) {
      // 记录注销失败
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} offSystemLoadChange() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // 结束性能追踪
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10003);
    }
  }

  /**
   * 注销所有系统负载变化监听器
   * 一次性移除所有已注册的监听器
   * 
   * @throws {BusinessError} 当没有已注册的监听器时抛出401错误
   * 
   * @remarks
   * - 该方法会移除所有通过onSystemLoadChange注册的监听器
   * - 如果没有已注册的监听器，调用会抛出401错误
   * - 适用于页面销毁时的批量清理操作
   */
  static offAllSystemLoadChange(): void {
    // 记录方法入口日志
    logger.info(`${SystemLoadService.TAG} offAllSystemLoadChange() called`);
    // 开始性能追踪
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10004);
    try {
      // 调用系统API注销所有监听器
      systemLoad.off('systemLoadChange');
      // 记录注销成功
      logger.info(`${SystemLoadService.TAG} offAllSystemLoadChange() all unregistered successfully`);
    } catch (error) {
      // 记录注销失败
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} offAllSystemLoadChange() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // 结束性能追踪
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10004);
    }
  }
}
