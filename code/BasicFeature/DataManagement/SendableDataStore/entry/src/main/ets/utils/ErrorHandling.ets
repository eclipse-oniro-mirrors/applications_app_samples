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

import { DataStoreConstants } from '../constants/DataStoreConstants';
import { Logger } from './Logger';
import { ResultText } from './ResultText';

/**
 * Error severity levels.
 */
export enum ErrorSeverity {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  CRITICAL = 'critical'
}

/**
 * Error category types.
 */
export enum ErrorCategory {
  INITIALIZATION = 'initialization',
  VALIDATION = 'validation',
  STORAGE = 'storage',
  NETWORK = 'network',
  SECURITY = 'security',
  MIGRATION = 'migration',
  SYNC = 'sync',
  INTERNAL = 'internal'
}

/**
 * Structured error entry for logging and history.
 */
export interface ErrorEntry {
  errorCode: number;
  category: ErrorCategory;
  severity: ErrorSeverity;
  message: string;
  timestamp: number;
  retryable: boolean;
}

/**
 * Retry policy configuration.
 */
export interface RetryPolicy {
  maxRetries: number;
  initialDelay: number;
  maxDelay: number;
  backoffMultiplier: number;
}

/**
 * ErrorHandling provides error classification, recovery strategies,
 * retry mechanisms, and structured error logging.
 */
export class ErrorHandling {
  private static errorHistory: ErrorEntry[] = [];
  private static maxHistorySize: number = 1000;

  static classifyError(errorCode: number): ErrorCategory {
    if (errorCode === DataStoreConstants.ERROR_NOT_INITIALIZED ||
      errorCode === DataStoreConstants.ERROR_ALREADY_INITIALIZED) {
      return ErrorCategory.INITIALIZATION;
    }
    if (errorCode === DataStoreConstants.ERROR_INVALID_KEY ||
      errorCode === DataStoreConstants.ERROR_INVALID_VALUE ||
      errorCode === DataStoreConstants.ERROR_TYPE_MISMATCH ||
      errorCode === DataStoreConstants.ERROR_SCHEMA_MISMATCH ||
      errorCode === DataStoreConstants.ERROR_INDEX_OUT_OF_BOUNDS ||
      errorCode === DataStoreConstants.ERROR_CAPACITY_EXCEEDED) {
      return ErrorCategory.VALIDATION;
    }
    if (errorCode === DataStoreConstants.ERROR_STORE_FULL ||
      errorCode === DataStoreConstants.ERROR_TABLE_NOT_FOUND ||
      errorCode === DataStoreConstants.ERROR_SQL_EXECUTION ||
      errorCode === DataStoreConstants.ERROR_TRANSACTION) {
      return ErrorCategory.STORAGE;
    }
    if (errorCode === DataStoreConstants.ERROR_NETWORK ||
      errorCode === DataStoreConstants.ERROR_DEVICE_OFFLINE) {
      return ErrorCategory.NETWORK;
    }
    if (errorCode === DataStoreConstants.ERROR_ENCRYPTION) {
      return ErrorCategory.SECURITY;
    }
    if (errorCode === DataStoreConstants.ERROR_MIGRATION) {
      return ErrorCategory.MIGRATION;
    }
    if (errorCode === DataStoreConstants.ERROR_CONFLICT) {
      return ErrorCategory.SYNC;
    }
    return ErrorCategory.INTERNAL;
  }

  static isRetryable(errorCode: number): boolean {
    if (errorCode === DataStoreConstants.ERROR_NETWORK) {
      return true;
    }
    if (errorCode === DataStoreConstants.ERROR_DEVICE_OFFLINE) {
      return true;
    }
    if (errorCode === DataStoreConstants.ERROR_STORE_FULL) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_INVALID_KEY) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_INVALID_VALUE) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_TYPE_MISMATCH) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_SCHEMA_MISMATCH) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_ENCRYPTION) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_ALREADY_INITIALIZED) {
      return false;
    }
    if (errorCode === DataStoreConstants.ERROR_NOT_INITIALIZED) {
      return true;
    }
    return false;
  }

  static getErrorSeverity(errorCode: number): ErrorSeverity {
    if (errorCode === DataStoreConstants.ERROR_NOT_INITIALIZED) {
      return ErrorSeverity.MEDIUM;
    }
    if (errorCode === DataStoreConstants.ERROR_ALREADY_INITIALIZED) {
      return ErrorSeverity.LOW;
    }
    if (errorCode === DataStoreConstants.ERROR_INVALID_KEY ||
      errorCode === DataStoreConstants.ERROR_INVALID_VALUE) {
      return ErrorSeverity.LOW;
    }
    if (errorCode === DataStoreConstants.ERROR_STORE_FULL) {
      return ErrorSeverity.HIGH;
    }
    if (errorCode === DataStoreConstants.ERROR_TABLE_NOT_FOUND) {
      return ErrorSeverity.HIGH;
    }
    if (errorCode === DataStoreConstants.ERROR_NETWORK) {
      return ErrorSeverity.MEDIUM;
    }
    if (errorCode === DataStoreConstants.ERROR_ENCRYPTION) {
      return ErrorSeverity.CRITICAL;
    }
    if (errorCode === DataStoreConstants.ERROR_MIGRATION) {
      return ErrorSeverity.CRITICAL;
    }
    if (errorCode === DataStoreConstants.ERROR_CONFLICT) {
      return ErrorSeverity.MEDIUM;
    }
    if (errorCode === DataStoreConstants.ERROR_DEVICE_OFFLINE) {
      return ErrorSeverity.HIGH;
    }
    return ErrorSeverity.MEDIUM;
  }

  static createRetryPolicy(maxRetries: number, initialDelay: number): RetryPolicy {
    const policy: RetryPolicy = {
      maxRetries: maxRetries,
      initialDelay: initialDelay,
      maxDelay: 30000,
      backoffMultiplier: 2.0
    };
    return policy;
  }

  static getDefaultRetryPolicy(): RetryPolicy {
    return ErrorHandling.createRetryPolicy(3, 1000);
  }

  static calculateRetryDelay(policy: RetryPolicy, attempt: number): number {
    if (attempt < 0) {
      return 0;
    }
    let delay: number = policy.initialDelay;
    for (let i: number = 0; i < attempt; i++) {
      delay = delay * policy.backoffMultiplier;
      if (delay > policy.maxDelay) {
        delay = policy.maxDelay;
        break;
      }
    }
    return delay;
  }

  static async executeWithRetry<T>(
    operation: () => Promise<T>,
    policy: RetryPolicy,
    onRetry: ((attempt: number, error: Error) => void) | null
  ): Promise<T> {
    let lastError: Error | null = null;
    for (let attempt: number = 0; attempt <= policy.maxRetries; attempt++) {
      try {
        const result: T = await operation();
        return result;
      } catch (error) {
        lastError = error as Error;
        ErrorHandling.logError('executeWithRetry', DataStoreConstants.ERROR_NETWORK, lastError.message);
        if (attempt < policy.maxRetries) {
          const delay: number = ErrorHandling.calculateRetryDelay(policy, attempt);
          if (onRetry !== null) {
            onRetry(attempt + 1, lastError);
          }
          await ErrorHandling.delay(delay);
        }
      }
    }
    throw lastError as Error;
  }

  static async fallback<T>(
    primary: () => Promise<T>,
    fallbackOp: () => Promise<T>
  ): Promise<T> {
    try {
      return await primary();
    } catch (e) {
      ErrorHandling.logError('fallback', DataStoreConstants.ERROR_NETWORK, (e as Error).message);
      Logger.warn(`Primary operation failed, executing fallback: ${(e as Error).message}`);
      return await fallbackOp();
    }
  }

  static logError(context: string, errorCode: number, message: string): void {
    const category: ErrorCategory = ErrorHandling.classifyError(errorCode);
    const severity: ErrorSeverity = ErrorHandling.getErrorSeverity(errorCode);
    const retryable: boolean = ErrorHandling.isRetryable(errorCode);
    const entry: ErrorEntry = {
      errorCode: errorCode,
      category: category,
      severity: severity,
      message: `[${context}] ${message}`,
      timestamp: Date.now(),
      retryable: retryable
    };
    ErrorHandling.errorHistory.push(entry);
    if (ErrorHandling.errorHistory.length > ErrorHandling.maxHistorySize) {
      ErrorHandling.errorHistory.shift();
    }
    const logMessage: string = `Error[${errorCode}] ${severity} ${category} ${retryable ? 'retryable' : 'fatal'}: ${context} - ${message}`;
    if (severity === ErrorSeverity.CRITICAL || severity === ErrorSeverity.HIGH) {
      Logger.error(logMessage);
    } else {
      Logger.info(logMessage);
    }
  }

  static logValidationError(context: string, field: string, reason: string): void {
    ErrorHandling.logError(
      context,
      DataStoreConstants.ERROR_INVALID_VALUE,
      `Validation failed for '${field}': ${reason}`
    );
  }

  static logInitializationError(context: string, reason: string): void {
    ErrorHandling.logError(
      context,
      DataStoreConstants.ERROR_NOT_INITIALIZED,
      `Initialization failed: ${reason}`
    );
  }

  static logStorageError(context: string, reason: string): void {
    ErrorHandling.logError(
      context,
      DataStoreConstants.ERROR_STORE_FULL,
      `Storage error: ${reason}`
    );
  }

  static logNetworkError(context: string, reason: string): void {
    ErrorHandling.logError(
      context,
      DataStoreConstants.ERROR_NETWORK,
      `Network error: ${reason}`
    );
  }

  static getErrorHistory(): ErrorEntry[] {
    const copy: ErrorEntry[] = [];
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      const entry: ErrorEntry = ErrorHandling.errorHistory[i];
      const newEntry: ErrorEntry = {
        errorCode: entry.errorCode,
        category: entry.category,
        severity: entry.severity,
        message: entry.message,
        timestamp: entry.timestamp,
        retryable: entry.retryable
      };
      copy.push(newEntry);
    }
    return copy;
  }

  static getErrorsByCategory(category: ErrorCategory): ErrorEntry[] {
    const result: ErrorEntry[] = [];
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      if (ErrorHandling.errorHistory[i].category === category) {
        result.push(ErrorHandling.errorHistory[i]);
      }
    }
    return result;
  }

  static getErrorsBySeverity(severity: ErrorSeverity): ErrorEntry[] {
    const result: ErrorEntry[] = [];
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      if (ErrorHandling.errorHistory[i].severity === severity) {
        result.push(ErrorHandling.errorHistory[i]);
      }
    }
    return result;
  }

  static getRetryableErrors(): ErrorEntry[] {
    const result: ErrorEntry[] = [];
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      if (ErrorHandling.errorHistory[i].retryable) {
        result.push(ErrorHandling.errorHistory[i]);
      }
    }
    return result;
  }

  static getRecentErrors(count: number): ErrorEntry[] {
    const actual: number = Math.min(count, ErrorHandling.errorHistory.length);
    const result: ErrorEntry[] = [];
    const start: number = ErrorHandling.errorHistory.length - actual;
    for (let i: number = ErrorHandling.errorHistory.length - 1; i >= start; i--) {
      result.push(ErrorHandling.errorHistory[i]);
    }
    return result;
  }

  static getErrorCount(): number {
    return ErrorHandling.errorHistory.length;
  }

  static getErrorCountByCategory(category: ErrorCategory): number {
    let count: number = 0;
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      if (ErrorHandling.errorHistory[i].category === category) {
        count++;
      }
    }
    return count;
  }

  static getErrorCountBySeverity(severity: ErrorSeverity): number {
    let count: number = 0;
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      if (ErrorHandling.errorHistory[i].severity === severity) {
        count++;
      }
    }
    return count;
  }

  static clearHistory(): void {
    ErrorHandling.errorHistory = [];
  }

  static getLastError(): ErrorEntry | null {
    if (ErrorHandling.errorHistory.length === 0) {
      return null;
    }
    return ErrorHandling.errorHistory[ErrorHandling.errorHistory.length - 1];
  }

  static formatError(entry: ErrorEntry): string {
    return ResultText.ofArgs($r('app.string.result_error_format'),
      [entry.errorCode, String(entry.severity), String(entry.category),
        entry.retryable ? 'retryable' : 'fatal', new Date(entry.timestamp).toISOString(), entry.message],
      `Error[${entry.errorCode}] ${entry.severity} ${entry.category} ` +
        `${entry.retryable ? 'retryable' : 'fatal'} at ${new Date(entry.timestamp).toISOString()}: ${entry.message}`);
  }

  static formatAllErrors(): string {
    let result: string = '';
    for (let i: number = 0; i < ErrorHandling.errorHistory.length; i++) {
      result += ErrorHandling.formatError(ErrorHandling.errorHistory[i]);
      if (i < ErrorHandling.errorHistory.length - 1) {
        result += '\n';
      }
    }
    return result;
  }

  private static delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, ms);
    });
  }
}
