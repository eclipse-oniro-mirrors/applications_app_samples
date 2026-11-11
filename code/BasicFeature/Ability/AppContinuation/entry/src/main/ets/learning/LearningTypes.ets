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

import { localize } from '../common/LocaleStrings';
/** Shared value objects for the API learning UI and its Ability-scoped controller. */
import { SceneState, emptyScene } from './scene/SceneModel';
export interface EnvironmentItem {
  key: string;
  label: string;
  value: string;
  status: string;
  detail: string;
}

export interface DiagnosticEvent {
  seq: number;
  time: string;
  operationId: string;
  phase: string;
  level: string;
  message: string;
}

export interface OperationRecord {
  id: string;
  operation: string;
  purpose: string;
  title: string;
  result: string;
  stage: string;
  level: string;
  startedAt: string;
  endedAt: string;
  durationMillis: number;
  errorCode: string;
  rawMessage: string;
  rawResultState: string;
  resultInfo: string;
  facts: string[];
  explanation: string[];
  limits: string[];
  nextSteps: string[];
  environment: EnvironmentItem[];
  events: DiagnosticEvent[];
}

export interface LearningSnapshot {
  launchReason: string;
  launchReasonCode: number;
  listenerState: string;
  sessionState: string;
  sessionActive: boolean;
  quickStartRequired: boolean;
  quickResult: string;
  dataState: string;
  windowState: string;
  committed: boolean;
  sessionRecordId: string;
  canRegister: boolean;
  canUnregister: boolean;
  canEdit: boolean;
  canStop: boolean;
  text: string;
  selectionStart: number;
  selectionEnd: number;
  documentId: string;
  revision: number;
  conflictPending: boolean;
  conflictAccepted: boolean;
  conflictKind: string;
  conflictSummary: string;
  scene: SceneState;
  businessPositionState: string;
  positionRequest: number;
  targetPage: string;
  savedTextStatus: string;
  restoredSummary: string;
  latestRecord: OperationRecord | undefined;
  records: OperationRecord[];
  events: DiagnosticEvent[];
  environment: EnvironmentItem[];
  environmentCheckedAt: string;
  nativeOffNote: string;
  notice: string;
}

export type LearningListener = (snapshot: LearningSnapshot) => void;

export function offContractNote(): string { return localize('ac_types_off_contract'); }
export const TEXT_PAYLOAD_KEY: string = 'com.example.appcontinuation.learning.text.v1';
export const MAX_TEXT_LENGTH: number = 4096;

export function emptyLearningSnapshot(): LearningSnapshot {
  return {
    launchReason: localize('ac_types_launch_wait'),
    launchReasonCode: -1,
    listenerState: localize('ac_types_listener_none'),
    sessionState: localize('ac_types_session_none'),
    sessionActive: false,
    quickStartRequired: false,
    quickResult: localize('ac_types_quick_unneeded'),
    dataState: localize('ac_types_data_pending'),
    windowState: localize('ac_types_window_pending'),
    committed: false,
    sessionRecordId: '',
    canRegister: false,
    canUnregister: false,
    canEdit: false,
    canStop: false,
    text: '',
    selectionStart: 0,
    selectionEnd: 0,
    documentId: '',
    revision: 0,
    conflictPending: false,
    conflictAccepted: false,
    conflictKind: '',
    conflictSummary: '',
    scene: emptyScene(),
    businessPositionState: localize('ac_types_position_pending'),
    positionRequest: 0,
    targetPage: 'pages/ProcessPage',
    savedTextStatus: localize('ac_types_save_none'),
    restoredSummary: '',
    latestRecord: undefined,
    records: [],
    events: [],
    environment: [],
    environmentCheckedAt: localize('ac_types_environment_none'),
    nativeOffNote: offContractNote(),
    notice: localize('ac_types_runtime_wait')
  };
}
