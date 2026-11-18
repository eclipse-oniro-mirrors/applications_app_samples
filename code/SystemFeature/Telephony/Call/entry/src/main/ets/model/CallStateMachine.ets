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
 * @file entry/src/main/ets/model/CallStateMachine.ets
 * 文件职责：通话状态机，约束状态迁移并给出状态标签。
 * 主要声明：CallStateMachine。
 */

/**
 * CallStateMachine：以事件驱动的方式维护通话状态。
 */
export class CallStateMachine {
  public static readonly IDLE: string = 'IDLE';
  public static readonly DIALLING: string = 'DIALLING';
  public static readonly RINGING: string = 'RINGING';
  public static readonly ACTIVE: string = 'ACTIVE';
  public static readonly HOLDING: string = 'HOLDING';
  public static readonly DISCONNECTED: string = 'DISCONNECTED';

  public static readonly EVENT_DIAL: string = 'DIAL';
  public static readonly EVENT_INCOMING: string = 'INCOMING';
  public static readonly EVENT_CONNECTED: string = 'CONNECTED';
  public static readonly EVENT_ANSWER: string = 'ANSWER';
  public static readonly EVENT_HOLD: string = 'HOLD';
  public static readonly EVENT_UNHOLD: string = 'UNHOLD';
  public static readonly EVENT_HANGUP: string = 'HANGUP';
  public static readonly EVENT_REJECT: string = 'REJECT';
  public static readonly EVENT_RESET: string = 'RESET';

  /**
   * next：按事件计算下一个状态，非法事件保持原状态。
   * @param current 当前状态。
   * @param event 事件。
   * @returns 下一个状态。
   */
  static next(current: string, event: string): string {
    if (current === CallStateMachine.IDLE && event === CallStateMachine.EVENT_DIAL) {
      return CallStateMachine.DIALLING;
    }
    if (current === CallStateMachine.IDLE && event === CallStateMachine.EVENT_INCOMING) {
      return CallStateMachine.RINGING;
    }
    if (current === CallStateMachine.DIALLING && event === CallStateMachine.EVENT_CONNECTED) {
      return CallStateMachine.ACTIVE;
    }
    if (current === CallStateMachine.DIALLING && event === CallStateMachine.EVENT_HANGUP) {
      return CallStateMachine.DISCONNECTED;
    }
    if (current === CallStateMachine.RINGING && event === CallStateMachine.EVENT_ANSWER) {
      return CallStateMachine.ACTIVE;
    }
    if (current === CallStateMachine.RINGING && event === CallStateMachine.EVENT_REJECT) {
      return CallStateMachine.DISCONNECTED;
    }
    if (current === CallStateMachine.ACTIVE && event === CallStateMachine.EVENT_HOLD) {
      return CallStateMachine.HOLDING;
    }
    if (current === CallStateMachine.HOLDING && event === CallStateMachine.EVENT_UNHOLD) {
      return CallStateMachine.ACTIVE;
    }
    if (current === CallStateMachine.ACTIVE && event === CallStateMachine.EVENT_HANGUP) {
      return CallStateMachine.DISCONNECTED;
    }
    if (current === CallStateMachine.HOLDING && event === CallStateMachine.EVENT_HANGUP) {
      return CallStateMachine.DISCONNECTED;
    }
    if (current === CallStateMachine.DISCONNECTED && event === CallStateMachine.EVENT_RESET) {
      return CallStateMachine.IDLE;
    }
    return current;
  }

  /**
   * canTransition：判断两个状态之间是否存在合法迁移。
   * @param from 起始状态。
   * @param to 目标状态。
   * @returns 是否合法。
   */
  static canTransition(from: string, to: string): boolean {
    const events: string[] = [
      CallStateMachine.EVENT_DIAL,
      CallStateMachine.EVENT_INCOMING,
      CallStateMachine.EVENT_CONNECTED,
      CallStateMachine.EVENT_ANSWER,
      CallStateMachine.EVENT_HOLD,
      CallStateMachine.EVENT_UNHOLD,
      CallStateMachine.EVENT_HANGUP,
      CallStateMachine.EVENT_REJECT,
      CallStateMachine.EVENT_RESET
    ];
    for (let index = 0; index < events.length; index++) {
      if (CallStateMachine.next(from, events[index]) === to) {
        return true;
      }
    }
    return false;
  }

  /**
   * label：返回状态的可读标签。
   * @param state 状态。
   * @returns 标签文本。
   */
  static label(state: string): string {
    if (state === CallStateMachine.IDLE) {
      return 'idle';
    }
    if (state === CallStateMachine.DIALLING) {
      return 'dialling';
    }
    if (state === CallStateMachine.RINGING) {
      return 'ringing';
    }
    if (state === CallStateMachine.ACTIVE) {
      return 'active';
    }
    if (state === CallStateMachine.HOLDING) {
      return 'on hold';
    }
    if (state === CallStateMachine.DISCONNECTED) {
      return 'disconnected';
    }
    return 'unknown';
  }

  /**
   * isActive：判断状态是否处于通话占用中。
   * @param state 状态。
   * @returns 是否占用。
   */
  static isActive(state: string): boolean {
    return state === CallStateMachine.ACTIVE || state === CallStateMachine.HOLDING;
  }

  /**
   * isTerminal：判断状态是否为终态。
   * @param state 状态。
   * @returns 是否终态。
   */
  static isTerminal(state: string): boolean {
    return state === CallStateMachine.DISCONNECTED;
  }

  /**
   * allStates：返回全部状态。
   * @returns 状态数组。
   */
  static allStates(): string[] {
    return [
      CallStateMachine.IDLE,
      CallStateMachine.DIALLING,
      CallStateMachine.RINGING,
      CallStateMachine.ACTIVE,
      CallStateMachine.HOLDING,
      CallStateMachine.DISCONNECTED
    ];
  }
}
