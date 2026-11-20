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

import Logger from '../util/Logger';
import { TitleBarUtils } from './TitleBarUtils';

/** Provides Title Bar Actions helpers for the sample. */
export class TitleBarActions {
  private page: string;
  private saveCount: number = 0;
  private cancelCount: number = 0;
  private menuCount: number = 0;

  constructor(page: string) {
    this.page = page;
  }

  save(): string {
    this.saveCount++;
    return this.record('save', this.saveCount);
  }

  cancel(): string {
    this.cancelCount++;
    return this.record('cancel', this.cancelCount);
  }

  menu(): string {
    this.menuCount++;
    return this.record('menu', this.menuCount);
  }

  reset(): string {
    this.saveCount = 0;
    this.cancelCount = 0;
    this.menuCount = 0;
    Logger.event(this.page, 'reset');
    return this.summary();
  }

  summary(): string {
    return `save=${this.saveCount}, cancel=${this.cancelCount}, menu=${this.menuCount}`;
  }

  private record(action: string, count: number): string {
    Logger.event(this.page, action, TitleBarUtils.formatAction(action, count));
    return this.summary();
  }
}
