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
 * 扫描会话事件记录器。按时间顺序保存回调事件文本，
 * 超过容量上限时丢弃最旧事件，供状态回放与日志摘要使用。
 */
export class ScanSessionRecorder {
  private static readonly CAPACITY: number = 100;

  private events: string[] = [];

  /**
   * 追加事件，返回追加后的数量；超出容量时丢弃最旧事件。
   */
  append(event: string): number {
    this.events.push(event);
    if (this.events.length > ScanSessionRecorder.CAPACITY) {
      this.events.splice(0, this.events.length - ScanSessionRecorder.CAPACITY);
    }
    return this.events.length;
  }

  count(): number {
    return this.events.length;
  }

  first(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[0];
  }

  last(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1];
  }

  clear(): void {
    this.events = [];
  }

  contains(event: string): boolean {
    return this.events.indexOf(event) >= 0;
  }

  /**
   * 聚合摘要串：数量 + 首尾事件，供快照断言使用。
   */
  summary(): string {
    return `count=${this.events.length} first=${this.first()} last=${this.last()}`;
  }

  /**
   * 返回事件副本，调用方修改副本不影响记录器。
   */
  toArray(): string[] {
    return this.events.slice(0);
  }

  /**
   * 用事件数组构造记录器，便于按数据表直接喂序列。
   */
  static make(events: string[]): ScanSessionRecorder {
    const recorder: ScanSessionRecorder = new ScanSessionRecorder();
    for (let index = 0; index < events.length; index++) {
      recorder.append(events[index]);
    }
    return recorder;
  }

  /**
   * 生成 count 个 `${prefix}${index}` 占位事件，用于容量边界用例。
   */
  static fill(count: number, prefix: string): string[] {
    const events: string[] = [];
    for (let index = 0; index < count; index++) {
      events.push(`${prefix}${index}`);
    }
    return events;
  }
}
