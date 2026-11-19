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

const DOMAIN: number = 0xF811;
const PREFIX: string = '[Sample_CustomCommonEventRely]';
const FORMAT: string = '%{public}s';

/**
 * Destination of the log records, replaced by tests to inspect the output.
 */
export interface LogSink {
  write(level: string, message: string): void;
}

/**
 * Wraps the hilog APIs used by the sample so that every log shares one domain and tag.
 */
class Logger {
  private sink: LogSink | null = null;

  /**
   * @param sink Destination that replaces hilog, null restores the hilog output.
   */
  setSink(sink: LogSink | null): void {
    this.sink = sink;
  }

  debug(...args: string[]): void {
    this.emit('DEBUG', args, (message: string) => hilog.debug(DOMAIN, PREFIX, FORMAT, message));
  }

  info(...args: string[]): void {
    this.emit('INFO', args, (message: string) => hilog.info(DOMAIN, PREFIX, FORMAT, message));
  }

  warn(...args: string[]): void {
    this.emit('WARN', args, (message: string) => hilog.warn(DOMAIN, PREFIX, FORMAT, message));
  }

  error(...args: string[]): void {
    this.emit('ERROR', args, (message: string) => hilog.error(DOMAIN, PREFIX, FORMAT, message));
  }

  private emit(level: string, args: string[], writer: (message: string) => void): void {
    let message: string = args.join(', ');
    if (this.sink !== null) {
      this.sink.write(level, message);
      return;
    }
    writer(message);
  }

  enter(page: string): void {
    this.info(`[${page}] enter`);
  }

  leave(page: string): void {
    this.info(`[${page}] leave`);
  }

  show(page: string): void {
    this.info(`[${page}] onPageShow`);
  }

  hide(page: string): void {
    this.info(`[${page}] onPageHide`);
  }

  event(page: string, eventName: string, detail: string = ''): void {
    this.info(`[${page}] ${eventName}${detail.length > 0 ? ', ' + detail : ''}`);
  }
}

export default new Logger();
