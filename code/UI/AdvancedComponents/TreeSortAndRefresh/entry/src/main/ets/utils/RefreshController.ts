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
import { TreeSortConstants } from './Constants';
import { TreeSortUtils } from './TreeSortUtils';

export type RefreshUpdate = (count: number, loading: boolean) => void;

/** Provides Refresh Session helpers for the sample. */
export class RefreshSession {
  private refreshCount: number = 0;
  private loading: boolean = false;

  count(): number {
    return this.refreshCount;
  }

  isLoading(): boolean {
    return this.loading;
  }

  begin(): boolean {
    if (this.loading) {
      return false;
    }
    this.loading = true;
    return true;
  }

  complete(): number {
    if (this.loading) {
      this.loading = false;
      this.refreshCount++;
    }
    return this.refreshCount;
  }

  stop(): number {
    this.loading = false;
    return this.refreshCount;
  }

  reset(): void {
    this.loading = false;
    this.refreshCount = 0;
  }
}

/** Provides Refresh Controller helpers for the sample. */
export class RefreshController {
  private session: RefreshSession = new RefreshSession();
  private timer: number = -1;
  private onUpdate: RefreshUpdate;

  constructor(onUpdate: RefreshUpdate) {
    this.onUpdate = onUpdate;
  }

  start(): boolean {
    if (this.timer !== -1 || !this.session.begin()) {
      Logger.event('RefreshController', 'startIgnored', 'already loading');
      return false;
    }
    this.onUpdate(this.session.count(), this.session.isLoading());
    Logger.event('RefreshController', 'start');
    this.timer = setTimeout(() => {
      const count = this.session.complete();
      this.onUpdate(count, this.session.isLoading());
      this.timer = -1;
      Logger.event('RefreshController', 'completed', TreeSortUtils.refreshStatus(count, false));
    }, TreeSortConstants.REFRESH_DELAY);
    return true;
  }

  stop(): void {
    this.clearTimer();
    const count = this.session.stop();
    this.onUpdate(count, this.session.isLoading());
    Logger.event('RefreshController', 'stop', TreeSortUtils.refreshStatus(count, false));
  }

  dispose(): void {
    this.clearTimer();
    this.session.stop();
    Logger.event('RefreshController', 'dispose');
  }

  private clearTimer(): void {
    if (this.timer !== -1) {
      clearTimeout(this.timer);
      this.timer = -1;
    }
  }
}
