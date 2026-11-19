/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file casesfeature/calendarswitch/src/main/ets/customcalendar/utils/Logger.ets
 * 文件职责：Logger 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Logger。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

/**
 * 日志打印类
 */
class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s, %{public}s';

  /** 构造 Logger 实例。 */
  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = 0xFF00;
    this.format.toUpperCase();
  }

  /**
   * debug：执行 debug 相关逻辑。
   */
  debug(...args: string[]) {
    hilog.debug(this.domain, this.prefix, this.format, args);
  }

  /**
   * info：执行 info 相关逻辑。
   */
  info(...args: string[]) {
    hilog.info(this.domain, this.prefix, this.format, args);
  }

  /**
   * warn：执行 warn 相关逻辑。
   */
  warn(...args: string[]) {
    hilog.warn(this.domain, this.prefix, this.format, args);
  }

  /**
   * error：执行 error 相关逻辑。
   */
  error(...args: string[]) {
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}

export let logger = new Logger('[CalendarView]')