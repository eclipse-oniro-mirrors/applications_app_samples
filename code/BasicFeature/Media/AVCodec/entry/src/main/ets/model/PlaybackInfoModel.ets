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

const MICROSECONDS_PER_SECOND: number = 1000000;
const SECONDS_PER_MINUTE: number = 60;

export function formatPlaybackInfo(stateValue: number, speed: number, durationUs: number,
  positionUs: number, hasVideo: boolean, hasAudio: boolean, isSmartFluencyAvailable: boolean): string {
  const stateNames: string[] = ['IDLE', 'INITIALIZING', 'READY', 'PLAYING', 'STOPPING'];
  const state = stateValue >= 0 && stateValue < stateNames.length ? stateNames[stateValue] : 'UNKNOWN';
  const track = hasVideo && hasAudio ? 'A+V' : hasVideo ? 'V' : hasAudio ? 'A' : '-';
  const smartFluency = isSmartFluencyAvailable ? '  SF' : '';
  return state + '  X' + speed.toFixed(1) + '  ' + formatMediaTime(positionUs) + ' / ' +
    formatMediaTime(durationUs) + '  ' + track + smartFluency;
}

export function formatMediaTime(timeUs: number): string {
  const totalSeconds = Math.max(0, Math.floor(timeUs / MICROSECONDS_PER_SECOND));
  const minutes = Math.floor(totalSeconds / SECONDS_PER_MINUTE);
  const seconds = totalSeconds % SECONDS_PER_MINUTE;
  return padTime(minutes) + ':' + padTime(seconds);
}

function padTime(value: number): string {
  return value < 10 ? '0' + value : value.toString();
}
