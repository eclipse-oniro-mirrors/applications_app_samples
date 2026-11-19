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

import { CommonEventConstants, EventSource } from '../util/Constants';

/**
 * Record of a common event received by the home page.
 */
export interface EventRecord {
  sequence: number;
  data: string;
  sourceCode: number;
  sourceName: string;
  receivedTime: string;
}

/**
 * Source of the current time, replaced by tests to get stable timestamps.
 */
export interface ClockProvider {
  now(): number;
}

class SystemClock implements ClockProvider {
  now(): number {
    return Date.now();
  }
}

const SYSTEM_CLOCK: ClockProvider = new SystemClock();

/**
 * Result of a checked insertion.
 */
export interface AddResult {
  accepted: boolean;
  reason: string;
  record: EventRecord | null;
}

/**
 * Keeps the events received by the home page in arrival order.
 */
export class EventRecordManager {
  private records: EventRecord[] = [];
  private capacity: number;
  private sequence: number = 0;
  private clock: ClockProvider;

  /**
   * @param capacity Maximum number of records kept in memory.
   * @param clock Time source, the system clock by default.
   */
  constructor(capacity: number = CommonEventConstants.MAX_RECORD_COUNT, clock: ClockProvider = SYSTEM_CLOCK) {
    this.capacity = capacity > 0 ? capacity : CommonEventConstants.MAX_RECORD_COUNT;
    this.clock = clock;
  }

  /**
   * Adds a record and removes the oldest one when the capacity is exceeded.
   *
   * @param data Event data carried by the received event.
   * @param sourceCode Code field carried by the received event.
   * @param timestamp Receive time, now by default.
   * @returns The record that has been added.
   */
  add(data: string, sourceCode: number, timestamp?: number): EventRecord {
    let receiveTime: number = timestamp === undefined ? this.clock.now() : timestamp;
    return this.append(data, sourceCode, receiveTime);
  }

  /**
   * Adds a record only when the payload and the source code are valid.
   *
   * @param data Event data carried by the received event.
   * @param sourceCode Code field carried by the received event.
   * @param timestamp Receive time, now by default.
   * @returns Whether the record was accepted together with the reason.
   */
  tryAdd(data: string, sourceCode: number, timestamp?: number): AddResult {
    let dataReason: string = EventRecordManager.validateData(data);
    if (dataReason.length > 0) {
      return { accepted: false, reason: dataReason, record: null };
    }
    let codeReason: string = EventRecordManager.validateSourceCode(sourceCode);
    if (codeReason.length > 0) {
      return { accepted: false, reason: codeReason, record: null };
    }
    let receiveTime: number = timestamp === undefined ? this.clock.now() : timestamp;
    return { accepted: true, reason: '', record: this.append(data, sourceCode, receiveTime) };
  }

  /**
   * @param data Event data to check.
   * @returns An empty string when the data can be recorded.
   */
  static validateData(data: string): string {
    if (data.length === 0) {
      return 'The event data must not be empty.';
    }
    if (data.length > CommonEventConstants.MAX_EVENT_DATA_LENGTH) {
      return 'The event data must not exceed 64 KB.';
    }
    return '';
  }

  /**
   * @param sourceCode Code field to check.
   * @returns An empty string when the code is an integer.
   */
  static validateSourceCode(sourceCode: number): string {
    if (!Number.isFinite(sourceCode) || Math.floor(sourceCode) !== sourceCode) {
      return 'The source code must be an integer.';
    }
    return '';
  }

  private append(data: string, sourceCode: number, timestamp: number): EventRecord {
    this.sequence += 1;
    let record: EventRecord = {
      sequence: this.sequence,
      data: data,
      sourceCode: sourceCode,
      sourceName: EventSource.resolveName(sourceCode),
      receivedTime: EventRecordManager.formatTime(timestamp)
    };
    this.records.push(record);
    if (this.records.length > this.capacity) {
      this.records.shift();
    }
    return record;
  }

  /**
   * Removes every record and restarts the sequence.
   */
  clear(): void {
    this.records = [];
    this.sequence = 0;
  }

  /**
   * Replaces the kept records with the given ones, keeping at most the capacity newest
   * entries and continuing the sequence from the last restored record.
   *
   * @param records Records to keep, in arrival order.
   */
  restore(records: EventRecord[]): void {
    let copy: EventRecord[] = records.slice();
    if (copy.length > this.capacity) {
      copy = copy.slice(copy.length - this.capacity);
    }
    this.records = copy;
    this.sequence = copy.length === 0 ? 0 : copy[copy.length - 1].sequence;
  }

  /**
   * @returns A copy of the records so that the caller can replace its own state.
   */
  getRecords(): EventRecord[] {
    return this.records.slice();
  }

  /**
   * @returns Number of records kept in memory.
   */
  getCount(): number {
    return this.records.length;
  }

  /**
   * @returns The latest record, or null when nothing has been received.
   */
  getLastRecord(): EventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  /**
   * Formats a timestamp as HH:mm:ss.
   *
   * @param timestamp Milliseconds since the Unix epoch.
   * @returns Zero padded local time.
   */
  static formatTime(timestamp: number): string {
    let date: Date = new Date(timestamp);
    let hours: string = EventRecordManager.pad(date.getHours());
    let minutes: string = EventRecordManager.pad(date.getMinutes());
    let seconds: string = EventRecordManager.pad(date.getSeconds());
    return `${hours}:${minutes}:${seconds}`;
  }

  private static pad(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }
}
