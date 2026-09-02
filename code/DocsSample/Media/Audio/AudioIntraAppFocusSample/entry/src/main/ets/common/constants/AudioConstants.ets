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
export enum InterruptMode {
  SHARE_MODE = 0,
  INDEPENDENT_MODE = 1,
}

export enum StreamUsageType {
  MUSIC = 0,
  MOVIE = 1,
  GAME = 2,
  AUDIOBOOK = 3,
  NAVIGATION = 4,
}

export enum InterruptHintType {
  INTERRUPT_HINT_NONE = 0,
  INTERRUPT_HINT_RESUME = 1,
  INTERRUPT_HINT_PAUSE = 2,
  INTERRUPT_HINT_STOP = 3,
  INTERRUPT_HINT_DUCK = 4,
  INTERRUPT_HINT_UNDUCK = 5,
}

export enum InterruptForceType {
  INTERRUPT_FORCE = 0,
  INTERRUPT_SHARE = 1,
}

export enum AudioStreamState {
  PREPARED = 0,
  RUNNING = 1,
  PAUSED = 2,
  STOPPED = 3,
  RELEASED = 4,
}

export class ScenarioItem {
  public id: string = '';
  public name: string = '';
  public desc: string = '';
  public page: string = '';
}

export const SCENARIO_LIST: ScenarioItem[] = [
  { id: 'musicVsMusic', name: '音乐与音乐', desc: 'MUSIC vs MUSIC', page: 'pages/MusicVsMusicPage' },
  { id: 'musicVsVideo', name: '音乐与视频', desc: 'MUSIC vs MOVIE', page: 'pages/MusicVsVideoPage' },
  { id: 'musicVsGame', name: '音乐与游戏', desc: 'MUSIC vs GAME', page: 'pages/MusicVsGamePage' },
];
