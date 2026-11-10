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

import { Logger } from './Logger';

/**
 * Timer entry for tracking operation durations.
 */
export interface TimerEntry {
  label: string;
  startTime: number;
  endTime: number;
  duration: number;
  isRunning: boolean;
}

/**
 * Memory snapshot entry.
 */
export interface MemorySnapshot {
  label: string;
  timestamp: number;
  usedMemory: number;
  totalMemory: number;
}

/**
 * Operation statistics entry.
 */
export interface OperationStats {
  name: string;
  totalCount: number;
  successCount: number;
  failureCount: number;
  totalDuration: number;
  minDuration: number;
  maxDuration: number;
  lastDuration: number;
}

/**
 * PerformanceMonitor provides timing, memory monitoring, and operation statistics
 * for performance analysis of data store operations.
 */
export class PerformanceMonitor {
  private static timers: Map<string, TimerEntry> = new Map();
  private static memorySnapshots: MemorySnapshot[] = [];
  private static operationStats: Map<string, OperationStats> = new Map();
  private static maxMemorySnapshots = 100;
  private static maxTimers = 500;

  static startTimer(label: string): void {
    if (PerformanceMonitor.timers.size > PerformanceMonitor.maxTimers) {
      PerformanceMonitor.timers.clear();
    }
    const entry: TimerEntry = {
      label: label,
      startTime: Date.now(),
      endTime: 0,
      duration: 0,
      isRunning: true
    };
    PerformanceMonitor.timers.set(label, entry);
  }

  static stopTimer(label: string): number {
    const entry = PerformanceMonitor.timers.get(label);
    if (entry === undefined) {
      Logger.warn(`Timer '${label}' not found`);
      return 0;
    }
    if (!entry.isRunning) {
      Logger.warn(`Timer '${label}' is not running`);
      return entry.duration;
    }
    entry.endTime = Date.now();
    entry.duration = entry.endTime - entry.startTime;
    entry.isRunning = false;
    PerformanceMonitor.recordOperation(label, entry.duration, true);
    return entry.duration;
  }

  static getElapsed(label: string): number {
    const entry = PerformanceMonitor.timers.get(label);
    if (entry === undefined) {
      return 0;
    }
    if (entry.isRunning) {
      return Date.now() - entry.startTime;
    }
    return entry.duration;
  }

  static isTimerRunning(label: string): boolean {
    const entry = PerformanceMonitor.timers.get(label);
    if (entry === undefined) {
      return false;
    }
    return entry.isRunning;
  }

  static removeTimer(label: string): void {
    PerformanceMonitor.timers.delete(label);
  }

  static clearAllTimers(): void {
    PerformanceMonitor.timers.clear();
  }

  static getActiveTimerCount(): number {
    let count = 0;
    PerformanceMonitor.timers.forEach((entry: TimerEntry, key: string) => {
      if (entry.isRunning) {
        count++;
      }
    });
    return count;
  }

  static getTotalTimerCount(): number {
    return PerformanceMonitor.timers.size;
  }

  static recordMemorySnapshot(label: string): MemorySnapshot {
    const snapshot: MemorySnapshot = {
      label: label,
      timestamp: Date.now(),
      usedMemory: 0,
      totalMemory: 0
    };
    try {
      snapshot.usedMemory = 0;
      snapshot.totalMemory = 0;
    } catch (e) {
      Logger.warn(`Failed to get memory usage: ${(e as Error).message}`);
    }
    PerformanceMonitor.memorySnapshots.push(snapshot);
    if (PerformanceMonitor.memorySnapshots.length > PerformanceMonitor.maxMemorySnapshots) {
      PerformanceMonitor.memorySnapshots.shift();
    }
    return snapshot;
  }

  static getMemoryUsage(): MemorySnapshot {
    const snapshot: MemorySnapshot = {
      label: 'current',
      timestamp: Date.now(),
      usedMemory: 0,
      totalMemory: 0
    };
    try {
      snapshot.usedMemory = 0;
      snapshot.totalMemory = 0;
    } catch (e) {
      Logger.warn(`Failed to get current memory usage: ${(e as Error).message}`);
    }
    return snapshot;
  }

  static getMemorySnapshots(): MemorySnapshot[] {
    const result: MemorySnapshot[] = [];
    for (let i = 0; i < PerformanceMonitor.memorySnapshots.length; i++) {
      const snap = PerformanceMonitor.memorySnapshots[i];
      const copy: MemorySnapshot = {
        label: snap.label,
        timestamp: snap.timestamp,
        usedMemory: snap.usedMemory,
        totalMemory: snap.totalMemory
      };
      result.push(copy);
    }
    return result;
  }

  static getMemoryDelta(): number {
    if (PerformanceMonitor.memorySnapshots.length < 2) {
      return 0;
    }
    const last = PerformanceMonitor.memorySnapshots[PerformanceMonitor.memorySnapshots.length - 1];
    const first = PerformanceMonitor.memorySnapshots[0];
    return last.usedMemory - first.usedMemory;
  }

  static clearMemorySnapshots(): void {
    PerformanceMonitor.memorySnapshots = [];
  }

  static recordOperation(name: string, duration: number, success: boolean): void {
    let stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      stats = {
        name: name,
        totalCount: 0,
        successCount: 0,
        failureCount: 0,
        totalDuration: 0,
        minDuration: Number.MAX_VALUE,
        maxDuration: 0,
        lastDuration: 0
      };
      PerformanceMonitor.operationStats.set(name, stats);
    }
    stats.totalCount++;
    if (success) {
      stats.successCount++;
    } else {
      stats.failureCount++;
    }
    stats.totalDuration += duration;
    if (duration < stats.minDuration) {
      stats.minDuration = duration;
    }
    if (duration > stats.maxDuration) {
      stats.maxDuration = duration;
    }
    stats.lastDuration = duration;
  }

  static getAverageTime(name: string): number {
    const stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      return 0;
    }
    if (stats.totalCount === 0) {
      return 0;
    }
    return stats.totalDuration / stats.totalCount;
  }

  static getMinTime(name: string): number {
    const stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      return 0;
    }
    if (stats.minDuration === Number.MAX_VALUE) {
      return 0;
    }
    return stats.minDuration;
  }

  static getMaxTime(name: string): number {
    const stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      return 0;
    }
    return stats.maxDuration;
  }

  static getLastTime(name: string): number {
    const stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      return 0;
    }
    return stats.lastDuration;
  }

  static getOperationCount(): number {
    return PerformanceMonitor.operationStats.size;
  }

  static getOperationStats(name: string): OperationStats | undefined {
    return PerformanceMonitor.operationStats.get(name);
  }

  static getAllOperationNames(): string[] {
    const names: string[] = [];
    PerformanceMonitor.operationStats.forEach((_stats: OperationStats, key: string) => {
      names.push(key);
    });
    return names;
  }

  static getTotalOperationCount(): number {
    let total = 0;
    PerformanceMonitor.operationStats.forEach((stats: OperationStats, key: string) => {
      total += stats.totalCount;
    });
    return total;
  }

  static getSuccessRate(name: string): number {
    const stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      return 0;
    }
    if (stats.totalCount === 0) {
      return 0;
    }
    return stats.successCount / stats.totalCount;
  }

  static getFailureRate(name: string): number {
    return 1.0 - PerformanceMonitor.getSuccessRate(name);
  }

  static clearOperationStats(): void {
    PerformanceMonitor.operationStats.clear();
  }

  static clearOperationStatsByName(name: string): void {
    PerformanceMonitor.operationStats.delete(name);
  }

  static formatStats(name: string): string {
    const stats = PerformanceMonitor.operationStats.get(name);
    if (stats === undefined) {
      return `No stats for operation '${name}'`;
    }
    const avg = PerformanceMonitor.getAverageTime(name);
    const successRate = PerformanceMonitor.getSuccessRate(name);
    return `Operation: ${name}\n` +
      `  Total: ${stats.totalCount}, Success: ${stats.successCount}, Failure: ${stats.failureCount}\n` +
      `  Avg: ${avg.toFixed(2)}ms, Min: ${PerformanceMonitor.getMinTime(name)}ms, ` +
      `Max: ${PerformanceMonitor.getMaxTime(name)}ms, Last: ${stats.lastDuration}ms\n` +
      `  Success Rate: ${(successRate * 100).toFixed(1)}%`;
  }

  static formatAllStats(): string {
    let result = '';
    const names = PerformanceMonitor.getAllOperationNames();
    for (let i = 0; i < names.length; i++) {
      result += PerformanceMonitor.formatStats(names[i]);
      if (i < names.length - 1) {
        result += '\n---\n';
      }
    }
    return result;
  }

  static reset(): void {
    PerformanceMonitor.clearAllTimers();
    PerformanceMonitor.clearMemorySnapshots();
    PerformanceMonitor.clearOperationStats();
  }

  static getSummary(): string {
    return `PerformanceMonitor Summary:\n` +
      `  Timers: ${PerformanceMonitor.getTotalTimerCount()} total, ` +
      `${PerformanceMonitor.getActiveTimerCount()} active\n` +
      `  Memory Snapshots: ${PerformanceMonitor.memorySnapshots.length}\n` +
      `  Operations: ${PerformanceMonitor.getOperationCount()} types, ` +
      `${PerformanceMonitor.getTotalOperationCount()} total`;
  }
}
