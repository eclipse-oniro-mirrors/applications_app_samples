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

export interface CallFailure {
  code: number;
  message: string;
}

export interface CallStateInfo {
  state: number;
  number: string;
}

export type CallCompletion = (error?: CallFailure) => void;
export type CallStateListener = (state: CallStateInfo) => void;

export interface CallService {
  hasVoiceCapability(): boolean;
  makeCall(phoneNumber: string, callback: CallCompletion): void;
  subscribe(listener: CallStateListener): void;
  unsubscribe(listener: CallStateListener): void;
}

export interface CallLogger {
  success(): void;
  failure(operation: string, error: CallFailure): void;
  stateChanged(info: CallStateInfo): void;
}

export class CallController {
  private service: CallService;
  private logger: CallLogger;
  private listener: CallStateListener | undefined = undefined;
  private generation: number = 0;

  constructor(service: CallService, logger: CallLogger) {
    this.service = service;
    this.logger = logger;
  }

  start(phoneNumber: string = '13xxxx'): void {
    const generation = this.generation;
    try {
      if (!this.service.hasVoiceCapability()) {
        return;
      }
      this.service.makeCall(phoneNumber, (error?: CallFailure): void => {
        if (generation !== this.generation) {
          return;
        }
        if (error) {
          this.logger.failure('makeCall', error);
        } else {
          this.logger.success();
        }
      });
      if (this.listener !== undefined) {
        return;
      }
      const listener: CallStateListener = (info: CallStateInfo): void => {
        if (generation === this.generation && this.listener === listener) {
          this.logger.stateChanged(info);
        }
      };
      this.listener = listener;
      try {
        this.service.subscribe(listener);
      } catch (error) {
        this.listener = undefined;
        this.logger.failure('subscribe', error as CallFailure);
      }
    } catch (error) {
      this.logger.failure('start', error as CallFailure);
    }
  }

  dispose(): void {
    this.generation++;
    const listener = this.listener;
    if (listener === undefined) {
      return;
    }
    try {
      this.service.unsubscribe(listener);
      this.listener = undefined;
    } catch (error) {
      this.logger.failure('unsubscribe', error as CallFailure);
    }
  }
}
