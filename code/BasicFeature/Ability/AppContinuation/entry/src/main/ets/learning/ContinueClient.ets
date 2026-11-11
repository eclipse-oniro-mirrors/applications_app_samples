/** 本学习运行时的独立 SDK 调用边界。 */
import { continueManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ContinueNativePort, LearningClock } from './LearningPorts';

const OFF_OBSERVATION_MS: number = 8000;

export interface ContinueObservation {
  phase: string;
  kind: string;
  errorCode: string;
  rawState: string;
  detail: string;
}

export interface ContinueCall {
  accepted: boolean;
  errorCode: string;
  detail: string;
  rawMessage?: string;
}

export interface ContinueSlot {
  listening: boolean;
  // 保留注销入口与销毁清理，不作为重新注册的门禁。
  nativeDirty: boolean;
  offPending: boolean;
  offObservationExpired: boolean;
}

export type ContinueObserver = (event: ContinueObservation) => void;

/** 脱敏平台消息，供操作详情展示。 */
export function redactPlatformText(text: string): string {
  return text.slice(0, 512)
    .replace(/(?:https?|file|content|datashare):\/\/[^\s,;]+/gi, '[地址已隐藏]')
    .replace(/[A-Za-z]:[\\/][^\s,;]+/g, '[路径已隐藏]')
    .replace(/(?:\/[^\s/]+){2,}/g, '[路径已隐藏]')
    .replace(/\b[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\b/gi, '[标识已隐藏]')
    .replace(/\b(?:[0-9a-f]{2}[:-]){5}[0-9a-f]{2}\b/gi, '[硬件地址已隐藏]')
    .replace(/\b(?:\d{1,3}\.){3}\d{1,3}\b/g, '[网络地址已隐藏]')
    .replace(/\b(?:[0-9a-f]{0,4}:){2,}[0-9a-f:]{0,32}\b/gi, '[网络地址已隐藏]')
    .replace(/\b[0-9a-f]{16,}\b/gi, '[长标识已隐藏]')
    .replace(/\b\d{10,}\b/g, '[长数字已隐藏]')
    .replace(/(?:text|payload|body|content|deviceId|deviceName|networkId)\s*[:=]\s*[^,;\n]+/gi, '[敏感字段已隐藏]')
    .replace(/[“”"'][^“”"']*[“”"']/g, '[引号内容已隐藏]')
    .replace(/[\r\n\t]+/g, ' ');
}

export function safeErrorMessage(error: Object | undefined | null): string {
  if (error === undefined || error === null || typeof error !== 'object') {
    return '平台未提供可读错误消息。';
  }
  const bag = error as Record<string, Object>;
  const message = bag['message'];
  return typeof message === 'string' && (message as string).length > 0 ?
    `已脱敏：${redactPlatformText(message as string)}` : '平台未提供可读错误消息。';
}

export function safeErrorCode(error: Object | undefined | null): string {
  if (error === undefined || error === null || typeof error !== 'object') {
    return '未知';
  }
  const bag = error as Record<string, Object>;
  const code = bag['code'];
  return typeof code === 'number' && Number.isFinite(code as number) ? `${code}` : '未知';
}

function observation(phase: string, err: BusinessError | undefined | null,
  info: continueManager.ContinueResultInfo | undefined | null): ContinueObservation {
  let raw: string = '缺失或非数字';
  let detail: string = err === undefined || err === null ? '平台未提供结果说明。' : safeErrorMessage(err);
  if (info !== undefined && info !== null) {
    const value: number = info.resultState as number;
    if (typeof value === 'number' && Number.isFinite(value)) {
      raw = `${value}`;
    }
    if (typeof info.resultInfo === 'string' && info.resultInfo.length > 0) {
      const resultDetail: string = `结果说明（已脱敏）：${redactPlatformText(info.resultInfo)}`;
      detail = err === undefined || err === null ? resultDetail : `${detail}；${resultDetail}`;
    }
  }
  let kind: string = 'UNKNOWN';
  if (err !== undefined && err !== null) {
    kind = 'ERROR';
  } else if (raw === '0') {
    kind = 'SUCCESS';
  } else if (raw === '1') {
    kind = 'FAILURE';
  }
  const result: ContinueObservation = {
    phase: phase,
    kind: kind,
    errorCode: err === undefined || err === null ? '' : safeErrorCode(err),
    rawState: raw,
    detail: detail
  };
  return result;
}

export class ContinueClient {
  private readonly native: ContinueNativePort;
  private readonly clock: LearningClock;
  private sink: ContinueObserver | undefined = undefined;
  private listening: boolean = false;
  private nativeDirty: boolean = false;
  private offPending: boolean = false;
  private offObservationExpired: boolean = false;
  private generation: number = 0;
  private offAttempt: number = 0;
  private offTimer: number = -1;
  private released: boolean = false;

  constructor(native: ContinueNativePort, clock: LearningClock) {
    this.native = native;
    this.clock = clock;
  }

  state(): ContinueSlot {
    const value: ContinueSlot = {
      listening: this.listening, nativeDirty: this.nativeDirty,
      offPending: this.offPending, offObservationExpired: this.offObservationExpired
    };
    return value;
  }

  register(observer: ContinueObserver): ContinueCall {
    if (this.released || this.listening || this.offPending) {
      const blocked: ContinueCall = {
        accepted: false, errorCode: '', detail: '正在监听、等待注销回调或运行时已释放；未重复调用 on。'
      };
      return blocked;
    }
    this.offObservationExpired = false;
    const generation: number = ++this.generation;
    this.sink = observer;
    this.listening = true;
    // 保留注销入口；nativeDirty 只记录清理需求，不阻止失败后的重新注册。
    this.nativeDirty = true;
    try {
      this.native.on(
        (err: BusinessError | undefined | null, info: continueManager.ContinueResultInfo | undefined | null): void => {
          if (this.released || generation !== this.generation || !this.listening) {
            return;
          }
          const sink = this.sink;
          if (sink !== undefined) {
            sink(observation('ON_ASYNC', err, info));
          }
        });
      const result: ContinueCall = {
        accepted: true, errorCode: '', detail: 'on 同步调用已返回，等待 prepareContinue 事件。'
      };
      return result;
    } catch (error) {
      if (generation === this.generation) {
        this.generation++;
        this.listening = false;
        this.sink = undefined;
      }
      const failed: ContinueCall = {
        accepted: false, errorCode: safeErrorCode(error as Object),
        detail: 'on 同步抛出异常，可重新注册或尝试注销。',
        rawMessage: safeErrorMessage(error as Object)
      };
      return failed;
    }
  }

  unregister(observer: ContinueObserver): ContinueCall {
    // 立即停用旧 ON sink；注销完成回调使用独立代次。
    this.sink = undefined;
    this.listening = false;
    this.generation++;
    if (this.offPending) {
      const pending: ContinueCall = {
        accepted: false, errorCode: '', detail: '正在等待注销回调，最多等待 8 秒。'
      };
      return pending;
    }
    if (!this.nativeDirty) {
      const empty: ContinueCall = { accepted: false, errorCode: '', detail: '没有需要清理的本运行时 native 注册槽。' };
      return empty;
    }
    const attempt: number = ++this.offAttempt;
    this.offPending = true;
    this.offObservationExpired = false;
    this.offTimer = this.clock.setTimeout((): void => {
      this.offTimer = -1;
      if (attempt !== this.offAttempt || !this.offPending) {
        return;
      }
      this.offPending = false;
      this.offObservationExpired = true;
      // 结束本次等待并隔离迟到完成通知，避免影响后续注册或注销。
      this.offAttempt++;
      if (!this.released) {
        const timeout: ContinueObservation = {
          phase: 'OFF_OBSERVATION',
          kind: 'UNCONFIRMED',
          errorCode: '',
          rawState: '尚未收到',
          detail: '注销等待已超时（8 秒），可重新注册或重试注销。'
        };
        observer(timeout);
      }
    }, OFF_OBSERVATION_MS);
    try {
      this.native.off(
        (err: BusinessError | undefined | null, info: continueManager.ContinueResultInfo | undefined | null): void => {
          if (attempt !== this.offAttempt || !this.offPending) {
            return;
          }
          if (this.offTimer >= 0) {
            this.clock.clearTimeout(this.offTimer);
            this.offTimer = -1;
          }
          this.offPending = false;
          this.offObservationExpired = false;
          const result: ContinueObservation = observation('OFF_ASYNC', err, info);
          // 完成通知返回 SUCCESS 后清除 nativeDirty。
          if (result.kind === 'SUCCESS') {
            this.nativeDirty = false;
          }
          if (!this.released) {
            observer(result);
          }
        });
      const result: ContinueCall = {
        accepted: true, errorCode: '', detail: 'off 同步调用已返回，等待独立注销完成回调。'
      };
      return result;
    } catch (error) {
      if (attempt !== this.offAttempt || !this.offPending) {
        const completed: ContinueCall = {
          accepted: false, errorCode: safeErrorCode(error as Object),
          detail: 'off 完成通知后又发生同步异常；当前保留完成通知的状态。',
          rawMessage: safeErrorMessage(error as Object)
        };
        return completed;
      }
      if (this.offTimer >= 0) {
        this.clock.clearTimeout(this.offTimer);
        this.offTimer = -1;
      }
      this.offPending = false;
      const failed: ContinueCall = {
        accepted: false, errorCode: safeErrorCode(error as Object),
        detail: 'off 同步抛出异常；本地监听已停用，可重新注册或重试注销。',
        rawMessage: safeErrorMessage(error as Object)
      };
      return failed;
    }
  }

  dispose(): void {
    if (this.released) {
      return;
    }
    // Ability 销毁时发起一次监听清理。
    if (this.nativeDirty && !this.offPending) {
      this.unregister((_event: ContinueObservation): void => {});
    }
    this.released = true;
    this.sink = undefined;
    this.listening = false;
    this.generation++;
    if (this.offTimer >= 0) {
      this.clock.clearTimeout(this.offTimer);
      this.offTimer = -1;
    }
  }
}
