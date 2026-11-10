export interface QueryRecordSink {
  capture(record: QueryRecord): void;
}

export enum SupportState {
  UNKNOWN = 'UNKNOWN',
  SUPPORTED = 'SUPPORTED',
  UNSUPPORTED = 'UNSUPPORTED',
  FAILED = 'FAILED'
}

export enum QueryPhase {
  IDLE = 'IDLE',
  CHECKING = 'CHECKING',
  QUERYING = 'QUERYING',
  SUCCEEDED = 'SUCCEEDED',
  UNSUPPORTED = 'UNSUPPORTED',
  FAILED = 'FAILED',
  TIMEOUT = 'TIMEOUT'
}

export enum RefreshSource {
  INITIAL = '首次进入',
  MANUAL = '手动刷新',
  FOREGROUND = '返回前台',
  SETTINGS = '设置后查询'
}

export enum QueryOutcome {
  SUCCESS = 'success',
  FAILURE = 'failure',
  UNSUPPORTED = 'unsupported',
  TIMEOUT = 'timeout',
  UNKNOWN = 'unknown'
}

export class QuerySnapshot {
  phase: QueryPhase = QueryPhase.IDLE;
  support: SupportState = SupportState.UNKNOWN;
  value: boolean | null = null;
  sampleTime: number = 0;
  lastValue: boolean | null = null;
  lastSampleTime: number = 0;
  errorCode: string = '';
  errorMessage: string = '';
  pending: boolean = false;
  supportResult: string = '待调用';
  statusResult: string = '待调用';

  clone(): QuerySnapshot {
    const copy = new QuerySnapshot();
    copy.phase = this.phase;
    copy.support = this.support;
    copy.value = this.value;
    copy.sampleTime = this.sampleTime;
    copy.lastValue = this.lastValue;
    copy.lastSampleTime = this.lastSampleTime;
    copy.errorCode = this.errorCode;
    copy.errorMessage = this.errorMessage;
    copy.pending = this.pending;
    copy.supportResult = this.supportResult;
    copy.statusResult = this.statusResult;
    return copy;
  }
}

export class QueryRecord {
  id: number = 0;
  timestamp: number = 0;
  source: RefreshSource = RefreshSource.INITIAL;
  result: string = '';
  supportResult: string = '待调用';
  statusResult: string = '待调用';
  errorCode: string = '';
  errorMessage: string = '';
  durationMillis: number = 0;
  public outcome: QueryOutcome = QueryOutcome.UNKNOWN;

  clone(): QueryRecord {
    const copy = new QueryRecord();
    copy.id = this.id;
    copy.timestamp = this.timestamp;
    copy.source = this.source;
    copy.result = this.result;
    copy.supportResult = this.supportResult;
    copy.statusResult = this.statusResult;
    copy.errorCode = this.errorCode;
    copy.errorMessage = this.errorMessage;
    copy.durationMillis = this.durationMillis;
    copy.outcome = this.outcome;
    return copy;
  }
}
