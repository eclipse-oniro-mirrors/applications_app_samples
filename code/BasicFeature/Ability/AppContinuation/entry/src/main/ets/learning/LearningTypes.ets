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

export const OFF_CONTRACT_NOTE: string = '本机 SDK API 26 将 off 第三参数定义为注销结果回调。本示例使用独立完成回调更新注销状态。';
export const TEXT_PAYLOAD_KEY: string = 'com.example.appcontinuation.learning.text.v1';
export const MAX_TEXT_LENGTH: number = 4096;

export function emptyLearningSnapshot(): LearningSnapshot {
  return {
    launchReason: '等待 Ability 初始化', launchReasonCode: -1,
    listenerState: '未注册', sessionState: '尚未收到系统接续事件', sessionActive: false,
    quickStartRequired: false, quickResult: '本轮不需要', dataState: '尚未到达',
    windowState: '未就绪', committed: false, sessionRecordId: '', canRegister: false, canUnregister: false,
    canEdit: false, canStop: false, text: '', selectionStart: 0, selectionEnd: 0,
    documentId: '', revision: 0, conflictPending: false, conflictAccepted: false, conflictKind: '',
    conflictSummary: '',
    scene: emptyScene(), businessPositionState: '尚未定位业务内容', positionRequest: 0, targetPage: 'pages/ProcessPage',
    savedTextStatus: '尚未保存', restoredSummary: '', latestRecord: undefined,
    records: [], events: [], environment: [], environmentCheckedAt: '尚未检查',
    nativeOffNote: OFF_CONTRACT_NOTE, notice: '等待 Ability 初始化运行时。'
  };
}
