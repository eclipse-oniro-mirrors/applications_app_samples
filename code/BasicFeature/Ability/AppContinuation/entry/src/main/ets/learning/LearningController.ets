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
import {
  CommitPlan, decodePayload, hasPayload, MAX_REVISION, readContinuation,
  SceneLearningStoreAdapter, selectionBoundary, TextPayload, validUnicode
} from './LearningPayload';
/** 独立、Ability-scoped 的单文本接续学习运行时。 */
import { AbilityConstant, common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { LearningDependencies, LearningStore, platformLearningDependencies } from './LearningPorts';
import {
  DiagnosticEvent, emptyLearningSnapshot, EnvironmentItem, LearningListener, LearningSnapshot,
  MAX_TEXT_LENGTH, OperationRecord, TEXT_PAYLOAD_KEY
} from './LearningTypes';
import {
  ContinueClient, ContinueObservation, redactPlatformText, safeErrorCode, safeErrorMessage
} from './ContinueClient';
import { decodeScene, emptyScene, encodeScene, SCENE_PAYLOAD_KEY, SceneDocument } from './scene/SceneModel';
import { PreferencesSceneStore, SceneSnapshot, SceneWorkbench } from './scene/SceneWorkbench';
import {
  SceneBackupCode, SceneBackupExport, SceneBackupPreview, SceneBackupRestoreResult
} from './scene/SceneWorkspaceBackupModel';
import { SceneBackupClipboard, SceneBackupCopyCode, SceneBackupCopyResult } from './scene/SceneBackupClipboard';

const STORE_KEY: string = 'single_text_document';
const PHASE_LIMIT_MS: number = 15000;
const PROBE_LIMIT_MS: number = 15000;
const MAX_RECORDS: number = 40;
const MAX_EVENTS: number = 120;
const MAX_RECORD_EVENTS: number = 24;

export class LearningController {
  private readonly dependencies: LearningDependencies;
  private readonly client: ContinueClient;
  private readonly value: LearningSnapshot = emptyLearningSnapshot();
  private readonly listeners: Set<LearningListener> = new Set<LearningListener>();
  private readonly started: Map<string, number> = new Map<string, number>();
  private readonly completedTags: string[] = [];
  private store: LearningStore | undefined = undefined;
  private durableDocument: string | undefined = undefined;
  private storageUncertain: boolean = false;
  private disposed: boolean = false;
  private serial: number = 0;
  private eventSerial: number = 0;
  private sessionGeneration: number = 0;
  private session: RestoreSession | undefined = undefined;
  private sessionTimer: number = -1;
  private probeTimer: number = -1;
  private probeRecordId: string = '';
  private listenerOwner: string = '';
  private offRecordId: string = '';
  private permissionRecordId: string = '';
  private terminalAwaitingData: boolean = false;
  private documentId: string = '';
  private localRevision: number = 0;
  private documentSerial: number = 0;
  private conflictCandidate: TextPayload | undefined = undefined;
  private conflictAccepted: boolean = false;
  private dirty: boolean = false;
  public readonly sceneWorkbench: SceneWorkbench;
  private activeBusiness: string = 'text';
  private positionSerial: number = 0;
  private readonly backupClipboard: SceneBackupClipboard;

  constructor(context: common.UIAbilityContext | undefined, dependencies?: LearningDependencies,
    backupClipboard?: SceneBackupClipboard, sceneStoreOverride?: SceneStorePort) {
    this.backupClipboard = backupClipboard === undefined ? new SceneBackupClipboard() : backupClipboard;
    this.dependencies = dependencies === undefined ? platformLearningDependencies(context) : dependencies;
    this.client = new ContinueClient(this.dependencies.native, this.dependencies.clock);
    this.value.canEdit = true;
    this.value.notice = '';
    this.openStore();
    let sceneStore: SceneStorePort = sceneStoreOverride === undefined ?
      new SceneLearningStoreAdapter(this.store) : sceneStoreOverride;
    if (sceneStoreOverride === undefined && dependencies === undefined && context !== undefined) {
      try {
        sceneStore = new PreferencesSceneStore(context);
      } catch (error) {
        // Fail closed rather than redirecting scene writes into the legacy text Preferences.
        sceneStore = new SceneLearningStoreAdapter(undefined);
      }
    }
    this.sceneWorkbench = new SceneWorkbench(sceneStore);
    this.refreshFlags();
  }

  private nowText(): string {
    return new Date(this.dependencies.clock.now()).toISOString();
  }

  snapshot(): LearningSnapshot {
    // 快照使用 JSON 值；深拷贝正文、记录、events、environment 和数组。
    return JSON.parse(JSON.stringify(this.value)) as LearningSnapshot;
  }

  subscribe(listener: LearningListener): () => void {
    if (this.disposed) {
      return (): void => {};
    }
    this.listeners.add(listener);
    try {
      listener(this.snapshot());
    } catch (error) {
      // 首轮通知与后续 publish 使用相同隔离，保证调用方取得退订函数。
    }
    return (): void => {
      this.listeners.delete(listener);
    };
  }

  private publish(): void {
    this.refreshFlags();
    if (this.disposed) {
      return;
    }
    this.listeners.forEach((listener: LearningListener): void => {
      try {
        listener(this.snapshot());
      } catch (error) {
        // 隔离页面订阅者异常，继续 SDK 回调和恢复事务。
      }
    });
  }

  private refreshFlags(): void {
    const slot = this.client.state();
    const active: boolean = this.session !== undefined && this.session.active;
    this.value.sessionActive = active;
    this.value.canRegister = !this.disposed && !active && !slot.listening && !slot.offPending;
    this.value.canUnregister = !this.disposed && !active && slot.nativeDirty && !slot.offPending;
    this.value.canEdit = !this.disposed && !active;
    this.value.canStop = !this.disposed && (active || this.probeRecordId.length > 0);
    if (slot.offPending) {
      this.value.listenerState = localize('ac_learningcontroller_010');
    } else if (slot.listening) {
      this.value.listenerState = localize('ac_learningcontroller_011');
    } else if (slot.offObservationExpired) {
      this.value.listenerState = localize('ac_learningcontroller_012');
    } else if (slot.nativeDirty) {
      this.value.listenerState = localize('ac_learningcontroller_013');
    } else {
      this.value.listenerState = localize('ac_types_listener_none');
    }
    if (this.value.records.length > 0) {
      this.value.latestRecord = this.value.records[0];
    } else {
      this.value.latestRecord = undefined;
    }
  }

  private startRecord(operation: string, title: string, purpose: string): OperationRecord {
    const timestamp: number = this.dependencies.clock.now();
    const id: string = `op-${timestamp}-${++this.serial}`;
    const record: OperationRecord = {
      id: id,
      operation: operation,
      purpose: purpose,
      title: title,
      result: localize('ac_calldetailpage_012'),
      stage: localize('ac_learningcontroller_016'),
      level: 'INFO',
      startedAt: this.nowText(),
      endedAt: '',
      durationMillis: 0,
      errorCode: '',
      rawMessage: '',
      rawResultState: '',
      resultInfo: '',
      facts: [],
      explanation: [],
      limits: [],
      nextSteps: [],
      environment: copyEnvironment(this.value.environment),
      events: []
    };
    this.started.set(id, timestamp);
    this.value.records.unshift(record);
    this.trimRecords();
    this.event(record, localize('ac_learningcontroller_016'), 'INFO', title);
    return record;
  }

  private trimRecords(): void {
    while (this.value.records.length > MAX_RECORDS) {
      let removed: boolean = false;
      for (let i: number = this.value.records.length - 1; i >= 0; i--) {
        if (this.value.records[i].endedAt.length > 0) {
          this.started.delete(this.value.records[i].id);
          this.value.records.splice(i, 1);
          removed = true;
          break;
        }
      }
      if (!removed) {
        break;
      }
    }
  }

  private findRecord(id: string): OperationRecord | undefined {
    for (let i: number = 0; i < this.value.records.length; i++) {
      if (this.value.records[i].id === id) {
        return this.value.records[i];
      }
    }
    return undefined;
  }

  private event(record: OperationRecord, phase: string, level: string, message: string): void {
    const event: DiagnosticEvent = {
      seq: ++this.eventSerial,
      time: this.nowText(),
      operationId: record.id,
      phase: phase,
      level: level,
      message: message
    };
    record.stage = phase;
    record.events.push(event);
    if (record.events.length > MAX_RECORD_EVENTS) {
      record.events.shift();
    }
    this.value.events.push(event);
    if (this.value.events.length > MAX_EVENTS) {
      this.value.events.shift();
    }
  }

  private callEvent(record: OperationRecord, phase: string, level: string, message: string): void {
    const terminalStage: string = record.stage;
    const terminal: boolean = record.endedAt.length > 0;
    this.event(record, phase, level, message);
    if (terminal) {
      record.stage = terminalStage;
    }
  }

  private readableMessage(message: string): string {
    if (this.activeBusiness !== 'text' || (this.session !== undefined && this.session.candidate !== undefined &&
      this.session.candidate.scene !== undefined)) { return message.length === 0 ? '' : localize('ac_learningcontroller_018'); }
    let safe: string = message;
    const texts: string[] = [this.value.text];
    if (this.session !== undefined && this.session.candidate !== undefined) {
      texts.push(this.session.candidate.text);
    }
    texts.forEach((text: string): void => {
      if (text.length > 0) {
        safe = safe.split(text).join(localize('ac_learningcontroller_019'));
        text.split('\n').forEach((line: string): void => {
          if (line.length >= 4) {
            safe = safe.split(line).join(localize('ac_learningcontroller_020'));
          }
        });
      }
    });
    return redactPlatformText(safe);
  }

  private describeError(record: OperationRecord): void {
    if (record.errorCode === '16300501') {
      record.explanation.push(localize('ac_learningcontroller_021'));
    } else if (record.errorCode.length > 0) {
      record.explanation.push(localize('ac_learningcontroller_022', [record.errorCode]));
    }
    record.limits.push(localize('ac_learningcontroller_023'));
    record.nextSteps.push(localize('ac_learningcontroller_024'));
  }

  private finish(record: OperationRecord, result: string, level: string, stage: string): void {
    record.result = result;
    record.level = level;
    record.endedAt = this.nowText();
    const began = this.started.get(record.id);
    record.durationMillis = began === undefined ? 0 : Math.max(0, this.dependencies.clock.now() - began);
    this.event(record, stage, level, result);
    this.trimRecords();
  }

  record(id: string): OperationRecord | undefined {
    const found = this.findRecord(id);
    return found === undefined ? undefined : copyRecord(found);
  }

  diagnosticSummary(id?: string): string {
    const record = id === undefined ? this.value.latestRecord : this.findRecord(id);
    if (record === undefined) {
      return localize('ac_learningcontroller_025');
    }
    const lines: string[] = [
      localize('ac_learningcontroller_026'), localize('ac_learningcontroller_027', [record.operation, record.title]),
      localize('ac_learningcontroller_028', [record.result]), localize('ac_learningcontroller_029', [record.stage, record.level]),
      localize('ac_learningcontroller_030', [record.startedAt, record.endedAt.length > 0 ? record.endedAt : localize('ac_learningcontroller_031')]),
      localize('ac_learningcontroller_032', [record.durationMillis]), localize('ac_learningcontroller_033', [record.errorCode.length > 0 ? record.errorCode : localize('ac_learningcontroller_034')]),
      localize('ac_learningcontroller_035', [record.rawResultState.length > 0 ? record.rawResultState : localize('ac_learningcontroller_036')]),
      localize('ac_learningcontroller_037', [record.facts.join('；')]), localize('ac_learningcontroller_038', [record.explanation.join('；')]),
      localize('ac_learningcontroller_039', [record.limits.join('；')]), localize('ac_learningcontroller_040', [record.nextSteps.join('；')]),
      localize('ac_learningcontroller_041')
    ];
    record.events.forEach((event: DiagnosticEvent): void => {
      lines.push(`${event.time} [${event.level}] ${event.phase}`);
    });
    lines.push(localize('ac_learningcontroller_042'));
    return lines.join('\n');
  }

  checkEnvironment(): void {
    if (this.disposed) {
      return;
    }
    const record = this.startRecord('ENVIRONMENT', localize('ac_learningcontroller_043'), localize('ac_learningcontroller_044'));
    const items: EnvironmentItem[] = [];
    try {
      const publicInfo = this.dependencies.environment.readPublic();
      const api: EnvironmentItem = {
        key: 'api',
        label: localize('ac_learningcontroller_045'),
        value: `${publicInfo.apiVersion}`,
        status: localize('ac_learningcontroller_046'),
        detail: localize('ac_learningcontroller_047')
      };
      const type: EnvironmentItem = {
        key: 'type',
        label: localize('ac_learningcontroller_048'),
        value: publicInfo.deviceType,
        status: localize('ac_learningcontroller_046'),
        detail: localize('ac_learningcontroller_050')
      };
      const os: EnvironmentItem = {
        key: 'os',
        label: localize('ac_learningcontroller_051'),
        value: publicInfo.osFullName,
        status: localize('ac_learningcontroller_046'),
        detail: localize('ac_learningcontroller_053')
      };
      items.push(api, type, os);
    } catch (error) {
      const unavailable: EnvironmentItem = {
        key: 'public',
        label: localize('ac_learningcontroller_054'),
        value: localize('ac_continueclient_015'),
        status: localize('ac_learningcontroller_056'),
        detail: localize('ac_learningcontroller_057', [safeErrorCode(error as Object)])
      };
      items.push(unavailable);
    }
    try {
      const capable: boolean = this.dependencies.environment.supportsMission();
      const mission: EnvironmentItem = {
        key: 'syscap',
        label: localize('ac_learningcontroller_058'),
        value: capable ? localize('ac_learningcontroller_059') : localize('ac_learningcontroller_060'),
        status: capable ? localize('ac_learningcontroller_061') : localize('ac_learningcontroller_062'),
        detail: localize('ac_learningcontroller_063')
      };
      items.push(mission);
    } catch (error) {
      const mission: EnvironmentItem = {
        key: 'syscap',
        label: localize('ac_learningcontroller_058'),
        value: localize('ac_continueclient_015'),
        status: localize('ac_learningcontroller_066'),
        detail: localize('ac_learningcontroller_067')
      };
      items.push(mission);
    }
    try {
      const granted: number = this.dependencies.environment.checkPermission();
      const permission: EnvironmentItem = {
        key: 'permission',
        label: localize('ac_learningcontroller_068'),
        value: granted === 0 ? localize('ac_learningcontroller_069') : localize('ac_learningcontroller_070'),
        status: localize('ac_learningcontroller_061'),
        detail: localize('ac_learningcontroller_072')
      };
      items.push(permission);
    } catch (error) {
      const permission: EnvironmentItem = {
        key: 'permission',
        label: localize('ac_learningcontroller_068'),
        value: localize('ac_continueclient_015'),
        status: localize('ac_learningcontroller_066'),
        detail: localize('ac_learningcontroller_076')
      };
      items.push(permission);
    }
    const peer: EnvironmentItem = {
      key: 'peer',
      label: localize('ac_learningcontroller_077'),
      value: localize('ac_continueclient_015'),
      status: localize('ac_learningcontroller_079'),
      detail: localize('ac_learningcontroller_080')
    };
    items.push(peer);
    this.value.environment = items;
    this.value.environmentCheckedAt = this.nowText();
    record.environment = copyEnvironment(items);
    record.facts.push(localize('ac_learningcontroller_081'));
    record.limits.push(localize('ac_learningcontroller_082'));
    record.nextSteps.push(localize('ac_learningcontroller_083'));
    this.finish(record, localize('ac_learningcontroller_084'), 'INFO', localize('ac_learningcontroller_085'));
    this.publish();
  }

  requestPermission(): void {
    if (this.disposed) {
      return;
    }
    if (this.permissionRecordId.length > 0) {
      this.value.notice = localize('ac_learningcontroller_086');
      this.publish();
      return;
    }
    const record = this.startRecord('PERMISSION', localize('ac_learningcontroller_087'), localize('ac_learningcontroller_088'));
    this.permissionRecordId = record.id;
    record.facts.push(localize('ac_learningcontroller_089'));
    try {
      this.dependencies.environment.requestPermission().then((result: number[]): void => {
        if (this.disposed || this.permissionRecordId !== record.id) {
          return;
        }
        this.permissionRecordId = '';
        const granted: boolean = result.length > 0 && result[0] === 0;
        record.facts.push(localize('ac_learningcontroller_090', [result.length > 0 ? result[0] : localize('ac_learningcontroller_091')]));
        record.limits.push(localize('ac_learningcontroller_092'));
        this.finish(record, granted ? localize('ac_learningcontroller_093') : localize('ac_learningcontroller_094'), granted ? 'INFO' : 'WARN', localize('ac_learningcontroller_095'));
        this.value.notice = granted ? localize('ac_learningcontroller_096') : localize('ac_learningcontroller_097');
        this.publish();
      }).catch((error: BusinessError): void => {
        if (this.disposed || this.permissionRecordId !== record.id) {
          return;
        }
        this.permissionRecordId = '';
        record.errorCode = safeErrorCode(error);
        record.rawMessage = this.readableMessage(safeErrorMessage(error));
        this.describeError(record);
        this.finish(record, localize('ac_learningcontroller_098'), 'ERROR', localize('ac_learningcontroller_099'));
        this.publish();
      });
      this.event(record, localize('ac_learningcontroller_100'), 'INFO', localize('ac_learningcontroller_101'));
    } catch (error) {
      this.permissionRecordId = '';
      record.errorCode = safeErrorCode(error as Object);
      record.rawMessage = this.readableMessage(safeErrorMessage(error as Object));
      this.describeError(record);
      this.finish(record, localize('ac_learningcontroller_102'), 'ERROR', localize('ac_learningcontroller_103'));
    }
    this.publish();
  }

  registerProbe(): void {
    if (this.disposed) {
      return;
    }
    if (!this.snapshot().canRegister) {
      this.value.notice = localize('ac_learningcontroller_104');
      this.publish();
      return;
    }
    const record = this.startRecord('ON', localize('ac_learningcontroller_105'), localize('ac_learningcontroller_106'));
    this.probeRecordId = record.id;
    record.facts.push(localize('ac_learningcontroller_107'));
    record.limits.push(localize('ac_learningcontroller_108'));
    this.bindListener(`probe:${record.id}`, record);
    if (this.client.state().listening && this.probeRecordId === record.id) {
      this.probeTimer = this.dependencies.clock.setTimeout((): void => {
        this.probeTimer = -1;
        if (this.disposed || this.probeRecordId !== record.id) {
          return;
        }
        this.probeRecordId = '';
        this.finish(record, localize('ac_learningcontroller_109'), 'WARN', localize('ac_learningcontroller_110'));
        record.explanation.push(localize('ac_learningcontroller_111'));
        this.value.notice = localize('ac_learningcontroller_112');
        this.beginOff();
        this.publish();
      }, PROBE_LIMIT_MS);
    }
    this.publish();
  }

  private bindListener(owner: string, record: OperationRecord): void {
    this.listenerOwner = owner;
    const call = this.client.register((event: ContinueObservation): void => {
      if (this.disposed || this.listenerOwner !== owner) {
        return;
      }
      this.handleQuickObservation(owner, record, event);
    });
    this.callEvent(record, localize('ac_learningcontroller_113'), call.accepted ? 'INFO' : 'ERROR', call.detail);
    if (!call.accepted && record.endedAt.length === 0) {
      record.errorCode = call.errorCode;
      record.rawMessage = call.rawMessage === undefined ? localize('ac_learningcontroller_114') :
        this.readableMessage(call.rawMessage);
      this.describeError(record);
      if (owner.indexOf('probe:') === 0) {
        this.probeRecordId = '';
        this.finish(record, localize('ac_learningcontroller_115'), 'ERROR', localize('ac_learningcontroller_116'));
        this.value.notice = localize('ac_learningcontroller_117');
      } else {
        this.failSession(localize('ac_learningcontroller_118'), localize('ac_learningcontroller_116'));
      }
    }
  }

  private handleQuickObservation(owner: string, record: OperationRecord, event: ContinueObservation): void {
    const current = this.session;
    if (owner.indexOf('probe:') === 0) {
      if (this.probeRecordId !== record.id) {
        return;
      }
    } else if (current === undefined || !current.active || current.quickSeen ||
      owner !== `session:${current.generation}`) {
      return;
    }
    record.rawResultState = event.rawState;
    record.resultInfo = this.readableMessage(event.detail);
    record.errorCode = event.errorCode;
    if (event.kind === 'ERROR') {
      record.rawMessage = this.readableMessage(event.detail);
      this.describeError(record);
    }
    this.event(record, localize('ac_learningcontroller_120'), event.kind === 'SUCCESS' ? 'INFO' : event.kind === 'UNKNOWN' ? 'WARN' : 'ERROR',
      localize('ac_learningcontroller_121', [event.rawState]));
    if (owner.indexOf('probe:') === 0) {
      if (this.probeRecordId !== record.id) {
        return;
      }
      this.clearProbeTimer();
      this.probeRecordId = '';
      record.facts.push(localize('ac_learningcontroller_122'));
      this.finish(record, event.kind === 'SUCCESS' ? localize('ac_learningcontroller_123') :
        event.kind === 'UNKNOWN' ? localize('ac_learningcontroller_124') : localize('ac_learningcontroller_125'),
        event.kind === 'SUCCESS' ? 'INFO' : event.kind === 'UNKNOWN' ? 'WARN' : 'ERROR', localize('ac_learningcontroller_126'));
      this.value.notice = localize('ac_learningcontroller_127');
      this.beginOff();
      this.publish();
      return;
    }
    const session = this.session;
    if (session === undefined || !session.active || owner !== `session:${session.generation}` || session.quickSeen) {
      return;
    }
    session.quickSeen = true;
    session.quickOk = event.kind === 'SUCCESS';
    this.value.quickResult = event.kind === 'SUCCESS' ? localize('ac_learningcontroller_128') :
      event.kind === 'UNKNOWN' ? localize('ac_learningcontroller_129', [event.rawState]) :
      event.kind === 'ERROR' ? localize('ac_learningcontroller_130', [event.errorCode]) : localize('ac_learningcontroller_131', [event.rawState]);
    if (!session.quickOk) {
      this.failSession(event.kind === 'UNKNOWN' ? localize('ac_learningcontroller_132') :
        event.kind === 'ERROR' ? localize('ac_learningcontroller_133') : localize('ac_learningcontroller_134'), localize('ac_learningcontroller_135'));
    } else {
      this.advanceSession();
    }
    this.publish();
  }

  unregisterProbe(): void {
    if (this.disposed) {
      return;
    }
    if (this.session !== undefined && this.session.active) {
      this.value.notice = localize('ac_learningcontroller_136');
      this.publish();
      return;
    }
    if (this.probeRecordId.length > 0) {
      const record = this.findRecord(this.probeRecordId);
      if (record !== undefined) {
        this.finish(record, localize('ac_learningcontroller_137'), 'WARN', localize('ac_learningcontroller_138'));
      }
      this.probeRecordId = '';
    }
    this.clearProbeTimer();
    this.beginOff();
    this.publish();
  }

  private beginOff(): void {
    const slot = this.client.state();
    this.listenerOwner = '';
    if (slot.offPending) {
      this.value.notice = localize('ac_continueclient_023');
      return;
    }
    if (!slot.nativeDirty) {
      return;
    }
    const record = this.startRecord('OFF', localize('ac_learningcontroller_140'), localize('ac_learningcontroller_141'));
    this.offRecordId = record.id;
    record.facts.push(localize('ac_learningcontroller_142'));
    record.limits.push(localize('ac_learningcontroller_143'));
    const call = this.client.unregister((event: ContinueObservation): void => {
      if (this.disposed || this.offRecordId !== record.id) {
        return;
      }
      record.rawResultState = event.rawState;
      record.resultInfo = this.readableMessage(event.detail);
      record.errorCode = event.errorCode;
      if (event.kind === 'ERROR') {
        record.rawMessage = this.readableMessage(event.detail);
        this.describeError(record);
      }
      if (event.phase === 'OFF_OBSERVATION') {
        this.finish(record, localize('ac_learningcontroller_144'), 'WARN', localize('ac_learningcontroller_145'));
        record.facts.push(localize('ac_learningcontroller_146'));
        record.nextSteps.push(localize('ac_learningcontroller_147'));
        this.value.notice = event.detail;
      } else {
        const success: boolean = event.kind === 'SUCCESS';
        this.finish(record, success ? localize('ac_learningcontroller_148') : event.kind === 'UNKNOWN' ?
          localize('ac_learningcontroller_149') : localize('ac_learningcontroller_150'),
          success ? 'INFO' : event.kind === 'UNKNOWN' ? 'WARN' : 'ERROR', localize('ac_learningcontroller_151'));
        record.facts.push(localize('ac_learningcontroller_152', [event.rawState]));
        if (!success) {
          record.nextSteps.push(localize('ac_learningcontroller_147'));
        }
        this.value.notice = success ? localize('ac_learningcontroller_154') : localize('ac_learningcontroller_155');
      }
      this.offRecordId = '';
      this.tryBindWaitingSession();
      this.publish();
    });
    this.callEvent(record, localize('ac_learningcontroller_156'), call.accepted ? 'INFO' : 'ERROR', call.detail);
    if (!call.accepted && record.endedAt.length === 0) {
      record.errorCode = call.errorCode;
      record.rawMessage = call.rawMessage === undefined ? localize('ac_learningcontroller_114') :
        this.readableMessage(call.rawMessage);
      this.describeError(record);
      this.offRecordId = '';
      record.nextSteps.push(localize('ac_learningcontroller_147'));
      this.value.notice = localize('ac_learningcontroller_159');
      this.finish(record, localize('ac_learningcontroller_160'), 'ERROR', localize('ac_learningcontroller_161'));
      this.tryBindWaitingSession();
    }
  }

  updateText(text: string): void {
    if (!this.value.canEdit || this.disposed) {
      return;
    }
    if (text.length > MAX_TEXT_LENGTH || !validUnicode(text)) {
      this.value.notice = localize('ac_learningcontroller_162');
      this.publish();
      return;
    }
    this.value.text = text;
    this.value.selectionStart = text.length;
    this.value.selectionEnd = text.length;
    this.dirty = true;
    this.value.savedTextStatus = localize('ac_learningcontroller_163');
    this.publish();
  }

  updateSelection(start: number, end: number): void {
    if (!this.value.canEdit || this.disposed) {
      return;
    }
    if (!selectionBoundary(this.value.text, start) || !selectionBoundary(this.value.text, end) || start > end) {
      this.value.notice = localize('ac_learningcontroller_164');
      this.publish();
      return;
    }
    this.value.selectionStart = start;
    this.value.selectionEnd = end;
    this.dirty = true;
    this.value.savedTextStatus = localize('ac_learningcontroller_163');
    this.publish();
  }

  fillExample(): void {
    // Sample text is user-visible content resolved in the current Ability language.
    this.updateText(localize('ac_learningcontroller_166'));
  }

  private localPayload(): TextPayload {
    const payload: TextPayload = {
      version: this.documentId.length > 0 ? 2 : 1,
      transferId: 'local',
      page: 'text',
      text: this.value.text,
      selectionStart: this.value.selectionStart,
      selectionEnd: this.value.selectionEnd,
      documentId: this.documentId,
      revision: this.localRevision
    };
    return payload;
  }

  private nextDocumentId(): string {
    if (this.documentId.length > 0) {
      return this.documentId;
    }
    this.documentSerial += 1;
    return `doc-${this.dependencies.clock.now()}-${this.documentSerial}`;
  }

  saveText(): void {
    if (this.disposed || !this.value.canEdit) {
      return;
    }
    const record = this.startRecord('SAVE', localize('ac_learningcontroller_167'), localize('ac_learningcontroller_168'));
    if (this.localRevision >= MAX_REVISION) {
      record.errorCode = 'REVISION_LIMIT';
      record.facts.push(localize('ac_learningcontroller_169'));
      this.value.savedTextStatus = localize('ac_learningcontroller_170');
      this.value.notice = localize('ac_learningcontroller_171');
      this.finish(record, localize('ac_learningcontroller_172'), 'ERROR', localize('ac_learningcontroller_173'));
      this.publish();
      return;
    }
    const documentId: string = this.nextDocumentId();
    const revision: number = this.localRevision + 1;
    const payload: TextPayload = this.localPayload();
    payload.version = 2;
    payload.documentId = documentId;
    payload.revision = revision;
    const outcome = this.persist(payload);
    record.errorCode = outcome.code;
    record.facts.push(outcome.detail);
    if (outcome.ok) {
      // 持久化成功后才提交内存中的文档身份与修订号，失败不改动内存状态。
      this.documentId = documentId;
      this.localRevision = revision;
      this.value.documentId = documentId;
      this.value.revision = revision;
      this.dirty = false;
      record.facts.push(localize('ac_learningcontroller_174', [revision]));
      this.value.savedTextStatus = localize('ac_learningcontroller_175');
      this.value.notice = localize('ac_learningcontroller_176');
    } else {
      this.value.savedTextStatus = localize('ac_learningcontroller_177');
      this.value.notice = outcome.detail;
    }
    this.finish(record, outcome.ok ? localize('ac_learningcontroller_178') : localize('ac_learningcontroller_179'), outcome.ok ? 'INFO' : 'ERROR', localize('ac_learningcontroller_180'));
    this.publish();
  }

  /** 显式另存为新文档；保留编辑内容，成功前不重置旧身份或修订。 */
  newDocument(): void {
    if (this.disposed || !this.value.canEdit) {
      return;
    }
    const record = this.startRecord('NEW', localize('ac_learningcontroller_181'), localize('ac_learningcontroller_182'));
    const payload = this.localPayload();
    payload.version = 2;
    payload.documentId = `doc-${this.dependencies.clock.now()}-${++this.documentSerial}`;
    // 同毫秒重开/首次保存可能使用相同序号，确保不复用当前身份。
    if (payload.documentId === this.documentId) {
      payload.documentId = `doc-${this.dependencies.clock.now()}-${++this.documentSerial}`;
    }
    payload.revision = 1;
    const outcome = this.persist(payload);
    record.errorCode = outcome.code;
    record.facts.push(outcome.detail);
    if (outcome.ok) {
      this.documentId = payload.documentId;
      this.localRevision = 1;
      this.value.documentId = payload.documentId;
      this.value.revision = 1;
      this.dirty = false;
      this.value.savedTextStatus = localize('ac_learningcontroller_183');
    }
    this.value.notice = outcome.ok ? localize('ac_learningcontroller_184') : outcome.detail;
    this.finish(record, outcome.ok ? localize('ac_learningcontroller_185') : localize('ac_learningcontroller_186'), outcome.ok ? 'INFO' : 'ERROR', localize('ac_learningcontroller_180'));
    this.publish();
  }

  clearText(): void {
    if (this.disposed || !this.value.canEdit) {
      return;
    }
    const record = this.startRecord('SAVE', localize('ac_learningcontroller_188'), localize('ac_learningcontroller_189'));
    const hasDocument: boolean = this.documentId.length > 0;
    if (hasDocument && this.localRevision >= MAX_REVISION) {
      record.errorCode = 'REVISION_LIMIT';
      record.facts.push(localize('ac_learningcontroller_190'));
      this.value.savedTextStatus = localize('ac_learningcontroller_191');
      this.value.notice = localize('ac_learningcontroller_192');
      this.finish(record, localize('ac_learningcontroller_193'), 'ERROR', localize('ac_learningcontroller_173'));
      this.publish();
      return;
    }
    const empty: TextPayload = this.localPayload();
    const revision: number = hasDocument ? this.localRevision + 1 : 0;
    empty.text = '';
    empty.selectionStart = 0;
    empty.selectionEnd = 0;
    empty.revision = revision;
    const outcome = this.persist(empty);
    record.errorCode = outcome.code;
    record.facts.push(outcome.detail);
    if (outcome.ok) {
      if (hasDocument) {
        this.localRevision = revision;
        this.value.revision = revision;
      }
      this.value.text = '';
      this.value.selectionStart = 0;
      this.value.selectionEnd = 0;
      this.dirty = false;
      this.value.savedTextStatus = localize('ac_learningcontroller_195');
    }
    this.finish(record, outcome.ok ? localize('ac_learningcontroller_196') : localize('ac_learningcontroller_197'), outcome.ok ? 'INFO' : 'ERROR', localize('ac_learningcontroller_180'));
    this.value.notice = outcome.ok ? localize('ac_learningcontroller_199') : outcome.detail;
    this.publish();
  }

  private openStore(): void {
    try {
      this.store = this.dependencies.openStore();
      const raw = this.store.getSync(STORE_KEY, '');
      if (typeof raw !== 'string') {
        this.value.savedTextStatus = localize('ac_learningcontroller_200');
        return;
      }
      if (raw.length === 0) {
        this.value.savedTextStatus = localize('ac_learningcontroller_201');
        return;
      }
      this.durableDocument = raw;
      const decoded = decodePayload(raw);
      if (decoded.value === undefined) {
        this.value.savedTextStatus = localize('ac_learningcontroller_202');
        return;
      }
      this.value.text = decoded.value.text;
      this.value.selectionStart = decoded.value.selectionStart;
      this.value.selectionEnd = decoded.value.selectionEnd;
      this.documentId = decoded.value.documentId;
      this.localRevision = decoded.value.revision;
      this.value.documentId = this.documentId;
      this.value.revision = this.localRevision;
      this.dirty = false;
      this.value.savedTextStatus = localize('ac_learningcontroller_203');
    } catch (error) {
      this.store = undefined;
      this.value.savedTextStatus = localize('ac_learningcontroller_204', [safeErrorCode(error as Object)]);
    }
  }

  private persist(payload: TextPayload): WriteOutcome {
    const store = this.store;
    if (store === undefined || this.storageUncertain) {
      const unavailable: WriteOutcome = {
        ok: false, code: '', detail: this.storageUncertain ?
          localize('ac_learningcontroller_205') :
          localize('ac_learningcontroller_206')
      };
      return unavailable;
    }
    const previous = this.durableDocument;
    const serialized: string = JSON.stringify(payload);
    try {
      store.putSync(STORE_KEY, serialized);
      store.flushSync();
      this.durableDocument = serialized;
      const ok: WriteOutcome = { ok: true, code: '', detail: localize('ac_learningcontroller_207') };
      return ok;
    } catch (error) {
      let rolledBack: boolean = false;
      try {
        if (previous === undefined) {
          store.deleteSync(STORE_KEY);
        } else {
          store.putSync(STORE_KEY, previous);
        }
        store.flushSync();
        rolledBack = true;
      } catch (rollbackError) {
        this.storageUncertain = true;
      }
      const failed: WriteOutcome = {
        ok: false, code: safeErrorCode(error as Object), detail: rolledBack ?
          localize('ac_learningcontroller_208') :
          localize('ac_learningcontroller_209')
      };
      return failed;
    }
  }

  handleLaunch(want: Want, numericReason: number): void {
    if (this.disposed) {
      return;
    }
    this.value.launchReasonCode = numericReason;
    this.value.launchReason = numericReason === 10 ? localize('ac_learningcontroller_210') :
      numericReason === 3 ? localize('ac_learningcontroller_211') : localize('ac_learningcontroller_212', [numericReason]);
    if (numericReason !== 10 && numericReason !== 3) {
      this.value.notice = '';
      this.publish();
      return;
    }
    if (numericReason === 10) {
      if (this.session !== undefined && this.session.active) {
        const record = this.findRecord(this.session.recordId);
        if (record !== undefined) {
          this.event(record, localize('ac_learningcontroller_213'), 'WARN', localize('ac_learningcontroller_214'));
        }
        this.publish();
        return;
      }
      this.terminalAwaitingData = false;
      this.startSession(true);
      const parameters = want.parameters;
      // 系统 PREPARE 启动：接收候选，并等待快速结果与页面就绪。
      if (parameters !== undefined &&
        (hasPayload(parameters[TEXT_PAYLOAD_KEY]) || hasPayload(parameters[SCENE_PAYLOAD_KEY]))) {
        this.acceptCandidate(readContinuation(want));
      }
      this.tryBindWaitingSession();
      this.advanceSession();
      this.publish();
      return;
    }
    const decoded = readContinuation(want);
    if (this.terminalAwaitingData) {
      if (decoded.value !== undefined) {
        this.rememberTag(decoded.value.transferId);
      }
      this.value.notice = localize('ac_learningcontroller_215');
      this.publish();
      return;
    }
    if (decoded.value !== undefined && this.completedTags.indexOf(decoded.value.transferId) >= 0) {
      this.value.notice = localize('ac_learningcontroller_216');
      this.publish();
      return;
    }
    if (this.session === undefined || !this.session.active) {
      this.startSession(false);
    }
    this.acceptCandidate(decoded);
    this.advanceSession();
    this.publish();
  }

  private startSession(quickRequired: boolean): void {
    this.clearSessionTimer();
    if (this.probeRecordId.length > 0) {
      const probe = this.findRecord(this.probeRecordId);
      if (probe !== undefined) {
        this.finish(probe, localize('ac_learningcontroller_217'), 'WARN', localize('ac_learningcontroller_218'));
      }
      this.probeRecordId = '';
      this.clearProbeTimer();
      this.beginOff();
    }
    const record = this.startRecord('RESTORE', quickRequired ? localize('ac_learningcontroller_219') : localize('ac_learningcontroller_220'),
      localize('ac_learningcontroller_221'));
    record.facts.push(quickRequired ? localize('ac_learningcontroller_222') : localize('ac_learningcontroller_223'));
    record.limits.push(localize('ac_learningcontroller_224'),
      localize('ac_learningcontroller_225'));
    const session: RestoreSession = {
      generation: ++this.sessionGeneration,
      recordId: record.id,
      quickRequired: quickRequired,
      quickSeen: false,
      quickOk: !quickRequired,
      candidate: undefined,
      active: true,
      waitingPhase: '',
      positionOk: false
    };
    this.session = session;
    this.sceneWorkbench.setLocked(true);
    this.value.targetPage = 'pages/ProcessPage';
    this.value.positionRequest = ++this.positionSerial;
    this.value.businessPositionState = localize('ac_learningcontroller_226');
    this.value.sessionRecordId = record.id;
    this.value.quickStartRequired = quickRequired;
    this.value.quickResult = quickRequired ? localize('ac_learningcontroller_227') : localize('ac_learningcontroller_228');
    this.value.dataState = localize('ac_learningcontroller_229');
    this.value.committed = false;
    this.value.restoredSummary = '';
    this.value.sessionState = quickRequired ? localize('ac_learningcontroller_230') : localize('ac_learningcontroller_231');
    this.value.notice = localize('ac_learningcontroller_232');
  }

  private tryBindWaitingSession(): void {
    const session = this.session;
    if (session === undefined || !session.active || !session.quickRequired || session.quickSeen) {
      return;
    }
    const owner: string = `session:${session.generation}`;
    if (this.listenerOwner === owner && this.client.state().listening) {
      return;
    }
    const slot = this.client.state();
    const record = this.findRecord(session.recordId);
    if (record === undefined) {
      return;
    }
    if (slot.offPending || slot.listening) {
      this.value.quickResult = localize('ac_learningcontroller_233');
      this.event(record, localize('ac_learningcontroller_234'), 'WARN', localize('ac_learningcontroller_235'));
      return;
    }
    this.value.quickResult = localize('ac_learningcontroller_227');
    this.bindListener(owner, record);
  }

  private acceptCandidate(decoded: PayloadRead): void {
    const session = this.session;
    if (session === undefined || !session.active) {
      return;
    }
    const record = this.findRecord(session.recordId);
    if (record === undefined) {
      return;
    }
    if (decoded.value === undefined) {
      this.value.dataState = localize('ac_learningcontroller_237');
      record.facts.push(decoded.reason);
      this.failSession(decoded.reason, localize('ac_learningcontroller_238'));
      return;
    }
    const candidate = decoded.value;
    if (this.completedTags.indexOf(candidate.transferId) >= 0) {
      this.failSession(localize('ac_learningcontroller_239'), localize('ac_learningcontroller_240'));
      return;
    }
    if (session.candidate !== undefined) {
      if (JSON.stringify(session.candidate) === JSON.stringify(candidate)) {
        this.event(record, localize('ac_learningcontroller_241'), 'INFO', localize('ac_learningcontroller_242'));
        return;
      }
      this.failSession(localize('ac_learningcontroller_243'), localize('ac_learningcontroller_244'));
      return;
    }
    session.candidate = candidate;
    // 候选可能晚于平台消息；即使需要冲突选择也必须先消除已识别的正文片段。
    this.value.records.forEach((item: OperationRecord): void => {
      item.rawMessage = this.readableMessage(item.rawMessage);
      item.resultInfo = this.readableMessage(item.resultInfo);
    });
    if (candidate.scene !== undefined) {
      const reason = this.sceneWorkbench.conflictReason(candidate.scene);
      this.value.targetPage = this.scenePage(candidate.scene.state.kind);
      this.value.positionRequest = ++this.positionSerial;
      this.value.businessPositionState = localize('ac_learningcontroller_245');
      if (this.dirty || reason.length > 0) {
        this.enterConflict(candidate, 'document', this.dirty ? localize('ac_learningcontroller_246') : reason);
      } else {
        this.value.dataState = localize('ac_learningcontroller_247');
      }
      this.event(record, localize('ac_learningcontroller_248'), 'INFO', localize('ac_learningcontroller_249', [candidate.scene.state.kind]));
      return;
    }
    if (this.sceneWorkbench.hasDirtyWork()) {
      this.enterConflict(candidate, 'document', localize('ac_learningcontroller_250'));
      return;
    }
    const sameDocument: boolean = candidate.documentId.length === 0 || this.documentId.length === 0 ||
      candidate.documentId === this.documentId;
    const divergent: boolean = candidate.text !== this.value.text ||
      candidate.selectionStart !== this.value.selectionStart ||
      candidate.selectionEnd !== this.value.selectionEnd;
    if (this.dirty && (!sameDocument || divergent)) {
      this.enterConflict(candidate, !sameDocument ? 'document' : 'revision',
        localize('ac_learningcontroller_251', [candidate.revision, this.localRevision]) +
        localize('ac_learningcontroller_252'));
      this.event(record, localize('ac_index_044'), 'WARN', this.value.conflictSummary);
      return;
    }
    if (sameDocument && candidate.documentId.length > 0 && candidate.revision <= this.localRevision && divergent) {
      this.enterConflict(candidate, 'revision',
        localize('ac_learningcontroller_254', [candidate.revision, this.localRevision]) +
        localize('ac_learningcontroller_255'));
      this.event(record, localize('ac_index_045'), 'WARN', this.value.conflictSummary);
      return;
    }
    if (!sameDocument) {
      this.event(record, localize('ac_learningcontroller_257'), 'INFO',
        localize('ac_learningcontroller_258', [candidate.documentId, this.documentId]));
    }
    // 数据可能晚于通知到达；已识别正文后再次消除旧详情中的同文本。
    this.value.records.forEach((item: OperationRecord): void => {
      item.rawMessage = this.readableMessage(item.rawMessage);
      item.resultInfo = this.readableMessage(item.resultInfo);
    });
    this.value.dataState = localize('ac_learningcontroller_259');
    record.facts.push(localize('ac_learningcontroller_260', [candidate.text.length]));
    this.event(record, localize('ac_learningcontroller_261'), 'INFO', localize('ac_learningcontroller_262'));
  }

  private enterConflict(candidate: TextPayload, kind: string, summary: string): void {
    this.conflictCandidate = candidate;
    this.conflictAccepted = false;
    this.value.conflictPending = true;
    this.value.conflictAccepted = false;
    this.value.conflictKind = kind;
    this.value.conflictSummary = summary;
    this.value.dataState = localize('ac_learningcontroller_263');
    this.value.notice = localize('ac_learningcontroller_264') + (kind === 'document' ? localize('ac_index_044') : localize('ac_index_045')) +
      localize('ac_learningcontroller_267');
  }

  private advanceSession(): void {
    const session = this.session;
    if (session === undefined || !session.active) {
      return;
    }
    let phase: string = '';
    if (session.quickRequired && !session.quickSeen) {
      phase = localize('ac_learningcontroller_135');
    } else if (session.candidate === undefined) {
      phase = localize('ac_processpage_017');
    } else if (this.value.windowState !== localize('ac_learningcontroller_270')) {
      phase = localize('ac_learningcontroller_271');
    } else if (session.candidate.scene !== undefined && !session.positionOk) {
      phase = localize('ac_learningcontroller_272');
    }
    const record = this.findRecord(session.recordId);
    if (record === undefined) {
      return;
    }
    if (phase.length > 0) {
      this.value.sessionState = localize('ac_learningcontroller_273', [phase]);
      if (session.waitingPhase !== phase) {
        this.clearSessionTimer();
        session.waitingPhase = phase;
        this.event(record, localize('ac_learningcontroller_274', [phase]), 'INFO', localize('ac_learningcontroller_275'));
        const generation: number = session.generation;
        this.sessionTimer = this.dependencies.clock.setTimeout((): void => {
          this.sessionTimer = -1;
          const current = this.session;
          if (this.disposed || current === undefined || !current.active || current.generation !== generation ||
            current.waitingPhase !== phase) {
            return;
          }
          const missing: string = phase === localize('ac_learningcontroller_135') ? localize('ac_learningcontroller_277') :
            phase === localize('ac_processpage_017') ? localize('ac_learningcontroller_279') : phase === localize('ac_learningcontroller_272') ? localize('ac_learningcontroller_281') :
              localize('ac_learningcontroller_282');
          this.failSession(localize('ac_learningcontroller_283', [missing]), localize('ac_learningcontroller_284', [phase]));
          this.publish();
        }, PHASE_LIMIT_MS);
      }
      return;
    }
    const candidate = session.candidate;
    if (candidate === undefined || !session.quickOk) {
      return;
    }
    if (this.value.conflictPending) {
      this.clearSessionTimer();
      if (!this.conflictAccepted) {
        this.value.sessionState = localize('ac_learningcontroller_285');
        return;
      }
      const accepted = this.acceptedConflictCandidate();
      if (accepted === undefined) {
        this.failSession(localize('ac_learningcontroller_286'), localize('ac_learningcontroller_287'));
        return;
      }
      this.event(record, localize('ac_learningcontroller_288'), 'INFO',
        localize('ac_learningcontroller_289', [accepted.revision]));
      this.commitCandidate(record, session, accepted);
      return;
    }
    this.clearSessionTimer();
    this.event(record, localize('ac_learningcontroller_180'), 'INFO', localize('ac_learningcontroller_291'));
    this.commitCandidate(record, session, candidate);
  }

  private acceptedConflictCandidate(): TextPayload | undefined {
    const candidate = this.conflictCandidate;
    if (candidate === undefined) {
      return undefined;
    }
    // 修订只在同一身份内比较；跨文档不得携入本机文档的修订历史。
    if (candidate.version === 1 || candidate.scene !== undefined) {
      return candidate;
    }
    const base: number = candidate.documentId === this.documentId ?
      Math.max(this.localRevision, candidate.revision) : candidate.revision;
    if (base >= MAX_REVISION) {
      return undefined;
    }
    const accepted: TextPayload = {
      version: 2,
      transferId: candidate.transferId,
      page: 'text',
      text: candidate.text,
      selectionStart: candidate.selectionStart,
      selectionEnd: candidate.selectionEnd,
      documentId: candidate.documentId,
      revision: base + 1
    };
    return accepted;
  }

  private planCommit(candidate: TextPayload): CommitPlan | undefined {
    if (candidate.documentId.length === 0) {
      // v1 没有身份；磁盘与内存必须同时回到无标识/r0，不能借用旧 v2 身份。
      return { payload: candidate, documentId: '', revision: 0 };
    }
    const revision: number = candidate.documentId === this.documentId ?
      Math.max(this.localRevision, candidate.revision) : candidate.revision;
    if (revision > MAX_REVISION) {
      return undefined;
    }
    const payload: TextPayload = {
      version: 2,
      transferId: candidate.transferId,
      page: 'text',
      text: candidate.text,
      selectionStart: candidate.selectionStart,
      selectionEnd: candidate.selectionEnd,
      documentId: candidate.documentId,
      revision: revision
    };
    return { payload: payload, documentId: candidate.documentId, revision: revision };
  }

  private commitCandidate(record: OperationRecord, session: RestoreSession, candidate: TextPayload): boolean {
    if (candidate.scene !== undefined) {
      if (!this.sceneWorkbench.commitIncoming(candidate.scene, this.conflictAccepted)) {
        this.failSession(this.sceneWorkbench.snapshot().error, localize('ac_learningcontroller_292'));
        return false;
      }
      this.activeBusiness = candidate.scene.state.kind;
      const restored = this.sceneWorkbench.document(this.activeBusiness);
      this.value.scene = restored.state;
      this.value.documentId = restored.documentId;
      this.value.revision = restored.revision;
      this.value.committed = true;
      this.value.dataState = localize('ac_learningcontroller_293');
      this.value.sessionState = localize('ac_learningcontroller_294');
      this.value.restoredSummary = localize('ac_learningcontroller_295', [this.activeBusiness, restored.revision]);
      this.value.notice = localize('ac_learningcontroller_296');
      this.commitConflictTag();
      session.active = false;
      this.sceneWorkbench.setLocked(false);
      this.terminalAwaitingData = false;
      this.rememberTag(candidate.transferId);
      this.finish(record, localize('ac_learningcontroller_297'), 'INFO', localize('ac_learningcontroller_298'));
      if (session.quickRequired) { this.beginOff(); }
      return true;
    }
    const plan = this.planCommit(candidate);
    if (plan === undefined) {
      this.failSession(localize('ac_learningcontroller_299'), localize('ac_learningcontroller_287'));
      return false;
    }
    const outcome = this.persist(plan.payload);
    record.errorCode = outcome.code;
    record.facts.push(outcome.detail);
    if (!outcome.ok) {
      this.value.savedTextStatus = localize('ac_learningcontroller_301');
      this.failSession(outcome.detail, localize('ac_learningcontroller_302'));
      return false;
    }
    // 持久化成功后一次性提交文档标识、修订号、正文和选区，避免部分更新。
    this.activeBusiness = 'text';
    this.value.scene = emptyScene();
    this.value.text = plan.payload.text;
    this.value.selectionStart = plan.payload.selectionStart;
    this.value.selectionEnd = plan.payload.selectionEnd;
    this.documentId = plan.documentId;
    this.localRevision = plan.revision;
    this.value.documentId = plan.documentId;
    this.value.revision = plan.revision;
    this.dirty = false;
    this.value.conflictPending = false;
    this.value.conflictAccepted = false;
    this.value.conflictKind = '';
    this.value.conflictSummary = '';
    this.conflictCandidate = undefined;
    this.conflictAccepted = false;
    this.value.savedTextStatus = localize('ac_learningcontroller_303');
    this.value.dataState = localize('ac_learningcontroller_304');
    this.value.committed = true;
    this.value.restoredSummary = localize('ac_learningcontroller_305', [plan.documentId.length > 0 ? plan.documentId : localize('ac_learningcontroller_306')]) +
      localize('ac_learningcontroller_307', [plan.revision, plan.payload.text.length]) +
      `${plan.payload.selectionStart}–${plan.payload.selectionEnd}。`;
    this.value.sessionState = localize('ac_learningcontroller_308');
    this.value.notice = localize('ac_learningcontroller_309');
    session.active = false;
    this.sceneWorkbench.setLocked(false);
    this.terminalAwaitingData = false;
    this.rememberTag(plan.payload.transferId);
    record.facts.push(localize('ac_learningcontroller_310'));
    this.finish(record, localize('ac_learningcontroller_311'), 'INFO', localize('ac_learningcontroller_298'));
    if (session.quickRequired) {
      this.beginOff();
    }
    return true;
  }

  /** 用户选择接续版本：只记录决策，仍须等待快速结果与页面门控后再原子提交。 */
  acceptConflict(): void {
    const session = this.session;
    const candidate = this.conflictCandidate;
    if (this.disposed || session === undefined || !session.active || candidate === undefined ||
      !this.value.conflictPending || this.conflictAccepted) {
      return;
    }
    this.conflictAccepted = true;
    this.value.conflictAccepted = true;
    this.value.sessionState = localize('ac_learningcontroller_313');
    this.value.notice = localize('ac_learningcontroller_314');
    const record = this.findRecord(session.recordId);
    if (record !== undefined) {
      this.event(record, localize('ac_learningcontroller_315'), 'INFO', localize('ac_learningcontroller_316'));
    }
    this.advanceSession();
    // 同步持久化可能已提交或失败结束会话；最后通知必须携带最终门禁状态。
    this.publish();
  }


  /** 用户保留本机版本：不发持久化写入，仅结束本轮并记录选择。 */
  rejectConflict(): void {
    const session = this.session;
    if (this.disposed || session === undefined || !session.active) {
      return;
    }
    const record = this.findRecord(session.recordId);
    this.clearSessionTimer();
    this.value.conflictPending = false;
    this.value.conflictAccepted = false;
    this.value.conflictKind = '';
    this.value.conflictSummary = '';
    this.conflictAccepted = false;
    this.value.targetPage = 'pages/ProcessPage';
    this.value.positionRequest = ++this.positionSerial;
    this.value.sessionState = localize('ac_learningcontroller_317');
    this.value.notice = localize('ac_learningcontroller_318');
    this.value.savedTextStatus = localize('ac_learningcontroller_319');
    this.commitConflictTag();
    session.active = false;
    this.sceneWorkbench.setLocked(false);
    this.terminalAwaitingData = false;
    if (record !== undefined) {
      this.finish(record, localize('ac_learningcontroller_320'), 'WARN', localize('ac_index_045'));
    }
    if (session.quickRequired) {
      this.beginOff();
    }
    this.publish();
  }

  private commitConflictTag(): void {
    const candidate = this.conflictCandidate;
    if (candidate !== undefined) {
      this.rememberTag(candidate.transferId);
    }
    this.conflictCandidate = undefined;
    this.conflictAccepted = false;
    this.value.conflictPending = false;
    this.value.conflictAccepted = false;
    this.value.conflictKind = '';
    this.value.conflictSummary = '';
  }

  private failSession(message: string, stage: string): void {
    const session = this.session;
    if (session === undefined || !session.active) {
      return;
    }
    session.active = false;
    this.sceneWorkbench.setLocked(false);
    this.clearSessionTimer();
    this.conflictCandidate = undefined;
    this.conflictAccepted = false;
    this.value.conflictPending = false;
    this.value.conflictAccepted = false;
    this.value.conflictKind = '';
    this.value.conflictSummary = '';
    const candidate = session.candidate;
    if (candidate !== undefined) {
      this.rememberTag(candidate.transferId);
    }
    this.terminalAwaitingData = session.quickRequired && candidate === undefined;
    this.value.targetPage = 'pages/ProcessPage';
    this.value.positionRequest = ++this.positionSerial;
    this.value.sessionState = localize('ac_learningcontroller_322', [stage]);
    this.value.committed = false;
    this.value.notice = message;
    const record = this.findRecord(session.recordId);
    if (record !== undefined) {
      record.explanation.push(message);
      record.limits.push(localize('ac_learningcontroller_323'));
      record.nextSteps.push(localize('ac_learningcontroller_324'));
      this.finish(record, message, stage.indexOf(localize('ac_learningcontroller_325')) >= 0 ? 'WARN' : 'ERROR', stage);
    }
    if (session.quickRequired) {
      this.beginOff();
    }
  }

  private rememberTag(tag: string): void {
    if (this.completedTags.indexOf(tag) < 0) {
      this.completedTags.push(tag);
      if (this.completedTags.length > 48) {
        this.completedTags.shift();
      }
    }
  }

  private scenePage(kind: string): string {
    return kind === 'note' ? 'pages/NoteScenePage' : kind === 'reading' ? 'pages/ReadingScenePage' :
      kind === 'form' ? 'pages/FormScenePage' : 'pages/ProcessPage';
  }

  private localBackupAvailable(): boolean {
    return !this.disposed && (this.session === undefined || !this.session.active);
  }

  sceneBackupSnapshot(): SceneBackupExport {
    if (!this.localBackupAvailable()) {
      const blocked = new SceneBackupExport(); blocked.message = localize('ac_learningcontroller_326');
      return blocked;
    }
    return this.sceneWorkbench.backupSnapshot();
  }

  previewSceneBackup(raw: string, scope?: string[]): SceneBackupPreview {
    if (!this.localBackupAvailable()) {
      this.sceneWorkbench.cancelBackupPreview();
      const blocked = new SceneBackupPreview(); blocked.code = SceneBackupCode.BLOCKED;
      blocked.message = localize('ac_learningcontroller_327');
      return blocked;
    }
    return this.sceneWorkbench.previewBackup(raw, scope);
  }

  cancelSceneBackupPreview(): void { this.sceneWorkbench.cancelBackupPreview(); }
  isSceneBackupCurrent(epoch: number): boolean {
    return this.localBackupAvailable() && this.sceneWorkbench.isBackupCurrent(epoch);
  }

  restoreSceneBackup(token: string, confirmDirty: boolean, scope?: string[]): SceneBackupRestoreResult {
    if (!this.localBackupAvailable()) {
      this.sceneWorkbench.cancelBackupPreview();
      return new SceneBackupRestoreResult(SceneBackupCode.BLOCKED, localize('ac_learningcontroller_328'));
    }
    const result = this.sceneWorkbench.restoreBackup(token, confirmDirty, scope);
    if (result.ok && result.changed && this.activeBusiness !== 'text') {
      const current = this.sceneWorkbench.document(this.activeBusiness);
      this.value.scene = current.state;
      this.value.documentId = current.documentId; this.value.revision = current.revision;
    }
    // Local backup never flips committed/session flags or fabricates a business-position receipt.
    this.value.notice = result.message;
    this.publish();
    return result;
  }

  async copySceneBackup(exported: SceneBackupExport): Promise<SceneBackupCopyResult> {
    if (!exported.ok || !this.isSceneBackupCurrent(exported.epoch)) {
      return new SceneBackupCopyResult(SceneBackupCopyCode.BLOCKED, localize('ac_learningcontroller_329'));
    }
    const result = await this.backupClipboard.copy(exported.raw);
    if (result.copied && !this.disposed && !this.isSceneBackupCurrent(exported.epoch)) {
      result.message = localize('ac_learningcontroller_330');
    }
    return result;
  }

  activateText(): void {
    if (this.disposed || (this.session !== undefined && this.session.active)) { return; }
    this.activeBusiness = 'text';
    this.value.scene = emptyScene();
    this.value.documentId = this.documentId;
    this.value.revision = this.localRevision;
  }

  canResumeSceneBackupDrafts(): boolean {
    return this.localBackupAvailable() && this.sceneWorkbench.canResumeBackupDrafts();
  }

  resumeSceneBackupDrafts(kind: string): boolean {
    if (!this.canResumeSceneBackupDrafts()) { return false; }
    return this.openScene(kind, true);
  }

  openScene(kind: string, preserveBackupDrafts: boolean = false): boolean {
    if (this.disposed || (this.session !== undefined && this.session.active)) { return false; }
    if (!this.sceneWorkbench.open(kind, preserveBackupDrafts)) { return false; }
    this.activeBusiness = kind;
    const document = this.sceneWorkbench.document(kind);
    this.value.scene = document.state;
    if (preserveBackupDrafts) { this.value.documentId = document.documentId; this.value.revision = document.revision; }
    this.publish();
    return true;
  }

  positionTarget(): ScenePositionTarget | undefined {
    const session = this.session;
    if (this.disposed || session === undefined || !session.active || session.candidate === undefined ||
      session.candidate.scene === undefined) { return undefined; }
    return { request: this.value.positionRequest,
      document: JSON.parse(JSON.stringify(session.candidate.scene)) as SceneDocument };
  }

  sceneSnapshot(kind: string): SceneSnapshot {
    const target = this.positionTarget();
    return this.sceneWorkbench.snapshot(target !== undefined && target.document.state.kind === kind ?
      target.document : this.sceneWorkbench.document(kind));
  }

  /** A receipt identifies the page generation and the exact coordinates the widget actually reported. */
  reportScenePosition(request: number, kind: string, documentId: string, revision: number,
    first: number, second: number, ok: boolean): void {
    const target = this.positionTarget();
    const session = this.session;
    if (target === undefined || session === undefined || request !== target.request ||
      target.document.state.kind !== kind || target.document.documentId !== documentId ||
      target.document.revision !== revision) {
      return;
    }
    const state = target.document.state;
    const matches: boolean = kind === 'note' ?
      first === state.note.selectionStart && second === state.note.selectionEnd :
      kind === 'reading' ? first === state.reading.chapter && second === state.reading.anchor :
        first === state.form.step;
    session.positionOk = ok && matches;
    this.value.businessPositionState = session.positionOk ? localize('ac_learningcontroller_331') : localize('ac_learningcontroller_332');
    if (session.positionOk) {
      this.advanceSession();
    } else {
      this.value.targetPage = 'pages/ProcessPage';
      this.value.positionRequest = ++this.positionSerial;
    }
    this.publish();
  }

  leaveBusinessPage(request: number): void {
    const session = this.session;
    const target = this.positionTarget();
    if (session === undefined || target === undefined || target.request !== request) { return; }
    session.positionOk = false;
    this.value.positionRequest = ++this.positionSerial;
    this.value.targetPage = 'pages/ProcessPage';
    this.value.businessPositionState = localize('ac_learningcontroller_333');
    this.advanceSession();
    this.publish();
  }

  retryBusinessPosition(): void {
    const session = this.session;
    if (session === undefined || !session.active || session.candidate === undefined ||
      session.candidate.scene === undefined) {
      return;
    }
    session.positionOk = false;
    session.waitingPhase = '';
    this.value.positionRequest = ++this.positionSerial;
    this.value.targetPage = this.scenePage(session.candidate.scene.state.kind);
    this.value.businessPositionState = localize('ac_learningcontroller_334');
    this.advanceSession();
    this.publish();
  }

  buildContinuation(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
    if (this.disposed) {
      return AbilityConstant.OnContinueResult.REJECT;
    }
    if (this.activeBusiness !== 'text') {
      const record = this.startRecord('CONTINUE', localize('ac_learningcontroller_335'), localize('ac_learningcontroller_336'));
      if (this.session !== undefined && this.session.active) {
        this.finish(record, localize('ac_learningcontroller_337'), 'WARN', localize('ac_learningcontroller_338')); this.publish();
        return AbilityConstant.OnContinueResult.REJECT;
      }
      try {
        const raw = this.sceneWorkbench.payloadOf(this.activeBusiness);
        wantParam[SCENE_PAYLOAD_KEY] = raw;
        wantParam[TEXT_PAYLOAD_KEY] = '';
        wantParam[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY] = false;
        record.facts.push(localize('ac_learningcontroller_339', [this.activeBusiness, raw.length]));
        this.finish(record, localize('ac_learningcontroller_340'), 'INFO', localize('ac_learningcontroller_341')); this.publish();
        return AbilityConstant.OnContinueResult.AGREE;
      } catch (error) {
        this.finish(record, localize('ac_learningcontroller_342'), 'ERROR', localize('ac_learningcontroller_343')); this.publish();
        return AbilityConstant.OnContinueResult.REJECT;
      }
    }
    const record = this.startRecord('CONTINUE', localize('ac_learningcontroller_344'), localize('ac_learningcontroller_345'));
    if ((this.session !== undefined && this.session.active) || !validUnicode(this.value.text) ||
      this.value.text.length > MAX_TEXT_LENGTH ||
      !selectionBoundary(this.value.text, this.value.selectionStart) ||
      !selectionBoundary(this.value.text, this.value.selectionEnd) ||
      this.value.selectionStart > this.value.selectionEnd) {
      this.finish(record, localize('ac_learningcontroller_346'), 'ERROR', localize('ac_learningcontroller_343'));
      this.publish();
      return AbilityConstant.OnContinueResult.REJECT;
    }
    const payload = this.localPayload();
    payload.transferId = `t-${this.dependencies.clock.now()}-${++this.serial}-${Math.floor(Math.random() * 1000000)}`;
    try {
      wantParam[TEXT_PAYLOAD_KEY] = JSON.stringify(payload);
      wantParam[SCENE_PAYLOAD_KEY] = '';
      wantParam[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY] = false;
      record.facts.push(localize('ac_learningcontroller_348', [payload.text.length]),
        localize('ac_learningcontroller_349'));
      record.limits.push(localize('ac_learningcontroller_350'));
      this.finish(record, localize('ac_learningcontroller_351'), 'INFO', localize('ac_learningcontroller_341'));
      this.publish();
      return AbilityConstant.OnContinueResult.AGREE;
    } catch (error) {
      record.errorCode = safeErrorCode(error as Object);
      record.rawMessage = localize('ac_learningcontroller_353');
      this.finish(record, localize('ac_learningcontroller_354'), 'ERROR', localize('ac_learningcontroller_355'));
      this.publish();
      return AbilityConstant.OnContinueResult.REJECT;
    }
  }

  markWindowReady(): void {
    if (this.disposed) {
      return;
    }
    this.value.windowState = localize('ac_learningcontroller_270');
    const session = this.session;
    if (session !== undefined && session.active) {
      const record = this.findRecord(session.recordId);
      if (record !== undefined) {
        this.event(record, localize('ac_learningcontroller_357'), 'INFO', localize('ac_learningcontroller_358'));
      }
      this.advanceSession();
    }
    this.publish();
  }

  markWindowGone(): void {
    if (this.disposed) {
      return;
    }
    this.value.windowState = localize('ac_learningcontroller_359');
    const session = this.session;
    if (session !== undefined && session.active && session.candidate !== undefined &&
      session.candidate.scene !== undefined) {
      session.positionOk = false;
      this.value.positionRequest = ++this.positionSerial;
      this.value.businessPositionState = localize('ac_learningcontroller_360');
    }
    this.advanceSession();
    this.publish();
  }

  reportPageFailure(_message: string): void {
    if (this.disposed) {
      return;
    }
    // 页面加载错误使用固定诊断文案。
    this.value.windowState = localize('ac_learningcontroller_361');
    this.failSession(localize('ac_learningcontroller_362'), localize('ac_learningcontroller_363'));
    this.value.notice = localize('ac_learningcontroller_364');
    this.publish();
  }

  stopLocalWait(): void {
    if (this.disposed) {
      return;
    }
    const active: boolean = this.session !== undefined && this.session.active;
    if (active) {
      this.failSession(localize('ac_learningcontroller_365'), localize('ac_learningcontroller_366'));
    }
    if (this.probeRecordId.length > 0) {
      const record = this.findRecord(this.probeRecordId);
      if (record !== undefined) {
        this.finish(record, localize('ac_learningcontroller_367'), 'WARN', localize('ac_learningcontroller_366'));
      }
      this.probeRecordId = '';
      this.clearProbeTimer();
      this.beginOff();
    }
    this.value.notice = this.client.state().offPending ?
      localize('ac_learningcontroller_369') :
      localize('ac_learningcontroller_370');
    this.publish();
  }

  clearRecords(): void {
    if (this.disposed) {
      return;
    }
    // 删除已完成记录与事件，保留在途操作记录及其回调归属。
    const retained: OperationRecord[] = [];
    this.value.records.forEach((record: OperationRecord): void => {
      if (record.endedAt.length === 0 || record.id === this.offRecordId || record.id === this.permissionRecordId) {
        retained.push(record);
      } else {
        this.started.delete(record.id);
      }
    });
    this.value.records = retained;
    this.value.events = [];
    retained.forEach((record: OperationRecord): void => {
      record.events = [];
    });
    this.value.notice = retained.length > 0 ?
      localize('ac_learningcontroller_371') :
      localize('ac_learningcontroller_372');
    this.publish();
  }

  private clearSessionTimer(): void {
    if (this.sessionTimer >= 0) {
      this.dependencies.clock.clearTimeout(this.sessionTimer);
      this.sessionTimer = -1;
    }
  }

  private clearProbeTimer(): void {
    if (this.probeTimer >= 0) {
      this.dependencies.clock.clearTimeout(this.probeTimer);
      this.probeTimer = -1;
    }
  }

  dispose(): void {
    if (this.disposed) {
      return;
    }
    this.clearSessionTimer();
    this.clearProbeTimer();
    if (this.session !== undefined && this.session.active) {
      this.session.active = false;
    }
    this.conflictCandidate = undefined;
    this.value.conflictPending = false;
    this.value.conflictSummary = '';
    this.listenerOwner = '';
    this.client.dispose();
    this.backupClipboard.dispose();
    this.sceneWorkbench.dispose();
    this.disposed = true;
    this.listeners.clear();
    this.refreshFlags();
  }
}
