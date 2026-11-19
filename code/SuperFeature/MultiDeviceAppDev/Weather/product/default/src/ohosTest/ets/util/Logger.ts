/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit'

const DOMAIN: number = 0xF811
/** 单占位符格式串，承载按调用顺序拼接后的日志正文，占位符与实参数量严格一对一 */
const SINGLE_FORMAT: string = '%{public}s'

class Logger {
  private domain: number
  private prefix: string

  constructor(prefix: string) {
    this.prefix = prefix
    this.domain = DOMAIN
  }

  debug(...args: string[]): void {
    hilog.debug(this.domain, this.prefix, SINGLE_FORMAT, Logger.join(args))
  }

  info(...args: string[]): void {
    hilog.info(this.domain, this.prefix, SINGLE_FORMAT, Logger.join(args))
  }

  warn(...args: string[]): void {
    hilog.warn(this.domain, this.prefix, SINGLE_FORMAT, Logger.join(args))
  }

  error(...args: string[]): void {
    hilog.error(this.domain, this.prefix, SINGLE_FORMAT, Logger.join(args))
  }

  private static join(args: string[]): string {
    const parts: string[] = []
    for (let i = 0; i < args.length; i++) {
      parts.push(String(args[i]))
    }
    return parts.join(', ')
  }
}

export const logger = new Logger('Sample_Weather_Test')