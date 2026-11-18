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

import { process, util } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import { logInfo } from './Logger';

interface LaunchEvidence {
  id: string;
  source: string;
  hyperSnapConfirmed: boolean;
  startedUptimeMs: number;
}

interface LaunchPhaseRow {
  event: string;
  id: string;
  pid: number;
  phase: string;
  source: string;
  hyperSnapConfirmed: boolean;
  wallTimeMs: number;
  elapsedFromObservedCallbackMs: number;
  scope: string;
}

let current: LaunchEvidence | undefined = undefined;

/** Only the real AbilityStage callback may set hyperSnapConfirmed. */
export function beginLaunchEvidence(source: string): void {
  current = {
    id: util.generateRandomUUID(),
    source: source,
    hyperSnapConfirmed: source === 'AbilityStage.onLaunchFromHyperSnap',
    startedUptimeMs: systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false)
  };
  logLaunchPhase(source);
}

export function logLaunchPhase(phase: string): void {
  if (current === undefined) {
    beginLaunchEvidence('unobserved-stage');
  }
  const evidence = current;
  if (evidence === undefined) {
    return;
  }
  const row: LaunchPhaseRow = {
    event: 'launch',
    id: evidence.id,
    pid: process.pid,
    phase: phase,
    source: evidence.source,
    hyperSnapConfirmed: evidence.hyperSnapConfirmed,
    wallTimeMs: Date.now(),
    elapsedFromObservedCallbackMs:
      systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - evidence.startedUptimeMs,
    scope: 'AbilityStage callback to phase; not tap-to-first-frame'
  };
  logInfo(JSON.stringify(row));
}
