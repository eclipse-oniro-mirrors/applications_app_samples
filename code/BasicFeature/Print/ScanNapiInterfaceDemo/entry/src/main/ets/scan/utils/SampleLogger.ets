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

/**
 * 统一日志出口：固定 DOMAIN 0xF811 与带 Sample 前缀的 TAG。
 */
export class SampleLogger {
  static readonly DOMAIN: number = 0xF811;
  static readonly TAG: string = '[Sample_ScanNapiInterfaceDemo]';
  static readonly EMPTY_MESSAGE: string = 'empty message';

  /**
   * 空消息替换为占位文案，避免日志里出现无内容的行。
   */
  static normalize(message: string): string {
    return message.length === 0 ? SampleLogger.EMPTY_MESSAGE : message;
  }

  static getDomain(): number {
    return SampleLogger.DOMAIN;
  }

  static getTag(): string {
    return SampleLogger.TAG;
  }

  static info(message: string): void {
    hilog.info(SampleLogger.DOMAIN, SampleLogger.TAG, '%{public}s', SampleLogger.normalize(message));
  }

  static warn(message: string): void {
    hilog.warn(SampleLogger.DOMAIN, SampleLogger.TAG, '%{public}s', SampleLogger.normalize(message));
  }

  static error(message: string): void {
    hilog.error(SampleLogger.DOMAIN, SampleLogger.TAG, '%{public}s', SampleLogger.normalize(message));
  }

  static debug(message: string): void {
    hilog.debug(SampleLogger.DOMAIN, SampleLogger.TAG, '%{public}s', SampleLogger.normalize(message));
  }
}
