/** 独立、Ability-scoped 的单文本接续学习运行时。 */
import { AbilityConstant, common, Want, wantConstant } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { LearningDependencies, LearningStore, platformLearningDependencies } from './LearningPorts';
import {
  DiagnosticEvent, emptyLearningSnapshot, EnvironmentItem, LearningListener, LearningSnapshot,
  MAX_TEXT_LENGTH, OperationRecord, TEXT_PAYLOAD_KEY
} from './LearningTypes';
import { ContinueClient, ContinueObservation, redactPlatformText, safeErrorCode, safeErrorMessage } from './ContinueClient';
import { decodeScene, emptyScene, encodeScene, SCENE_PAYLOAD_KEY, SceneDocument } from './scene/SceneModel';
import { PreferencesSceneStore, SceneSnapshot, SceneStorePort, SceneWorkbench } from './scene/SceneWorkbench';
import { SceneBackupCode, SceneBackupExport, SceneBackupPreview, SceneBackupRestoreResult } from './scene/SceneWorkspaceBackupModel';
import { SceneBackupClipboard, SceneBackupCopyCode, SceneBackupCopyResult } from './scene/SceneBackupClipboard';

const STORE_KEY: string = 'single_text_document';
const PHASE_LIMIT_MS: number = 15000;
const PROBE_LIMIT_MS: number = 15000;
const MAX_RECORDS: number = 40;
const MAX_EVENTS: number = 120;
const MAX_RECORD_EVENTS: number = 24;
const MAX_JSON_LENGTH: number = 26000;
const MAX_REVISION: number = 1000000000;

interface CommitPlan {
  payload: TextPayload;
  documentId: string;
  revision: number;
}

interface TextPayload {
  version: number;
  transferId: string;
  page: string;
  text: string;
  selectionStart: number;
  selectionEnd: number;
  documentId: string;
  revision: number;
  scene?: SceneDocument;
}

/** Concrete adapter avoids ArkTS structural class typing and retains existing injected store fixtures. */
class SceneLearningStoreAdapter implements SceneStorePort {
  private readonly store: LearningStore | undefined;
  constructor(store: LearningStore | undefined) { this.store = store; }
  getSync(key: string, fallback: string): Object {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    return this.store.getSync(key, fallback);
  }
  putSync(key: string, value: string): void {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    this.store.putSync(key, value);
  }
  deleteSync(key: string): void {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    this.store.deleteSync(key);
  }
  flushSync(): void {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    this.store.flushSync();
  }
}

export interface ScenePositionTarget {
  request: number;
  document: SceneDocument;
}

interface PayloadRead {
  value: TextPayload | undefined;
  reason: string;
}

interface WriteOutcome {
  ok: boolean;
  code: string;
  detail: string;
}

interface RestoreSession {
  generation: number;
  recordId: string;
  quickRequired: boolean;
  quickSeen: boolean;
  quickOk: boolean;
  candidate: TextPayload | undefined;
  active: boolean;
  waitingPhase: string;
  positionOk: boolean;
}

function copyRecord(value: OperationRecord): OperationRecord {
  return JSON.parse(JSON.stringify(value)) as OperationRecord;
}

function copyEnvironment(values: EnvironmentItem[]): EnvironmentItem[] {
  return JSON.parse(JSON.stringify(values)) as EnvironmentItem[];
}

function validUnicode(text: string): boolean {
  for (let i: number = 0; i < text.length; i++) {
    const code: number = text.charCodeAt(i);
    if (code >= 0xD800 && code <= 0xDBFF) {
      if (i + 1 >= text.length) {
        return false;
      }
      const next: number = text.charCodeAt(++i);
      if (next < 0xDC00 || next > 0xDFFF) {
        return false;
      }
    } else if (code >= 0xDC00 && code <= 0xDFFF) {
      return false;
    }
  }
  return true;
}

function selectionBoundary(text: string, offset: number): boolean {
  if (!Number.isInteger(offset) || offset < 0 || offset > text.length) {
    return false;
  }
  if (offset > 0 && offset < text.length) {
    const code: number = text.charCodeAt(offset);
    const previous: number = text.charCodeAt(offset - 1);
    if (code >= 0xDC00 && code <= 0xDFFF && previous >= 0xD800 && previous <= 0xDBFF) {
      return false;
    }
  }
  return true;
}

function decodePayload(raw: Object | undefined): PayloadRead {
  const rejected: PayloadRead = { value: undefined, reason: '接续载荷缺失或 JSON 字符串类型错误。' };
  if (typeof raw !== 'string') {
    return rejected;
  }
  const serialized: string = raw as string;
  if (serialized.length === 0 || serialized.length > MAX_JSON_LENGTH) {
    rejected.reason = '载荷序列化长度超出应用策略边界。';
    return rejected;
  }
  let parsed: Object | null = null;
  try {
    parsed = JSON.parse(serialized) as Object;
  } catch (error) {
    rejected.reason = '载荷 JSON 解析失败。';
    return rejected;
  }
  if (parsed === null || typeof parsed !== 'object' || Array.isArray(parsed)) {
    rejected.reason = '载荷根节点必须为对象。';
    return rejected;
  }
  const bag = parsed as Record<string, Object>;
  const version = bag['version'];
  const tag = bag['transferId'];
  const page = bag['page'];
  const text = bag['text'];
  const start = bag['selectionStart'];
  const end = bag['selectionEnd'];
  if ((version !== 1 && version !== 2) || page !== 'text' || typeof tag !== 'string'
    || !/^[A-Za-z0-9_-]{1,96}$/.test(tag as string)) {
    rejected.reason = '载荷版本、页面或接续标签不受支持。';
    return rejected;
  }
  if (typeof text !== 'string' || (text as string).length > MAX_TEXT_LENGTH || !validUnicode(text as string)) {
    rejected.reason = '正文必须不超过 4096 个 UTF-16 单元且具有合法代理对。';
    return rejected;
  }
  if (typeof start !== 'number' || typeof end !== 'number'
    || !selectionBoundary(text as string, start as number) || !selectionBoundary(text as string, end as number)
    || (start as number) > (end as number)) {
    rejected.reason = '选区须为正文内有序整数边界，并保持代理对完整。';
    return rejected;
  }
  const value: TextPayload = {
    version: version as number, transferId: tag as string, page: 'text', text: text as string,
    selectionStart: start as number, selectionEnd: end as number, documentId: '', revision: 0
  };
  if (version === 2) {
    const documentId = bag['documentId'];
    const revision = bag['revision'];
    if (typeof documentId !== 'string' || !/^[A-Za-z0-9_-]{1,64}$/.test(documentId as string) ||
      typeof revision !== 'number' || !Number.isInteger(revision as number) ||
      (revision as number) < 0 || (revision as number) > 1000000000) {
      rejected.reason = 'v2 载荷缺少合法的文档标识或修订号。';
      return rejected;
    }
    value.documentId = documentId as string;
    value.revision = revision as number;
  }
  const accepted: PayloadRead = { value: value, reason: '' };
  return accepted;
}

function hasPayload(value: Object | undefined): boolean {
  if (value === undefined) {
    return false;
  }
  return typeof value === 'string' && (value as string).length > 0;
}

function readContinuation(want: Want): PayloadRead {
  const parameters = want.parameters;
  if (parameters === undefined) { return decodePayload(undefined); }
  if (hasPayload(parameters[SCENE_PAYLOAD_KEY]) && hasPayload(parameters[TEXT_PAYLOAD_KEY])) {
    return { value: undefined, reason: '同一 Want 同时携带文本与业务命名空间，拒绝歧义候选。' };
  }
  if (!hasPayload(parameters[SCENE_PAYLOAD_KEY])) { return decodePayload(parameters[TEXT_PAYLOAD_KEY]); }
  const read = decodeScene(parameters[SCENE_PAYLOAD_KEY]);
  if (read.value === undefined) { return { value: undefined, reason: read.reason }; }
  const scene = read.value;
  return { value: { version: 2, transferId: scene.transferId, page: scene.state.kind,
    text: '', selectionStart: 0, selectionEnd: 0, documentId: scene.documentId, revision: scene.revision, scene: scene }, reason: '' };
}

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
  readonly sceneWorkbench: SceneWorkbench;
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
    let sceneStore: SceneStorePort = sceneStoreOverride === undefined ? new SceneLearningStoreAdapter(this.store) : sceneStoreOverride;
    if (sceneStoreOverride === undefined && dependencies === undefined && context !== undefined) {
      try { sceneStore = new PreferencesSceneStore(context); }
      catch (error) {
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
      this.value.listenerState = '正在注销，最多等待 8 秒';
    } else if (slot.listening) {
      this.value.listenerState = '已注册；等待真实系统事件';
    } else if (slot.offObservationExpired) {
      this.value.listenerState = '注销等待超时，可重新注册或注销';
    } else if (slot.nativeDirty) {
      this.value.listenerState = '监听未启用，可重新注册或注销';
    } else {
      this.value.listenerState = '未注册';
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
      id: id, operation: operation, purpose: purpose, title: title, result: '进行中', stage: '开始', level: 'INFO',
      startedAt: this.nowText(), endedAt: '', durationMillis: 0, errorCode: '', rawMessage: '', rawResultState: '',
      resultInfo: '', facts: [], explanation: [], limits: [], nextSteps: [],
      environment: copyEnvironment(this.value.environment), events: []
    };
    this.started.set(id, timestamp);
    this.value.records.unshift(record);
    this.trimRecords();
    this.event(record, '开始', 'INFO', title);
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
      seq: ++this.eventSerial, time: this.nowText(), operationId: record.id, phase: phase, level: level, message: message
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
      this.session.candidate.scene !== undefined)) { return message.length === 0 ? '' : '[业务场景平台消息已隐藏]'; }
    let safe: string = message;
    const texts: string[] = [this.value.text];
    if (this.session !== undefined && this.session.candidate !== undefined) {
      texts.push(this.session.candidate.text);
    }
    texts.forEach((text: string): void => {
      if (text.length > 0) {
        safe = safe.split(text).join('[正文已隐藏]');
        text.split('\n').forEach((line: string): void => {
          if (line.length >= 4) {
            safe = safe.split(line).join('[正文片段已隐藏]');
          }
        });
      }
    });
    return redactPlatformText(safe);
  }

  private describeError(record: OperationRecord): void {
    if (record.errorCode === '16300501') {
      record.explanation.push('16300501：相关系统服务（System Ability）工作异常；请排查权限、互信、网络与系统服务状态。');
    } else if (record.errorCode.length > 0) {
      record.explanation.push(`平台错误码 ${record.errorCode}；请结合当前事件阶段与环境信息排查。`);
    }
    record.limits.push('平台消息已脱敏，可在详情查看。');
    record.nextSteps.push('核对本次事件阶段、公开环境和系统接续入口。');
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
      return '接续接口学习：尚无操作记录。';
    }
    const lines: string[] = [
      '接续接口学习 · 脱敏诊断', `操作：${record.operation}｜${record.title}`,
      `结果：${record.result}`, `阶段：${record.stage}；级别：${record.level}`,
      `开始：${record.startedAt}；结束：${record.endedAt.length > 0 ? record.endedAt : '尚未结束'}`,
      `耗时：${record.durationMillis} ms`, `平台错误码：${record.errorCode.length > 0 ? record.errorCode : '无'}`,
      `原始数字状态：${record.rawResultState.length > 0 ? record.rawResultState : '未提供'}`,
      `事实：${record.facts.join('；')}`, `解释：${record.explanation.join('；')}`,
      `限制：${record.limits.join('；')}`, `建议：${record.nextSteps.join('；')}`,
      '本次事件：'
    ];
    record.events.forEach((event: DiagnosticEvent): void => {
      lines.push(`${event.time} [${event.level}] ${event.phase}`);
    });
    lines.push('环境采样时间：操作开始时；相关检查项：对端在线、互信与系统接续入口。');
    return lines.join('\n');
  }

  checkEnvironment(): void {
    if (this.disposed) {
      return;
    }
    const record = this.startRecord('ENVIRONMENT', '检查本机公开环境', '读取本机公共信息和本应用权限。');
    const items: EnvironmentItem[] = [];
    try {
      const publicInfo = this.dependencies.environment.readPublic();
      const api: EnvironmentItem = {
        key: 'api', label: '设备系统 API', value: `${publicInfo.apiVersion}`, status: '已读取',
        detail: '设备系统 API 属性读数；接续接口自 API 18 提供。'
      };
      const type: EnvironmentItem = {
        key: 'type', label: '设备类型', value: publicInfo.deviceType, status: '已读取', detail: '公开的设备类型。'
      };
      const os: EnvironmentItem = {
        key: 'os', label: '设备系统版本', value: publicInfo.osFullName, status: '已读取',
        detail: '公开的系统版本字符串。'
      };
      items.push(api, type, os);
    } catch (error) {
      const unavailable: EnvironmentItem = {
        key: 'public', label: '公共系统信息', value: '未知', status: '读取失败',
        detail: `公共信息读取失败，平台错误码 ${safeErrorCode(error as Object)}。`
      };
      items.push(unavailable);
    }
    try {
      const capable: boolean = this.dependencies.environment.supportsMission();
      const mission: EnvironmentItem = {
        key: 'syscap', label: 'Mission 系统能力', value: capable ? '声明支持' : '未声明支持',
        status: capable ? '已检查' : '受限', detail: 'canIUse 查询本机 Mission 系统能力声明。'
      };
      items.push(mission);
    } catch (error) {
      const mission: EnvironmentItem = {
        key: 'syscap', label: 'Mission 系统能力', value: '未知', status: '无法确认', detail: '公共能力查询失败。'
      };
      items.push(mission);
    }
    try {
      const granted: number = this.dependencies.environment.checkPermission();
      const permission: EnvironmentItem = {
        key: 'permission', label: '分布式数据同步权限', value: granted === 0 ? '已授权' : '未授权', status: '已检查',
        detail: '检查本应用分布式数据同步权限的授权状态。'
      };
      items.push(permission);
    } catch (error) {
      const permission: EnvironmentItem = {
        key: 'permission', label: '分布式数据同步权限', value: '未知', status: '无法确认', detail: '请按需由用户主动申请。'
      };
      items.push(permission);
    }
    const peer: EnvironmentItem = {
      key: 'peer', label: '对端在线 / 互信 / 系统接续入口', value: '未知', status: '未验证',
      detail: '请通过系统接续入口检查对端在线与互信状态。'
    };
    items.push(peer);
    this.value.environment = items;
    this.value.environmentCheckedAt = this.nowText();
    record.environment = copyEnvironment(items);
    record.facts.push('读取本机公共属性、Mission 能力声明和本应用授权状态。');
    record.limits.push('相关条件：对端在线、网络、账号/互信与系统接续入口。');
    record.nextSteps.push('打开系统接续入口，检查对端与互信状态后发起接续。');
    this.finish(record, '本机环境检查完成', 'INFO', '环境快照');
    this.publish();
  }

  requestPermission(): void {
    if (this.disposed) {
      return;
    }
    if (this.permissionRecordId.length > 0) {
      this.value.notice = '权限申请进行中，请等待结果。';
      this.publish();
      return;
    }
    const record = this.startRecord('PERMISSION', '用户主动申请权限', '响应用户点击，申请分布式数据同步权限。');
    this.permissionRecordId = record.id;
    record.facts.push('用户点击了权限申请。');
    try {
      this.dependencies.environment.requestPermission().then((result: number[]): void => {
        if (this.disposed || this.permissionRecordId !== record.id) {
          return;
        }
        this.permissionRecordId = '';
        const granted: boolean = result.length > 0 && result[0] === 0;
        record.facts.push(`权限接口异步返回；授权结果数字 ${result.length > 0 ? result[0] : '缺失'}。`);
        record.limits.push('后续检查项：对端互信、系统接续入口与接续结果。');
        this.finish(record, granted ? '权限已授权' : '权限未获授权或结果缺失', granted ? 'INFO' : 'WARN', '权限异步结果');
        this.value.notice = granted ? '权限已授权，可重新检查环境并在系统入口发起接续。' : '权限未获授权，请按系统说明在设置中处理。';
        this.publish();
      }).catch((error: BusinessError): void => {
        if (this.disposed || this.permissionRecordId !== record.id) {
          return;
        }
        this.permissionRecordId = '';
        record.errorCode = safeErrorCode(error);
        record.rawMessage = this.readableMessage(safeErrorMessage(error));
        this.describeError(record);
        this.finish(record, '权限申请异步失败', 'ERROR', '权限异步错误');
        this.publish();
      });
      this.event(record, '权限同步调用', 'INFO', '已提交申请，等待用户与平台异步结果。');
    } catch (error) {
      this.permissionRecordId = '';
      record.errorCode = safeErrorCode(error as Object);
      record.rawMessage = this.readableMessage(safeErrorMessage(error as Object));
      this.describeError(record);
      this.finish(record, '权限申请同步抛出异常', 'ERROR', '权限同步异常');
    }
    this.publish();
  }

  registerProbe(): void {
    if (this.disposed) {
      return;
    }
    if (!this.snapshot().canRegister) {
      this.value.notice = '正在监听、注销或接续，请先完成当前操作。';
      this.publish();
      return;
    }
    const record = this.startRecord('ON', '手动注册 prepareContinue 观察', '注册监听，观察系统 prepareContinue 事件。');
    this.probeRecordId = record.id;
    record.facts.push('手动注册后等待 prepareContinue 事件；接续由系统入口发起。');
    record.limits.push('观察期为 15 秒，记录收到的系统事件。');
    this.bindListener(`probe:${record.id}`, record);
    if (this.client.state().listening && this.probeRecordId === record.id) {
      this.probeTimer = this.dependencies.clock.setTimeout((): void => {
        this.probeTimer = -1;
        if (this.disposed || this.probeRecordId !== record.id) {
          return;
        }
        this.probeRecordId = '';
        this.finish(record, '未收到系统事件（应用 15 秒观察策略）', 'WARN', '观察期结束');
        record.explanation.push('观察期内未收到平台结果。');
        this.value.notice = '15 秒观察期内未收到系统事件；已结束本地等待并申请注销。';
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
    this.callEvent(record, 'ON 同步调用', call.accepted ? 'INFO' : 'ERROR', call.detail);
    if (!call.accepted && record.endedAt.length === 0) {
      record.errorCode = call.errorCode;
      record.rawMessage = call.rawMessage === undefined ? '本地槽策略阻止调用，无平台异常消息。'
        : this.readableMessage(call.rawMessage);
      this.describeError(record);
      if (owner.indexOf('probe:') === 0) {
        this.probeRecordId = '';
        this.finish(record, '未建立可用监听', 'ERROR', 'ON 同步失败');
        this.value.notice = '注册失败，可再次点击注册监听。';
      } else {
        this.failSession('快速结果监听建立失败，本轮恢复已结束。', 'ON 同步失败');
      }
    }
  }

  private handleQuickObservation(owner: string, record: OperationRecord, event: ContinueObservation): void {
    const current = this.session;
    if (owner.indexOf('probe:') === 0) {
      if (this.probeRecordId !== record.id) {
        return;
      }
    } else if (current === undefined || !current.active || current.quickSeen
      || owner !== `session:${current.generation}`) {
      return;
    }
    record.rawResultState = event.rawState;
    record.resultInfo = this.readableMessage(event.detail);
    record.errorCode = event.errorCode;
    if (event.kind === 'ERROR') {
      record.rawMessage = this.readableMessage(event.detail);
      this.describeError(record);
    }
    this.event(record, 'ON 异步通知', event.kind === 'SUCCESS' ? 'INFO' : event.kind === 'UNKNOWN' ? 'WARN' : 'ERROR',
      `收到真实通知，原始数字状态 ${event.rawState}；详细说明见已脱敏结果字段。`);
    if (owner.indexOf('probe:') === 0) {
      if (this.probeRecordId !== record.id) {
        return;
      }
      this.clearProbeTimer();
      this.probeRecordId = '';
      record.facts.push('本次通知归属手动探针观察。');
      this.finish(record, event.kind === 'SUCCESS' ? '收到成功状态通知'
        : event.kind === 'UNKNOWN' ? '收到未知状态，请查看原始数字状态' : '收到平台失败或异步错误通知',
        event.kind === 'SUCCESS' ? 'INFO' : event.kind === 'UNKNOWN' ? 'WARN' : 'ERROR', '探针通知完成');
      this.value.notice = '探针已收到系统事件，可在操作详情查看结果。';
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
    this.value.quickResult = event.kind === 'SUCCESS' ? '成功（原始状态 0）'
      : event.kind === 'UNKNOWN' ? `未知（原始状态 ${event.rawState}）`
      : event.kind === 'ERROR' ? `异步错误（错误码 ${event.errorCode}）` : `失败（原始状态 ${event.rawState}）`;
    if (!session.quickOk) {
      this.failSession(event.kind === 'UNKNOWN' ? '系统快速通知状态未知，本轮文本提交已停止。'
        : event.kind === 'ERROR' ? '获取快速结果发生异步错误；未提交文本。' : '系统报告快速启动失败；未提交文本。', '快速结果');
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
      this.value.notice = '接续进行中；如需结束，请点击停止本地等待并确认。';
      this.publish();
      return;
    }
    if (this.probeRecordId.length > 0) {
      const record = this.findRecord(this.probeRecordId);
      if (record !== undefined) {
        this.finish(record, '用户结束本地探针观察', 'WARN', '用户注销');
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
      this.value.notice = '正在等待注销回调，最多等待 8 秒。';
      return;
    }
    if (!slot.nativeDirty) {
      return;
    }
    const record = this.startRecord('OFF', '注销独立监听槽', '立刻停用本地 sink，并通过独立回调观察平台注销完成。');
    this.offRecordId = record.id;
    record.facts.push('第三参数为独立的注销完成回调。');
    record.limits.push('注销结果由独立完成回调返回。');
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
        this.finish(record, '注销等待超时（8 秒）', 'WARN', 'OFF 未确认');
        record.facts.push('未收到注销完成回调；已结束本次等待，恢复操作入口。');
        record.nextSteps.push('可重新注册或重试注销。');
        this.value.notice = event.detail;
      } else {
        const success: boolean = event.kind === 'SUCCESS';
        this.finish(record, success ? '平台已明确确认注销成功' : event.kind === 'UNKNOWN'
          ? '注销回调状态未知' : '注销失败或异步错误',
          success ? 'INFO' : event.kind === 'UNKNOWN' ? 'WARN' : 'ERROR', 'OFF 异步完成');
        record.facts.push(`独立完成回调原始数字状态 ${event.rawState}。`);
        if (!success) {
          record.nextSteps.push('可重新注册或重试注销。');
        }
        this.value.notice = success ? '注销成功，可重新注册。' : '注销结果异常，可重新注册或重试注销。';
      }
      this.offRecordId = '';
      this.tryBindWaitingSession();
      this.publish();
    });
    this.callEvent(record, 'OFF 同步调用', call.accepted ? 'INFO' : 'ERROR', call.detail);
    if (!call.accepted && record.endedAt.length === 0) {
      record.errorCode = call.errorCode;
      record.rawMessage = call.rawMessage === undefined ? '本地槽策略阻止调用，无平台异常消息。'
        : this.readableMessage(call.rawMessage);
      this.describeError(record);
      this.offRecordId = '';
      record.nextSteps.push('可重新注册或重试注销。');
      this.value.notice = '注销失败，可重新注册或重试注销。';
      this.finish(record, '注销同步失败或被槽策略阻止', 'ERROR', 'OFF 同步失败');
      this.tryBindWaitingSession();
    }
  }

  updateText(text: string): void {
    if (!this.value.canEdit || this.disposed) {
      return;
    }
    if (text.length > MAX_TEXT_LENGTH || !validUnicode(text)) {
      this.value.notice = '编辑校验失败：正文最多 4096 个 UTF-16 单元，代理对须保持完整。';
      this.publish();
      return;
    }
    this.value.text = text;
    this.value.selectionStart = text.length;
    this.value.selectionEnd = text.length;
    this.dirty = true;
    this.value.savedTextStatus = '本地有未保存编辑';
    this.publish();
  }

  updateSelection(start: number, end: number): void {
    if (!this.value.canEdit || this.disposed) {
      return;
    }
    if (!selectionBoundary(this.value.text, start) || !selectionBoundary(this.value.text, end) || start > end) {
      this.value.notice = '选区校验失败：请使用正文内有序整数边界，并保持代理对完整。';
      this.publish();
      return;
    }
    this.value.selectionStart = start;
    this.value.selectionEnd = end;
    this.dirty = true;
    this.value.savedTextStatus = '本地有未保存编辑';
    this.publish();
  }

  fillExample(): void {
    this.updateText('春日的早晨，阳光洒在窗边。\n这是一段用于文本接续的示例内容。🌱');
  }

  private localPayload(): TextPayload {
    const payload: TextPayload = {
      version: this.documentId.length > 0 ? 2 : 1, transferId: 'local', page: 'text', text: this.value.text,
      selectionStart: this.value.selectionStart, selectionEnd: this.value.selectionEnd,
      documentId: this.documentId, revision: this.localRevision
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
    const record = this.startRecord('SAVE', '保存当前文本', '写入本学习运行时独立的 Preferences。');
    if (this.localRevision >= MAX_REVISION) {
      record.errorCode = 'REVISION_LIMIT';
      record.facts.push('修订号已达上限，拒绝继续递增，未写入存储。');
      this.value.savedTextStatus = '修订号已达上限；未写入';
      this.value.notice = '文档修订号达到上限，请新建文档后再保存。';
      this.finish(record, '修订号上限阻止保存', 'ERROR', '修订边界');
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
      record.facts.push(`文档修订号 ${revision}；文档标识已建立。`);
      this.value.savedTextStatus = '已持久化到独立 Preferences';
      this.value.notice = '当前文本与选区已保存。';
    } else {
      this.value.savedTextStatus = '保存失败；当前编辑仍保留';
      this.value.notice = outcome.detail;
    }
    this.finish(record, outcome.ok ? '文本保存成功' : '文本保存失败', outcome.ok ? 'INFO' : 'ERROR', '持久化');
    this.publish();
  }

  /** 显式另存为新文档；保留编辑内容，成功前不重置旧身份或修订。 */
  newDocument(): void {
    if (this.disposed || !this.value.canEdit) {
      return;
    }
    const record = this.startRecord('NEW', '另存为新文档', '保留当前内容与选区，建立独立修订历史。');
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
      this.value.savedTextStatus = '已另存为新文档 r1';
    }
    this.value.notice = outcome.ok ? '新文档已保存；正文和选区保持不变。' : outcome.detail;
    this.finish(record, outcome.ok ? '新文档保存成功' : '新建失败；旧身份保留', outcome.ok ? 'INFO' : 'ERROR', '持久化');
    this.publish();
  }

  clearText(): void {
    if (this.disposed || !this.value.canEdit) {
      return;
    }
    const record = this.startRecord('SAVE', '清空并保存文本', '先持久化空文本，成功后才替换页面正文。');
    const hasDocument: boolean = this.documentId.length > 0;
    if (hasDocument && this.localRevision >= MAX_REVISION) {
      record.errorCode = 'REVISION_LIMIT';
      record.facts.push('修订号已达上限，拒绝清空写入。');
      this.value.savedTextStatus = '修订号已达上限；未清空';
      this.value.notice = '文档修订号达到上限，请新建文档后再清空。';
      this.finish(record, '修订号上限阻止清空', 'ERROR', '修订边界');
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
      this.value.savedTextStatus = '空文本已持久化';
    }
    this.finish(record, outcome.ok ? '已清空并保存' : '清空失败；保留原文', outcome.ok ? 'INFO' : 'ERROR', '持久化');
    this.value.notice = outcome.ok ? '文本与选区已清空并保存。' : outcome.detail;
    this.publish();
  }

  private openStore(): void {
    try {
      this.store = this.dependencies.openStore();
      const raw = this.store.getSync(STORE_KEY, '');
      if (typeof raw !== 'string') {
        this.value.savedTextStatus = '独立存储类型无效；未恢复正文';
        return;
      }
      if (raw.length === 0) {
        this.value.savedTextStatus = '独立存储尚无文本';
        return;
      }
      this.durableDocument = raw;
      const decoded = decodePayload(raw);
      if (decoded.value === undefined) {
        this.value.savedTextStatus = '独立存储内容无效；未恢复正文';
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
      this.value.savedTextStatus = '已读取本学习运行时的独立文本';
    } catch (error) {
      this.store = undefined;
      this.value.savedTextStatus = `独立 Preferences 不可用（错误码 ${safeErrorCode(error as Object)}）`;
    }
  }

  private persist(payload: TextPayload): WriteOutcome {
    const store = this.store;
    if (store === undefined || this.storageUncertain) {
      const unavailable: WriteOutcome = {
        ok: false, code: '', detail: this.storageUncertain
          ? '存储回滚未能确认；停止后续写入以保护原文。请结束本 Ability 后重新检查存储。'
          : '独立 Preferences 不可用；当前原文已保留。'
      };
      return unavailable;
    }
    const previous = this.durableDocument;
    const serialized: string = JSON.stringify(payload);
    try {
      store.putSync(STORE_KEY, serialized);
      store.flushSync();
      this.durableDocument = serialized;
      const ok: WriteOutcome = { ok: true, code: '', detail: '独立 Preferences 写入并同步 flush 返回成功。' };
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
        ok: false, code: safeErrorCode(error as Object), detail: rolledBack
          ? '持久化失败，已回滚存储；页面原文与选区已保留。'
          : '持久化失败且回滚未能确认；页面原文仍保留，后续写入已停止，磁盘状态未知。'
      };
      return failed;
    }
  }

  handleLaunch(want: Want, numericReason: number): void {
    if (this.disposed) {
      return;
    }
    this.value.launchReasonCode = numericReason;
    this.value.launchReason = numericReason === 10 ? '系统 PREPARE_CONTINUATION（10）'
      : numericReason === 3 ? '系统 CONTINUATION（3）' : `普通启动 / 其他原因（${numericReason}）`;
    if (numericReason !== 10 && numericReason !== 3) {
      this.value.notice = '';
      this.publish();
      return;
    }
    if (numericReason === 10) {
      if (this.session !== undefined && this.session.active) {
        const record = this.findRecord(this.session.recordId);
        if (record !== undefined) {
          this.event(record, '重复启动信号', 'WARN', '当前接续轮次进行中，重复 PREPARE 已忽略。');
        }
        this.publish();
        return;
      }
      this.terminalAwaitingData = false;
      this.startSession(true);
      const parameters = want.parameters;
      // 系统 PREPARE 启动：接收候选，并等待快速结果与页面就绪。
      if (parameters !== undefined && (hasPayload(parameters[TEXT_PAYLOAD_KEY]) || hasPayload(parameters[SCENE_PAYLOAD_KEY]))) {
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
      this.value.notice = '上一快速轮次已关闭，迟到数据已忽略；请通过新的系统 PREPARE 事件启动接续，或重新进入应用。';
      this.publish();
      return;
    }
    if (decoded.value !== undefined && this.completedTags.indexOf(decoded.value.transferId) >= 0) {
      this.value.notice = '已忽略结束轮次的重复接续标签。';
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
        this.finish(probe, '真实系统接续到达；结束手动观察并隔离旧监听', 'WARN', '让位真实接续');
      }
      this.probeRecordId = '';
      this.clearProbeTimer();
      this.beginOff();
    }
    const record = this.startRecord('RESTORE', quickRequired ? '系统快速接续恢复' : '系统普通接续恢复',
      '根据系统 launchReason 建轮；有效候选先持久化，再一次提交正文与选区。');
    record.facts.push(quickRequired ? '系统启动原因 PREPARE_CONTINUATION（10）。' : '系统启动原因 CONTINUATION（3）。');
    record.limits.push('各阶段应用等待上限：15 秒。',
      '通知按本地监听代次归属，业务候选按接续标签去重。');
    const session: RestoreSession = {
      generation: ++this.sessionGeneration, recordId: record.id, quickRequired: quickRequired,
      quickSeen: false, quickOk: !quickRequired, candidate: undefined, active: true, waitingPhase: '', positionOk: false
    };
    this.session = session;
    this.sceneWorkbench.setLocked(true);
    this.value.targetPage = 'pages/ProcessPage';
    this.value.positionRequest = ++this.positionSerial;
    this.value.businessPositionState = '等待业务候选；窗口容器与业务定位分别确认';
    this.value.sessionRecordId = record.id;
    this.value.quickStartRequired = quickRequired;
    this.value.quickResult = quickRequired ? '等待真实系统快速结果' : '普通 CONTINUATION：等待业务数据与页面';
    this.value.dataState = '等待有效业务载荷';
    this.value.committed = false;
    this.value.restoredSummary = '';
    this.value.sessionState = quickRequired ? '快速接续：独立等待结果 / 数据 / 页面' : '普通接续：等待数据与页面';
    this.value.notice = '接续处理中。';
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
      this.value.quickResult = '等待上一轮监听操作结束';
      this.event(record, '等待监听槽', 'WARN', '上一轮监听操作进行中，结束后注册本轮监听。');
      return;
    }
    this.value.quickResult = '等待真实系统快速结果';
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
      this.value.dataState = '载荷校验失败';
      record.facts.push(decoded.reason);
      this.failSession(decoded.reason, '候选校验失败');
      return;
    }
    const candidate = decoded.value;
    if (this.completedTags.indexOf(candidate.transferId) >= 0) {
      this.failSession('已结束轮次的重复接续标签已拒收。', '重复标签');
      return;
    }
    if (session.candidate !== undefined) {
      if (JSON.stringify(session.candidate) === JSON.stringify(candidate)) {
        this.event(record, '重复数据', 'INFO', '已忽略重复候选，继续当前阶段等待。');
        return;
      }
      this.failSession('同轮收到冲突的业务候选；已拒收候选并保留原文。', '候选冲突');
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
      this.value.businessPositionState = '业务候选待定位：需实际选区/段落/步骤回执';
      if (this.dirty || reason.length > 0) {
        this.enterConflict(candidate, 'document', this.dirty ? '原文本有未保存内容；切换业务前需明确选择。' : reason);
      } else {
        this.value.dataState = '业务候选完整校验通过；等待系统信号及实际定位';
      }
      this.event(record, '业务候选校验', 'INFO', `业务类型 ${candidate.scene.state.kind}；身份与状态已完整校验。`);
      return;
    }
    if (this.sceneWorkbench.hasDirtyWork()) {
      this.enterConflict(candidate, 'document', '本机业务页有未保存状态；切回原文本前需明确选择。');
      return;
    }
    const sameDocument: boolean = candidate.documentId.length === 0 || this.documentId.length === 0 ||
      candidate.documentId === this.documentId;
    const divergent: boolean = candidate.text !== this.value.text ||
      candidate.selectionStart !== this.value.selectionStart ||
      candidate.selectionEnd !== this.value.selectionEnd;
    if (this.dirty && (!sameDocument || divergent)) {
      this.enterConflict(candidate, !sameDocument ? 'document' : 'revision',
        `本机存在未保存编辑；接续 r${candidate.revision}、本机 r${this.localRevision}。` +
        '无论对端修订更高或使用旧 v1，均须明确选择；尚未覆盖。');
      this.event(record, '文档切换冲突', 'WARN', this.value.conflictSummary);
      return;
    }
    if (sameDocument && candidate.documentId.length > 0 && candidate.revision <= this.localRevision && divergent) {
      this.enterConflict(candidate, 'revision',
        `接续版本 r${candidate.revision}，本机 r${this.localRevision}；` +
        '同一文档修订较旧或同号不同内容，未覆盖本机正文。');
      this.event(record, '版本冲突', 'WARN', this.value.conflictSummary);
      return;
    }
    if (!sameDocument) {
      this.event(record, '文档切换', 'INFO',
        `接续文档 ${candidate.documentId} 将替换本机文档 ${this.documentId}；修订号按接续值重置。`);
    }
    // 数据可能晚于通知到达；已识别正文后再次消除旧详情中的同文本。
    this.value.records.forEach((item: OperationRecord): void => {
      item.rawMessage = this.readableMessage(item.rawMessage);
      item.resultInfo = this.readableMessage(item.resultInfo);
    });
    this.value.dataState = '完整候选已校验；尚未提交';
    record.facts.push(`正文/选区/版本/页面完整校验通过；正文长度 ${candidate.text.length} 个 UTF-16 单元。`);
    this.event(record, '候选校验', 'INFO', '完整候选校验通过，等待其余信号。');
  }

  private enterConflict(candidate: TextPayload, kind: string, summary: string): void {
    this.conflictCandidate = candidate;
    this.conflictAccepted = false;
    this.value.conflictPending = true;
    this.value.conflictAccepted = false;
    this.value.conflictKind = kind;
    this.value.conflictSummary = summary;
    this.value.dataState = '候选校验通过，等待冲突选择';
    this.value.notice = '检测到' + (kind === 'document' ? '文档切换冲突' : '版本冲突') +
      '，请选择接受接续内容或保留本机版本。';
  }

  private advanceSession(): void {
    const session = this.session;
    if (session === undefined || !session.active) {
      return;
    }
    let phase: string = '';
    if (session.quickRequired && !session.quickSeen) {
      phase = '快速结果';
    } else if (session.candidate === undefined) {
      phase = '业务数据';
    } else if (this.value.windowState !== '页面已就绪') {
      phase = '页面窗口';
    } else if (session.candidate.scene !== undefined && !session.positionOk) {
      phase = '业务定位';
    }
    const record = this.findRecord(session.recordId);
    if (record === undefined) {
      return;
    }
    if (phase.length > 0) {
      this.value.sessionState = `等待${phase}（应用本阶段 15 秒策略）`;
      if (session.waitingPhase !== phase) {
        this.clearSessionTimer();
        session.waitingPhase = phase;
        this.event(record, `等待${phase}`, 'INFO', '本阶段应用等待上限 15 秒，到期结束本地等待。');
        const generation: number = session.generation;
        this.sessionTimer = this.dependencies.clock.setTimeout((): void => {
          this.sessionTimer = -1;
          const current = this.session;
          if (this.disposed || current === undefined || !current.active || current.generation !== generation
            || current.waitingPhase !== phase) {
            return;
          }
          const missing: string = phase === '快速结果' ? '未收到可用的系统快速结果通知'
            : phase === '业务数据' ? '未收到完整有效的业务载荷' : phase === '业务定位' ? '未收到实际业务选区/段落/步骤定位回执' :
              '未收到显式页面加载成功信号';
          this.failSession(`${missing}；本阶段 15 秒等待已到期，本地恢复已结束。`, `${phase}超时`);
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
        this.value.sessionState = '版本冲突：等待用户选择';
        return;
      }
      const accepted = this.acceptedConflictCandidate();
      if (accepted === undefined) {
        this.failSession('冲突接受后的修订号将超过上限，未写入存储。', '修订上限');
        return;
      }
      this.event(record, '冲突提交', 'INFO',
        `快速结果与页面均已就绪，按 r${accepted.revision} 持久化用户选择的接续版本。`);
      this.commitCandidate(record, session, accepted);
      return;
    }
    this.clearSessionTimer();
    this.event(record, '持久化', 'INFO', '所有必要信号就绪；先持久化候选，成功前保持页面原文。');
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
      version: 2, transferId: candidate.transferId, page: 'text', text: candidate.text,
      selectionStart: candidate.selectionStart, selectionEnd: candidate.selectionEnd,
      documentId: candidate.documentId, revision: base + 1
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
      version: 2, transferId: candidate.transferId, page: 'text', text: candidate.text,
      selectionStart: candidate.selectionStart, selectionEnd: candidate.selectionEnd,
      documentId: candidate.documentId, revision: revision
    };
    return { payload: payload, documentId: candidate.documentId, revision: revision };
  }

  private commitCandidate(record: OperationRecord, session: RestoreSession, candidate: TextPayload): boolean {
    if (candidate.scene !== undefined) {
      if (!this.sceneWorkbench.commitIncoming(candidate.scene, this.conflictAccepted)) {
        this.failSession(this.sceneWorkbench.snapshot().error, '场景持久化失败');
        return false;
      }
      this.activeBusiness = candidate.scene.state.kind;
      const restored = this.sceneWorkbench.document(this.activeBusiness);
      this.value.scene = restored.state;
      this.value.documentId = restored.documentId;
      this.value.revision = restored.revision;
      this.value.committed = true;
      this.value.dataState = '业务状态已原子持久化并提交';
      this.value.sessionState = '本轮已提交（业务定位回执与所有系统信号齐备）';
      this.value.restoredSummary = `${this.activeBusiness} r${restored.revision}；实际定位已确认；未传输文件。`;
      this.value.notice = '业务状态恢复完成，可继续操作并再次从系统入口接续。';
      this.commitConflictTag();
      session.active = false;
      this.sceneWorkbench.setLocked(false);
      this.terminalAwaitingData = false;
      this.rememberTag(candidate.transferId);
      this.finish(record, '业务场景恢复成功', 'INFO', '已提交');
      if (session.quickRequired) { this.beginOff(); }
      return true;
    }
    const plan = this.planCommit(candidate);
    if (plan === undefined) {
      this.failSession('候选修订号超过上限，未写入存储，原文保留。', '修订上限');
      return false;
    }
    const outcome = this.persist(plan.payload);
    record.errorCode = outcome.code;
    record.facts.push(outcome.detail);
    if (!outcome.ok) {
      this.value.savedTextStatus = '恢复持久化失败；原文保留';
      this.failSession(outcome.detail, '持久化失败');
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
    this.value.savedTextStatus = '接续文本已持久化';
    this.value.dataState = '业务数据已提交';
    this.value.committed = true;
    this.value.restoredSummary = `已恢复文本及选区；文档 ${plan.documentId.length > 0 ? plan.documentId : '旧版无标识'} ` +
      `r${plan.revision}；正文 ${plan.payload.text.length} 个 UTF-16 单元，选区 ${plan.payload.selectionStart}–${plan.payload.selectionEnd}。`;
    this.value.sessionState = '本轮已提交（本地业务恢复成功）';
    this.value.notice = '文本与选区恢复完成，数据已保存。';
    session.active = false;
    this.sceneWorkbench.setLocked(false);
    this.terminalAwaitingData = false;
    this.rememberTag(plan.payload.transferId);
    record.facts.push('页面已显式加载，所有本轮必要信号齐备，持久化成功后一次提交。');
    this.finish(record, '本地业务恢复成功', 'INFO', '已提交');
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
    this.value.sessionState = '已确认接受；等待快速结果与页面就绪';
    this.value.notice = '已记录冲突选择；所有必要信号就绪后才会写入存储。';
    const record = this.findRecord(session.recordId);
    if (record !== undefined) {
      this.event(record, '冲突选择', 'INFO', '用户接受接续版本；提交仍需快速结果与页面就绪。');
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
    this.value.sessionState = '已保留本机版本';
    this.value.notice = '已保留本机正文；接续版本未写入。';
    this.value.savedTextStatus = '本机版本保留';
    this.commitConflictTag();
    session.active = false;
    this.sceneWorkbench.setLocked(false);
    this.terminalAwaitingData = false;
    if (record !== undefined) {
      this.finish(record, '用户选择保留本机版本', 'WARN', '版本冲突');
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
    this.value.sessionState = `本地恢复结束：${stage}`;
    this.value.committed = false;
    this.value.notice = message;
    const record = this.findRecord(session.recordId);
    if (record !== undefined) {
      record.explanation.push(message);
      record.limits.push('本轮本地等待已结束，当前原文保留。');
      record.nextSteps.push('保留当前原文；解决对应结果、数据、页面或存储问题后，从新的真实系统流程重试。');
      this.finish(record, message, stage.indexOf('用户') >= 0 ? 'WARN' : 'ERROR', stage);
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
      const blocked = new SceneBackupExport(); blocked.message = '系统接续在途或运行时已释放，暂不能生成本地备份。';
      return blocked;
    }
    return this.sceneWorkbench.backupSnapshot();
  }

  previewSceneBackup(raw: string, scope?: string[]): SceneBackupPreview {
    if (!this.localBackupAvailable()) {
      this.sceneWorkbench.cancelBackupPreview();
      const blocked = new SceneBackupPreview(); blocked.code = SceneBackupCode.BLOCKED;
      blocked.message = '系统接续在途或运行时已释放，暂不能预览本地恢复。';
      return blocked;
    }
    return this.sceneWorkbench.previewBackup(raw, scope);
  }

  cancelSceneBackupPreview(): void { this.sceneWorkbench.cancelBackupPreview(); }
  isSceneBackupCurrent(epoch: number): boolean { return this.localBackupAvailable() && this.sceneWorkbench.isBackupCurrent(epoch); }

  restoreSceneBackup(token: string, confirmDirty: boolean, scope?: string[]): SceneBackupRestoreResult {
    if (!this.localBackupAvailable()) {
      this.sceneWorkbench.cancelBackupPreview();
      return new SceneBackupRestoreResult(SceneBackupCode.BLOCKED, '系统接续在途或运行时已释放，未执行本地恢复。');
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
      return new SceneBackupCopyResult(SceneBackupCopyCode.BLOCKED, '备份已过期或当前不能复制，请重新生成业务备份。');
    }
    const result = await this.backupClipboard.copy(exported.raw);
    if (result.copied && !this.disposed && !this.isSceneBackupCurrent(exported.epoch)) {
      result.message = '已复制生成时的业务备份；当前工作区已有变化，如需最新副本请重新生成。';
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
    if (target === undefined || session === undefined || request !== target.request || target.document.state.kind !== kind ||
      target.document.documentId !== documentId || target.document.revision !== revision) { return; }
    const state = target.document.state;
    const matches: boolean = kind === 'note' ? first === state.note.selectionStart && second === state.note.selectionEnd :
      kind === 'reading' ? first === state.reading.chapter && second === state.reading.anchor : first === state.form.step;
    session.positionOk = ok && matches;
    this.value.businessPositionState = session.positionOk ? '业务定位已获实际页面回执' : '业务定位失败，候选未提交；可重试定位或停止';
    if (session.positionOk) { this.advanceSession(); }
    else {
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
    this.value.businessPositionState = '业务页已离开；候选未提交，可重试定位或取消';
    this.advanceSession();
    this.publish();
  }

  retryBusinessPosition(): void {
    const session = this.session;
    if (session === undefined || !session.active || session.candidate === undefined || session.candidate.scene === undefined) { return; }
    session.positionOk = false;
    session.waitingPhase = '';
    this.value.positionRequest = ++this.positionSerial;
    this.value.targetPage = this.scenePage(session.candidate.scene.state.kind);
    this.value.businessPositionState = '重新等待实际业务页定位回执';
    this.advanceSession();
    this.publish();
  }

  buildContinuation(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
    if (this.disposed) {
      return AbilityConstant.OnContinueResult.REJECT;
    }
    if (this.activeBusiness !== 'text') {
      const record = this.startRecord('CONTINUE', '源端提供活动业务状态', '发送真实笔记、阅读或表单草稿；不声称迁移文件。');
      if (this.session !== undefined && this.session.active) {
        this.finish(record, '恢复在途，拒绝发起新接续', 'WARN', '源端门控'); this.publish();
        return AbilityConstant.OnContinueResult.REJECT;
      }
      try {
        const raw = this.sceneWorkbench.payloadOf(this.activeBusiness);
        wantParam[SCENE_PAYLOAD_KEY] = raw;
        wantParam[TEXT_PAYLOAD_KEY] = '';
        wantParam[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY] = false;
        record.facts.push(`活动业务 ${this.activeBusiness}；独立schema校验通过；序列化长度 ${raw.length}。`);
        this.finish(record, '已提供活动业务载荷', 'INFO', '源端参数完成'); this.publish();
        return AbilityConstant.OnContinueResult.AGREE;
      } catch (error) {
        this.finish(record, '业务序列化或参数写入失败，拒绝接续', 'ERROR', '源端校验'); this.publish();
        return AbilityConstant.OnContinueResult.REJECT;
      }
    }
    const record = this.startRecord('CONTINUE', '源端提供独立文本载荷', '向系统 Want 写入新版本文本载荷与显式页面恢复策略。');
    if ((this.session !== undefined && this.session.active) || !validUnicode(this.value.text)
      || this.value.text.length > MAX_TEXT_LENGTH
      || !selectionBoundary(this.value.text, this.value.selectionStart)
      || !selectionBoundary(this.value.text, this.value.selectionEnd)
      || this.value.selectionStart > this.value.selectionEnd) {
      this.finish(record, '拒绝：本地恢复在途或正文/选区不合法', 'ERROR', '源端校验');
      this.publish();
      return AbilityConstant.OnContinueResult.REJECT;
    }
    const payload = this.localPayload();
    payload.transferId = `t-${this.dependencies.clock.now()}-${++this.serial}-${Math.floor(Math.random() * 1000000)}`;
    try {
      wantParam[TEXT_PAYLOAD_KEY] = JSON.stringify(payload);
      wantParam[SCENE_PAYLOAD_KEY] = '';
      wantParam[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY] = false;
      record.facts.push(`已写入版本化独立文本载荷；正文长度 ${payload.text.length} 个 UTF-16 单元。`,
        'SUPPORT_CONTINUE_PAGE_STACK_KEY=false；目标端由入口显式加载固定页面。');
      record.limits.push('源端返回 AGREE；后续进度由目标端记录。');
      this.finish(record, '已提供参数并同意系统接续', 'INFO', '源端参数完成');
      this.publish();
      return AbilityConstant.OnContinueResult.AGREE;
    } catch (error) {
      record.errorCode = safeErrorCode(error as Object);
      record.rawMessage = '源端参数写入错误消息已脱敏。';
      this.finish(record, '参数写入失败；拒绝接续', 'ERROR', '源端同步错误');
      this.publish();
      return AbilityConstant.OnContinueResult.REJECT;
    }
  }

  markWindowReady(): void {
    if (this.disposed) {
      return;
    }
    this.value.windowState = '页面已就绪';
    const session = this.session;
    if (session !== undefined && session.active) {
      const record = this.findRecord(session.recordId);
      if (record !== undefined) {
        this.event(record, '页面就绪', 'INFO', '显式页面加载完成信号已收到。');
      }
      this.advanceSession();
    }
    this.publish();
  }

  markWindowGone(): void {
    if (this.disposed) {
      return;
    }
    this.value.windowState = '页面未就绪 / 已离开';
    const session = this.session;
    if (session !== undefined && session.active && session.candidate !== undefined && session.candidate.scene !== undefined) {
      session.positionOk = false;
      this.value.positionRequest = ++this.positionSerial;
      this.value.businessPositionState = '新窗口代次，等待新的实际定位回执';
    }
    this.advanceSession();
    this.publish();
  }

  reportPageFailure(_message: string): void {
    if (this.disposed) {
      return;
    }
    // 页面加载错误使用固定诊断文案。
    this.value.windowState = '显式页面加载失败';
    this.failSession('页面加载失败，原文已保留。', '页面加载失败');
    this.value.notice = '页面加载失败，请返回重试。';
    this.publish();
  }

  stopLocalWait(): void {
    if (this.disposed) {
      return;
    }
    const active: boolean = this.session !== undefined && this.session.active;
    if (active) {
      this.failSession('用户已停止本地等待，当前原文保留。', '用户停止');
    }
    if (this.probeRecordId.length > 0) {
      const record = this.findRecord(this.probeRecordId);
      if (record !== undefined) {
        this.finish(record, '用户已停止本地观察', 'WARN', '用户停止');
      }
      this.probeRecordId = '';
      this.clearProbeTimer();
      this.beginOff();
    }
    this.value.notice = this.client.state().offPending
      ? '本地等待已停止，正在注销监听，最多等待 8 秒。'
      : '本地等待已停止，可重新注册或注销。';
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
    this.value.notice = retained.length > 0
      ? '已清除已完成记录与事件，保留在途操作记录以接收后续回调。'
      : '已清除记录与事件。';
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
