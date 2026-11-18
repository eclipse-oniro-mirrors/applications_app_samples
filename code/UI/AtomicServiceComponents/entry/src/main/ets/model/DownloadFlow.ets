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
 
export enum DownloadState {
  IDLE = 0,
  PICKING = 1,
  SUCCESS = 2,
  FALLBACK = 3,
  FAILED = 4
}

export enum DownloadTarget {
  PICKER = 'picker',
  SANDBOX = 'sandbox'
}

export function supportsDocumentPicker(deviceType: string): boolean {
  return deviceType === 'phone' || deviceType === 'tablet' || deviceType === '2in1';
}

export function resolveDownloadTarget(deviceType: string): DownloadTarget {
  return supportsDocumentPicker(deviceType) ? DownloadTarget.PICKER : DownloadTarget.SANDBOX;
}

export function beginAttempt(previousToken: number): number {
  return previousToken + 1;
}

export function isStaleAttempt(token: number, activeToken: number): boolean {
  return token !== activeToken;
}

export function shouldFallbackOnTimeout(settled: boolean, token: number, activeToken: number): boolean {
  return !settled && token === activeToken;
}

export function nextDownloadState(current: DownloadState, success: boolean): DownloadState {
  return success ? DownloadState.SUCCESS : DownloadState.FALLBACK;
}

export function downloadStateName(state: DownloadState): Resource {
  switch (state) {
    case DownloadState.PICKING:
      return $r('app.string.download_state_picking');
    case DownloadState.SUCCESS:
      return $r('app.string.download_state_success');
    case DownloadState.FALLBACK:
      return $r('app.string.download_state_fallback');
    case DownloadState.FAILED:
      return $r('app.string.download_state_failed');
    default:
      return $r('app.string.download_state_idle');
  }
}
