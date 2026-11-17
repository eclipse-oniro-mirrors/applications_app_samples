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

import { RecordValue } from './RecordValues';

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
  INITIAL = 'initial',
  MANUAL = 'manual',
  FOREGROUND = 'foreground',
  SETTINGS = 'settings'
}

/** Schema-1 records used localized source values. Accept them only at the data boundary. */
export function parseRefreshSource(value: string): RefreshSource | undefined {
  switch (value) {
    case RefreshSource.INITIAL:
    case '首次进入':
      return RefreshSource.INITIAL;
    case RefreshSource.MANUAL:
    case '手动刷新':
      return RefreshSource.MANUAL;
    case RefreshSource.FOREGROUND:
    case '返回前台':
      return RefreshSource.FOREGROUND;
    case RefreshSource.SETTINGS:
    case '设置后查询':
      return RefreshSource.SETTINGS;
    default:
      return undefined;
  }
}

export enum QueryOutcome {
  SUCCESS = 'success',
  FAILURE = 'failure',
  UNSUPPORTED = 'unsupported',
  TIMEOUT = 'timeout',
  UNKNOWN = 'unknown'
}

export class QuerySnapshot {
  public phase: QueryPhase = QueryPhase.IDLE;
  public support: SupportState = SupportState.UNKNOWN;
  public value: boolean | null = null;
  public sampleTime: number = 0;
  public lastValue: boolean | null = null;
  public lastSampleTime: number = 0;
  public errorCode: string = '';
  public errorMessage: string = '';
  public pending: boolean = false;
  public supportResult: string = RecordValue.PENDING;
  public statusResult: string = RecordValue.PENDING;

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
  public id: number = 0;
  public timestamp: number = 0;
  public source: RefreshSource = RefreshSource.INITIAL;
  public result: string = '';
  public supportResult: string = RecordValue.PENDING;
  public statusResult: string = RecordValue.PENDING;
  public errorCode: string = '';
  public errorMessage: string = '';
  public durationMillis: number = 0;
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
