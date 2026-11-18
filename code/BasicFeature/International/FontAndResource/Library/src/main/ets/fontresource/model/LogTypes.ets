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

// One UI log entry displayed inside the on-screen log panel.
export class LogEntry {
  // The monotonically increasing sequence number used as the list key.
  public id: number;
  // The "HH:mm:ss" wall clock text captured when the entry was created.
  public time: string;
  // The module tag such as "Install" or "Convert" that produced the entry.
  public tag: string;
  // The log message body.
  public text: string;
  // The level bucket ("info", "warn" or "error") used for coloring.
  public level: string;

  // Builds one on-screen log entry.
  constructor(id: number, time: string, tag: string, text: string, level: string) {
    // Store the sequence number.
    this.id = id;
    // Store the formatted time text.
    this.time = time;
    // Store the module tag.
    this.tag = tag;
    // Store the message body.
    this.text = text;
    // Store the level bucket.
    this.level = level;
  }
}

// Pads a single-digit number with one leading zero.
function padTwo(value: number): string {
  // Prefix small values with one leading zero.
  return value < 10 ? `0${value}` : value.toString();
}

// Returns the current wall clock formatted as "HH:mm:ss".
export function nowTimeText(): string {
  // Read the current instant once so every field comes from the same clock reading.
  const date: Date = new Date();
  // Compose the time text from zero-padded hour, minute and second fields.
  return `${padTwo(date.getHours())}:${padTwo(date.getMinutes())}:${padTwo(date.getSeconds())}`;
}

// Prepends a new entry to the list while keeping at most "limit" entries.
export function appendLog(list: LogEntry[], entry: LogEntry, limit: number): LogEntry[] {
  // Start the next list with the freshest entry on top.
  const next: LogEntry[] = [];
  // Insert the new entry first.
  next.push(entry);
  // Decide how many existing entries still fit under the limit.
  const keep: number = list.length < limit ? list.length : limit - 1;
  // Copy the surviving older entries after the new one.
  for (let index = 0; index < keep; index++) {
    // Append one retained entry.
    next.push(list[index]);
  }
  // Return the trimmed list for state assignment.
  return next;
}
