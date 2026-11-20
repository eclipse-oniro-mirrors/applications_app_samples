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
import { ProgressConstants } from './Constants';
import { ProgressUtils } from './ProgressUtils';

export type DownloadUpdate = (progress: number, completed: boolean) => void;

/** Provides Download Session helpers for the sample. */
export class DownloadSession {
  private current: number = 0;
  private running: boolean = false;
  private completed: boolean = false;

  value(): number {
    return this.current;
  }

  isRunning(): boolean {
    return this.running;
  }

  isCompleted(): boolean {
    return this.completed;
  }

  begin(): void {
    this.current = 0;
    this.running = true;
    this.completed = false;
  }

  advance(): number {
    if (!this.running) {
      return this.current;
    }
    this.current = ProgressUtils.step(this.current, ProgressConstants.DOWNLOAD_STEP);
    if (this.current >= ProgressConstants.MAX) {
      this.current = ProgressConstants.MAX;
      this.running = false;
      this.completed = true;
    }
    return this.current;
  }

  reset(): void {
    this.current = 0;
    this.running = false;
    this.completed = false;
  }
}

/** Provides Download Controller helpers for the sample. */
export class DownloadController {
  private session: DownloadSession = new DownloadSession();
  private timer: number = -1;
  private onUpdate: DownloadUpdate;

  constructor(onUpdate: DownloadUpdate) {
    this.onUpdate = onUpdate;
  }

  isRunning(): boolean {
    return this.timer !== -1;
  }

  start(): boolean {
    if (this.timer !== -1) {
      Logger.event('DownloadController', 'startIgnored', 'already running');
      return false;
    }
    this.session.begin();
    this.onUpdate(0, false);
    Logger.event('DownloadController', 'start');
    this.timer = setInterval(() => {
      const progress = this.session.advance();
      const completed = this.session.isCompleted();
      this.onUpdate(progress, completed);
      Logger.event('DownloadController', completed ? 'completed' : 'tick', `${progress}`);
      if (completed) {
        this.stopTimer();
      }
    }, ProgressConstants.DOWNLOAD_INTERVAL);
    return true;
  }

  reset(): void {
    this.stopTimer();
    this.session.reset();
    this.onUpdate(0, false);
    Logger.event('DownloadController', 'reset');
  }

  stop(): void {
    const running = this.timer !== -1;
    this.stopTimer();
    if (running) {
      Logger.event('DownloadController', 'stop', `${this.session.value()}`);
    }
  }

  private stopTimer(): void {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }
}
