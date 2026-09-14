/*
 * Copyright (c) 2026-2026 Huawei Device Co., Ltd.
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

const DOMAIN: number = 0x0000;

/**
 * LoggerModel 日志工具类
 * 封装hilog接口，提供统一的日志输出格式，便于测试用例中记录日志信息
 */
class LoggerModel {
  private prefix: string;
  private format: string = '%{public}s, %{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
  }

  debug(...args: string[]): void {
    hilog.debug(DOMAIN, this.prefix, this.format, args);
  }

  info(...args: string[]): void {
    hilog.info(DOMAIN, this.prefix, this.format, args);
  }

  warn(...args: string[]): void {
    hilog.warn(DOMAIN, this.prefix, this.format, args);
  }

  error(...args: string[]): void {
    hilog.error(DOMAIN, this.prefix, this.format, args);
  }
}

export let Logger = new LoggerModel('[Sample_BackgroundLoader]');
