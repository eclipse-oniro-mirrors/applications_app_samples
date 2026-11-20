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
 * Callback invoked when the system load level changes.
 * @param level - System load level enum value.
 */
type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

class SystemLoadError extends Error {
  public code: number;
  constructor(code: number, message: string) {
    super(message);
    this.code = code;
    this.name = 'SystemLoadError';
  }
}

/**
 * Provides static wrappers for the OpenHarmony system load APIs.
 * Supports querying the current level and registering or unregistering listeners.
 *
 * @remarks
 * This class does not need to be instantiated. All methods can be called directly on the class.
 *
 * @example
 * ```typescript
 * // Get the current system load level.
 * const level = await SystemLoadService.getLocalLevel();
 *
 * // Register a listener.
 * SystemLoadService.onSystemLoadChange((level) => {
 *   logger.info(`System load changed: ${level}`);
 * });
 * ```
 */
export class SystemLoadService {
  /** Log tag. */
  private static readonly TAG: string = 'SystemLoadService';
  /** Trace name. */
  private static readonly TRACE_NAME: string = 'SystemLoadService';

  /**
   * Gets the current system load level asynchronously.
   *
   * @returns Promise<systemLoad.SystemLoadLevel> The current system load level.
   * @throws {BusinessError} Throws the original error when the SDK API call fails.
   *
   * @remarks
   * The return value corresponds to one of eight load levels:
   * - LOW (0): Low load
   * - NORMAL (1): Normal load
   * - MEDIUM (2): Medium load
   * - HIGH (3): High load
   * - OVERHEATED (4): Overheated
   * - WARNING (5): Warning
   * - EMERGENCY (6): Emergency
   * - ESCAPE (7): Escape
   */
  static async getLocalLevel(): Promise<systemLoad.SystemLoadLevel> {
    // Log method entry.
    logger.info(`${SystemLoadService.TAG} getLocalLevel() called`);
    // Start performance tracing.
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10001);
    try {
      // Query the system load level.
      const level: systemLoad.SystemLoadLevel = await systemLoad.getLevel();
      // Log the query result.
      logger.info(`${SystemLoadService.TAG} getLocalLevel() result: ${level}`);
      return level;
    } catch (error) {
      // Log the query failure and preserve the original SDK error.
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} getLocalLevel() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // Finish performance tracing.
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10001);
    }
  }

  /**
   * Registers a listener that is invoked when the system load level changes.
   *
   * @param callback - Callback that receives the updated SystemLoadLevel.
   * @throws {BusinessError} Throws the original SDK error, including error 401 for an invalid callback.
   *
   * @remarks
   * - Registering the same callback repeatedly is idempotent.
   * - The callback is invoked asynchronously when the system load changes.
   * - Unregister listeners when the page is destroyed to avoid memory leaks.
   */
  static onSystemLoadChange(callback: SystemLoadCallback): void {
    // Log method entry.
    logger.info(`${SystemLoadService.TAG} onSystemLoadChange() called`);
    // Start performance tracing.
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10002);
    try {
      // Register the listener with the system API.
      systemLoad.on('systemLoadChange', callback);
      // Log successful registration.
      logger.info(`${SystemLoadService.TAG} onSystemLoadChange() registered successfully`);
    } catch (error) {
      // Log the registration failure and preserve the original SDK error.
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} onSystemLoadChange() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // Finish performance tracing.
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10002);
    }
  }

  /**
   * Unregisters a specific system load listener so it no longer receives change notifications.
   *
   * @param callback - Callback to unregister.
   * @throws {BusinessError} Throws the original SDK error, including error 401 for an invalid or unregistered callback.
   *
   * @remarks
   * - Only a registered callback can be unregistered.
   * - Unregistering an unregistered callback throws error 401.
   * - Pair onSystemLoadChange with offSystemLoadChange during listener cleanup.
   */
  static offSystemLoadChange(callback: SystemLoadCallback): void {
    // Log method entry.
    logger.info(`${SystemLoadService.TAG} offSystemLoadChange() called`);
    // Start performance tracing.
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10003);
    try {
      // Unregister the listener with the system API.
      systemLoad.off('systemLoadChange', callback);
      // Log successful unregistration.
      logger.info(`${SystemLoadService.TAG} offSystemLoadChange() unregistered successfully`);
    } catch (error) {
      // Log the unregistration failure and preserve the original SDK error.
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} offSystemLoadChange() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // Finish performance tracing.
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10003);
    }
  }

  /**
   * Unregisters all system load listeners in one operation.
   *
   * @throws {BusinessError} Throws the original SDK error, including error 401 when no listeners are registered.
   *
   * @remarks
   * - Removes all listeners registered through onSystemLoadChange.
   * - Throws error 401 if no listeners are registered.
   * - Suitable for batch cleanup when a page is destroyed.
   */
  static offAllSystemLoadChange(): void {
    // Log method entry.
    logger.info(`${SystemLoadService.TAG} offAllSystemLoadChange() called`);
    // Start performance tracing.
    hiTraceMeter.startTrace(SystemLoadService.TRACE_NAME, 10004);
    try {
      // Unregister all listeners with the system API.
      systemLoad.off('systemLoadChange');
      // Log successful unregistration.
      logger.info(`${SystemLoadService.TAG} offAllSystemLoadChange() all unregistered successfully`);
    } catch (error) {
      // Log the unregistration failure and preserve the original SDK error.
      const err = error as BusinessError;
      logger.error(`${SystemLoadService.TAG} offAllSystemLoadChange() failed: code=${err.code}, message=${err.message}`);
      throw new SystemLoadError(err.code, err.message);
    } finally {
      // Finish performance tracing.
      hiTraceMeter.finishTrace(SystemLoadService.TRACE_NAME, 10004);
    }
  }
}
