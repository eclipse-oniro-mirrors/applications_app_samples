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

/**
 * Pure model fixtures for the ArkTS child process sample.
 *
 * The classes below mirror the start modes, entry paths, argument validation
 * and pid bookkeeping performed by entry/src/main/ets/pages/Index.ets when a
 * child process is started through childProcessManager. No ArkUI and no UiTest
 * API is used, so the model can run on the host test ability.
 */

export const START_MODE_SELF_FORK: number = 0;
export const START_MODE_ATTACH: number = 1;
export const PID_MIN: number = 1;
export const PID_MAX: number = 2147483647;
export const RETRY_STEP: number = 1000;
export const RETRY_MAX: number = 5000;
export const PARAM_MAX_LENGTH: number = 1024;
export const ERROR_SUCCESS: number = 0;
export const ERROR_INVALID_PARAM: number = 401;
export const ERROR_START_FAILED: number = 16000001;
export const ERROR_ALREADY_RUNNING: number = 16000002;
export const ERROR_NOT_SUPPORTED: number = 16000003;
export const SELF_FORK_ENTRY: string = './ets/process/DemoProcessNoArg.ets';
export const ARG_ENTRY: string = 'module1/ets/process/DemoProcessArg.ets';
export const DEFAULT_ENTRY_PARAM: string = 'testParam';
export const FD_KEY: string = 'key1';
export const STATE_IDLE: number = 0;
export const STATE_RUNNING: number = 1;
export const STATE_EXITED: number = 2;

export interface ChildProcessRequest {
  entry: string;
  mode: number;
  entryParams: string;
  fdCount: number;
  isolationMode: boolean;
}

export class ChildProcessModel {
  static isValidPid(pid: number): boolean {
    return pid >= PID_MIN && pid <= PID_MAX;
  }

  static isValidStartMode(mode: number): boolean {
    return mode === START_MODE_SELF_FORK || mode === START_MODE_ATTACH;
  }

  static isValidPath(path: string): boolean {
    return path.length > 0 && path.endsWith('.ets') && !path.includes('..');
  }

  static isArkTsProcessPath(path: string): boolean {
    return path.startsWith('./ets/process/') && path.endsWith('.ets');
  }

  static isModuleProcessPath(path: string): boolean {
    return path.startsWith('module1/ets/process/') && path.endsWith('.ets');
  }

  static isValidEntryParams(value: string): boolean {
    return value.length > 0 && value.length <= PARAM_MAX_LENGTH;
  }

  static isValidFdValue(fd: number): boolean {
    return fd >= 0;
  }

  static fdCount(fds: Map<string, number>): number {
    return fds.size;
  }

  static countFds(keys: Array<string>): number {
    return keys.length;
  }

  static hasFdKey(keys: Array<string>, key: string): boolean {
    return keys.includes(key);
  }

  static retryDelay(attempt: number): number {
    if (attempt <= 0) {
      return 0;
    }
    const delay: number = attempt * RETRY_STEP;
    return delay > RETRY_MAX ? RETRY_MAX : delay;
  }

  static stateName(state: number): string {
    if (state === STATE_IDLE) {
      return 'IDLE';
    }
    if (state === STATE_RUNNING) {
      return 'RUNNING';
    }
    if (state === STATE_EXITED) {
      return 'EXITED';
    }
    return 'UNKNOWN';
  }

  static canStart(state: number): boolean {
    return state === STATE_IDLE || state === STATE_EXITED;
  }

  static canStop(state: number): boolean {
    return state === STATE_RUNNING;
  }

  static errorMessage(code: number): string {
    if (code === ERROR_SUCCESS) {
      return 'success';
    }
    if (code === ERROR_INVALID_PARAM) {
      return 'invalid parameter';
    }
    if (code === ERROR_START_FAILED) {
      return 'start child process failed';
    }
    if (code === ERROR_ALREADY_RUNNING) {
      return 'child process already running';
    }
    if (code === ERROR_NOT_SUPPORTED) {
      return 'operation not supported';
    }
    return 'unknown error';
  }

  static isSuccessCode(code: number): boolean {
    return code === ERROR_SUCCESS;
  }

  static normalizeParams(value: string): string {
    return value.trim();
  }

  static isolationAllowed(mode: number): boolean {
    return mode === START_MODE_SELF_FORK;
  }

  static describeResult(pid: number, code: number): string {
    if (code === ERROR_SUCCESS) {
      return 'pid:' + pid.toString();
    }
    return 'error:' + code.toString();
  }

  static isSameProcess(first: number, second: number): boolean {
    return first === second && first > 0;
  }

  static countValidPids(pids: Array<number>): number {
    let count: number = 0;
    for (let index: number = 0; index < pids.length; index++) {
      if (ChildProcessModel.isValidPid(pids[index])) {
        count++;
      }
    }
    return count;
  }

  static buildRequest(entry: string, mode: number, entryParams: string, fdCount: number,
    isolationMode: boolean): ChildProcessRequest {
    const request: ChildProcessRequest = {
      entry: entry,
      mode: mode,
      entryParams: entryParams,
      fdCount: fdCount,
      isolationMode: isolationMode
    };
    return request;
  }

  static requestEquals(first: ChildProcessRequest, second: ChildProcessRequest): boolean {
    return first.entry === second.entry && first.mode === second.mode &&
      first.entryParams === second.entryParams && first.fdCount === second.fdCount &&
      first.isolationMode === second.isolationMode;
  }

  static requestSummary(request: ChildProcessRequest): string {
    return request.entry + '|' + request.mode.toString() + '|' + request.entryParams + '|' +
      request.fdCount.toString() + '|' + request.isolationMode.toString();
  }

  static isValidRequest(request: ChildProcessRequest): boolean {
    return ChildProcessModel.isValidPath(request.entry) &&
      ChildProcessModel.isValidStartMode(request.mode) &&
      ChildProcessModel.isValidEntryParams(request.entryParams) &&
      request.fdCount >= 0;
  }

  static formatLog(request: ChildProcessRequest): string {
    return 'start entry=' + request.entry + ' mode=' + request.mode.toString() +
      ' params=' + request.entryParams + ' fds=' + request.fdCount.toString();
  }
}
