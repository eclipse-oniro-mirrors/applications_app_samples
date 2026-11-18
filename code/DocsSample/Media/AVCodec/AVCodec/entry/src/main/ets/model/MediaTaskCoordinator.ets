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

export type MediaTaskKind = 'playback' | 'recording' | 'transcode' | 'cleanup';
export type MediaTaskPhase = 'idle' | 'preparing' | 'running' | 'cancelling';

export interface MediaTaskLease {
  id: string;
  kind: MediaTaskKind;
  startedAt: number;
}

// ArkTS-thread ownership only. Native completion, not a cancel request, releases the lease.
export class MediaTaskCoordinator {
  private static sequence: number = 0;
  private static active: MediaTaskLease | undefined = undefined;
  private static phase: MediaTaskPhase = 'idle';

  static acquire(kind: MediaTaskKind): MediaTaskLease | undefined {
    if (MediaTaskCoordinator.active !== undefined) { return undefined; }
    const lease: MediaTaskLease = { id: kind + '_' + Date.now() + '_' + (++MediaTaskCoordinator.sequence),
      kind: kind, startedAt: Date.now() };
    MediaTaskCoordinator.active = lease;
    MediaTaskCoordinator.phase = 'preparing';
    return lease;
  }

  static owns(lease: MediaTaskLease): boolean { return MediaTaskCoordinator.active?.id === lease.id; }

  static running(lease: MediaTaskLease): void {
    if (MediaTaskCoordinator.owns(lease) && MediaTaskCoordinator.phase === 'preparing') {
      MediaTaskCoordinator.phase = 'running';
    }
  }

  static cancelling(lease: MediaTaskLease): void {
    if (MediaTaskCoordinator.owns(lease)) { MediaTaskCoordinator.phase = 'cancelling'; }
  }

  static release(lease: MediaTaskLease): void {
    if (!MediaTaskCoordinator.owns(lease)) { return; }
    MediaTaskCoordinator.active = undefined;
    MediaTaskCoordinator.phase = 'idle';
  }

  static current(): MediaTaskLease | undefined { return MediaTaskCoordinator.active; }
  static currentPhase(): MediaTaskPhase { return MediaTaskCoordinator.phase; }
  static busy(): boolean { return MediaTaskCoordinator.active !== undefined; }
}
