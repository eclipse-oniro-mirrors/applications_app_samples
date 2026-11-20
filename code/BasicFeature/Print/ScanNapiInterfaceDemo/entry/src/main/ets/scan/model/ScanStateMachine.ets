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
 * 扫描会话的状态。UI 只根据状态决定哪些按钮可用。
 */
export enum ScanState {
  IDLE = 'idle',
  DISCOVERING = 'discovering',
  DISCOVERED = 'discovered',
  OPENING = 'opening',
  OPENED = 'opened',
  SCANNING = 'scanning',
  CANCELLING = 'cancelling',
  CLOSED = 'closed',
  ERROR = 'error'
}

/**
 * 驱动状态变化的事件，与 @ohos.scan 的回调/返回值一一对应。
 */
export enum ScanEvent {
  DISCOVER = 'discover',
  DEVICE_FOUND = 'deviceFound',
  OPEN = 'open',
  OPEN_SUCCESS = 'openSuccess',
  SCAN_START = 'scanStart',
  PROGRESS = 'progress',
  SCAN_FINISH = 'scanFinish',
  CANCEL = 'cancel',
  CANCEL_DONE = 'cancelDone',
  CLOSE = 'close',
  FAIL = 'fail',
  RESET = 'reset'
}

/**
 * 扫描状态机。非法事件不改变状态，保证 UI 不会卡在不可达态。
 */
export class ScanStateMachine {
  static getInitialState(): ScanState {
    return ScanState.IDLE;
  }

  static canTransit(state: ScanState, event: ScanEvent): boolean {
    if (event === ScanEvent.FAIL) {
      return true;
    }
    if (state === ScanState.IDLE) {
      return event === ScanEvent.DISCOVER;
    }
    if (state === ScanState.DISCOVERING) {
      return event === ScanEvent.DISCOVER || event === ScanEvent.DEVICE_FOUND;
    }
    if (state === ScanState.DISCOVERED) {
      return event === ScanEvent.OPEN || event === ScanEvent.CLOSE;
    }
    if (state === ScanState.OPENING) {
      return event === ScanEvent.OPEN_SUCCESS;
    }
    if (state === ScanState.OPENED) {
      return event === ScanEvent.SCAN_START || event === ScanEvent.OPEN || event === ScanEvent.CLOSE;
    }
    if (state === ScanState.SCANNING) {
      return event === ScanEvent.PROGRESS || event === ScanEvent.SCAN_FINISH
        || event === ScanEvent.CANCEL;
    }
    if (state === ScanState.CANCELLING) {
      return event === ScanEvent.CANCEL_DONE;
    }
    if (state === ScanState.CLOSED) {
      return event === ScanEvent.RESET;
    }
    if (state === ScanState.ERROR) {
      return event === ScanEvent.RESET;
    }
    return false;
  }

  static next(state: ScanState, event: ScanEvent): ScanState {
    if (!ScanStateMachine.canTransit(state, event)) {
      return state;
    }
    if (event === ScanEvent.FAIL) {
      return ScanState.ERROR;
    }
    if (event === ScanEvent.DISCOVER) {
      return ScanState.DISCOVERING;
    }
    if (event === ScanEvent.DEVICE_FOUND) {
      return ScanState.DISCOVERED;
    }
    if (event === ScanEvent.OPEN) {
      return ScanState.OPENING;
    }
    if (event === ScanEvent.OPEN_SUCCESS) {
      return ScanState.OPENED;
    }
    if (event === ScanEvent.SCAN_START) {
      return ScanState.SCANNING;
    }
    if (event === ScanEvent.PROGRESS) {
      return ScanState.SCANNING;
    }
    if (event === ScanEvent.SCAN_FINISH) {
      return ScanState.OPENED;
    }
    if (event === ScanEvent.CANCEL) {
      return ScanState.CANCELLING;
    }
    if (event === ScanEvent.CANCEL_DONE) {
      return ScanState.OPENED;
    }
    if (event === ScanEvent.CLOSE) {
      return ScanState.CLOSED;
    }
    if (event === ScanEvent.RESET) {
      return ScanState.IDLE;
    }
    return state;
  }

  /**
   * 长耗时操作进行中，此时禁止并发点击。
   */
  static isBusy(state: ScanState): boolean {
    return state === ScanState.OPENING || state === ScanState.SCANNING
      || state === ScanState.CANCELLING;
  }

  static isTerminal(state: ScanState): boolean {
    return state === ScanState.CLOSED || state === ScanState.ERROR;
  }

  static isRecoverable(state: ScanState): boolean {
    return state === ScanState.ERROR;
  }

  static canStartScan(state: ScanState): boolean {
    return state === ScanState.OPENED;
  }

  static canCancel(state: ScanState): boolean {
    return state === ScanState.SCANNING;
  }

  static canClose(state: ScanState): boolean {
    return state === ScanState.DISCOVERED || state === ScanState.OPENED;
  }

  static getLabelKey(state: ScanState): string {
    return `scan_state_${state}`;
  }

  /**
   * 依次应用事件序列，返回终态。用于回放一次性到达的多个回调。
   */
  static apply(state: ScanState, events: ScanEvent[]): ScanState {
    let current: ScanState = state;
    for (let index = 0; index < events.length; index++) {
      current = ScanStateMachine.next(current, events[index]);
    }
    return current;
  }

  /**
   * 事件序列中真正生效的迁移数量。
   */
  static countApplied(state: ScanState, events: ScanEvent[]): number {
    let current: ScanState = state;
    let applied: number = 0;
    for (let index = 0; index < events.length; index++) {
      const event: ScanEvent = events[index];
      if (ScanStateMachine.canTransit(current, event)) {
        applied++;
      }
      current = ScanStateMachine.next(current, event);
    }
    return applied;
  }
}
