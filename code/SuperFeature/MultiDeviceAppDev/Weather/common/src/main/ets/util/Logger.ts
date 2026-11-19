/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

export class Logger {
  static PREFIX: string = '[Sample_Weather]'
  static DOMAIN: number = 0xFF00
  /** 双占位符格式串，作为对外契约保留，供既有调用方与用例断言引用 */
  static FORMAT: string = '%{public}s, %{public}s'
  /** 单占位符格式串，承载按调用顺序拼接后的日志正文 */
  static SINGLE_FORMAT: string = '%{public}s'

  static debug(...args: Object[]): void {
    hilog.debug(Logger.DOMAIN, Logger.PREFIX, Logger.SINGLE_FORMAT, Logger.join(args))
  }

  static info(...args: Object[]): void {
    hilog.info(Logger.DOMAIN, Logger.PREFIX, Logger.SINGLE_FORMAT, Logger.join(args))
  }

  static warn(...args: Object[]): void {
    hilog.warn(Logger.DOMAIN, Logger.PREFIX, Logger.SINGLE_FORMAT, Logger.join(args))
  }

  static error(...args: Object[]): void {
    hilog.error(Logger.DOMAIN, Logger.PREFIX, Logger.SINGLE_FORMAT, Logger.join(args))
  }

  // 把可变参数按顺序拼成单条正文，保证格式串占位符数量与实参数量始终一致
  private static join(args: Object[]): string {
    const parts: string[] = []
    for (let i = 0; i < args.length; i++) {
      parts.push(String(args[i]))
    }
    return parts.join(', ')
  }
}
