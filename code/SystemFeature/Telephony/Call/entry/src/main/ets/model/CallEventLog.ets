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
 * @file entry/src/main/ets/model/CallEventLog.ets
 * 文件职责：通话事件的有序记录与格式化输出。
 * 主要声明：CallEvent、CallEventLog。
 */

/**
 * CallEvent：单条通话事件。
 */
export interface CallEvent {
  seq: number;
  type: string;
  detail: string;
}

/**
 * CallEventLog：顺序追加事件并提供统计与文本导出。
 */
export class CallEventLog {
  private events: CallEvent[] = [];
  private nextSeq: number = 1;

  /**
   * append：追加事件。
   * @param type 事件类型，如 DIALLING、ACTIVE。
   * @param detail 事件细节。
   * @returns 事件序号。
   */
  append(type: string, detail: string): number {
    const seq: number = this.nextSeq;
    this.events.push({ seq: seq, type: type, detail: detail });
    this.nextSeq = seq + 1;
    return seq;
  }

  /**
   * size：返回事件条数。
   * @returns 条数。
   */
  size(): number {
    return this.events.length;
  }

  /**
   * countOf：统计指定类型的事件数。
   * @param type 事件类型。
   * @returns 条数。
   */
  countOf(type: string): number {
    let count: number = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].type === type) {
        count++;
      }
    }
    return count;
  }

  /**
   * lines：导出 #seq type detail 形式的文本行。
   * @returns 文本行数组。
   */
  lines(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.events.length; index++) {
      const event: CallEvent = this.events[index];
      result.push('#' + event.seq + ' ' + event.type + ' ' + event.detail);
    }
    return result;
  }

  /**
   * firstLine：返回首行文本。
   * @returns 首行，空日志返回空串。
   */
  firstLine(): string {
    return this.events.length === 0 ? '' : this.lines()[0];
  }

  /**
   * lastLine：返回末行文本。
   * @returns 末行，空日志返回空串。
   */
  lastLine(): string {
    const lines: string[] = this.lines();
    return lines.length === 0 ? '' : lines[lines.length - 1];
  }

  /**
   * types：返回出现过的类型列表。
   * @returns 类型数组，保持首次出现顺序。
   */
  types(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.events.length; index++) {
      if (result.indexOf(this.events[index].type) < 0) {
        result.push(this.events[index].type);
      }
    }
    return result;
  }

  /**
   * clear：清空日志并重置序号。
   */
  clear(): void {
    this.events = [];
    this.nextSeq = 1;
  }
}
