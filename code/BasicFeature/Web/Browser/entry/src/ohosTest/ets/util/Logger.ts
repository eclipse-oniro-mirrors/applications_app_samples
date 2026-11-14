/*
 * Copyright (c) 2023-2026 Sample Device Co., Ltd.
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

import hilog from '@ohos.hilog';

/**
 * Thin hilog facade used by the smoke suites.
 *
 * The generated suites log through test/Shared/TestLogger, this class stays as
 * a compatible entry point for older tests that log with `Logger.info(tag, x)`.
 * stdout printing is forbidden by the project rules, therefore everything funnels
 * into hilog with the domain of the browser sample.
 */
class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = 0xF811;
  }

  private compose(tag: string, args: string[]): string {
    if (args.length === 0) {
      return tag;
    }
    return `[${tag}] ${args.join(' ')}`;
  }

  debug(tag: string, ...args: string[]): void {
    hilog.debug(this.domain, this.prefix, this.format, this.compose(tag, args));
  }

  info(tag: string, ...args: string[]): void {
    hilog.info(this.domain, this.prefix, this.format, this.compose(tag, args));
  }

  warn(tag: string, ...args: string[]): void {
    hilog.warn(this.domain, this.prefix, this.format, this.compose(tag, args));
  }

  error(tag: string, ...args: string[]): void {
    hilog.error(this.domain, this.prefix, this.format, this.compose(tag, args));
  }

  /** Logs an exception together with the stage that produced it. */
  exception(tag: string, stage: string, error: Error | string): void {
    const detail: string = typeof error === 'string' ? error : `${error.name}: ${error.message}`;
    this.error(tag, `${stage} threw ${detail}`);
  }

  /** Returns the domain currently used by this logger. */
  getDomain(): number {
    return this.domain;
  }

  /** Returns the tag prefix currently used by this logger. */
  getPrefix(): string {
    return this.prefix;
  }
}

export { Logger };
export default new Logger('[Sample_Brower]');
