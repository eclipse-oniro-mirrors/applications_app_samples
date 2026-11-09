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
 * Single log entry rendered by the shared log panel.
 */
export class LogEntry {
  // Monotonic id used as the list key.
  id: number;
  // Record time formatted as hh:mm:ss.
  time: string;
  // Demo tag that identifies the source section.
  tag: string;
  // Human-readable detail text.
  text: string;
  // Log level, one of info, warn or error.
  level: string;

  /**
   * Build one immutable log entry.
   * @param id monotonic id used as the list key.
   * @param time record time formatted as hh:mm:ss.
   * @param tag demo tag of the source section.
   * @param text human-readable detail text.
   * @param level log level of the entry.
   */
  constructor(id: number, time: string, tag: string, text: string, level: string) {
    this.id = id;
    this.time = time;
    this.tag = tag;
    this.text = text;
    this.level = level;
  }
}

/**
 * Pad a number smaller than ten with a leading zero.
 * @param value number to format.
 * @returns the two-character decimal text of the value.
 */
function padTwo(value: number): string {
  // Prepend the zero only for the values below ten.
  return value < 10 ? '0' + value.toString() : value.toString();
}

/**
 * Build the current wall-clock time formatted as hh:mm:ss.
 * @returns the formatted time text.
 */
export function nowTimeText(): string {
  // Read the current local time.
  const date: Date = new Date();
  // Join the padded hour, minute and second parts.
  return padTwo(date.getHours()) + ':' + padTwo(date.getMinutes()) + ':' + padTwo(date.getSeconds());
}

/**
 * Prepend one entry to the log list and trim it to the limit.
 * @param list current log list, newest first.
 * @param entry new entry to prepend.
 * @param limit maximum number of entries kept.
 * @returns the next list with the entry at the head.
 */
export function appendLog(list: LogEntry[], entry: LogEntry, limit: number): LogEntry[] {
  // Start the next list with the new entry at the head.
  const next: LogEntry[] = [entry];
  // Keep at most limit-1 old entries to stay within the limit.
  const keep: number = list.length < limit ? list.length : limit - 1;
  for (let index = 0; index < keep; index++) {
    next.push(list[index]);
  }
  return next;
}
