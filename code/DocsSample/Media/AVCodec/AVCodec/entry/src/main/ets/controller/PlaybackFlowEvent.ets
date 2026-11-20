/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export type PlaybackFlowNotice = 'transcoding' | 'no_source' | 'open' | 'empty' | 'busy' |
  'close_unconfirmed' | 'invalid' | 'recovering' | 'recovered' | 'resumed';
export type PlaybackFlowSignal = 'started' | 'finished' | 'stopping' | 'stop_rejected' | 'failure' |
  'recovery_pending' | 'recovery_failed' | 'recovery_succeeded' | 'queue_changed' | 'start_failed';
export type PlaybackFlowEventType = PlaybackFlowSignal | 'preparing' | 'launching' | 'notice';

export class PlaybackFlowEvent {
  private eventType: PlaybackFlowEventType;

  protected constructor(type: PlaybackFlowEventType) { this.eventType = type; }

  get type(): PlaybackFlowEventType { return this.eventType; }

  static signal(type: PlaybackFlowSignal): PlaybackFlowEvent { return new PlaybackFlowEvent(type); }
}

export class PlaybackPreparingEvent extends PlaybackFlowEvent {
  public readonly path: string;
  public readonly recovering: boolean;

  constructor(path: string, recovering: boolean) {
    super('preparing');
    this.path = path;
    this.recovering = recovering;
  }
}

export class PlaybackLaunchingEvent extends PlaybackFlowEvent {
  public readonly recovering: boolean;

  constructor(recovering: boolean) {
    super('launching');
    this.recovering = recovering;
  }
}

export class PlaybackNoticeEvent extends PlaybackFlowEvent {
  public readonly notice: PlaybackFlowNotice;

  constructor(notice: PlaybackFlowNotice) {
    super('notice');
    this.notice = notice;
  }
}
