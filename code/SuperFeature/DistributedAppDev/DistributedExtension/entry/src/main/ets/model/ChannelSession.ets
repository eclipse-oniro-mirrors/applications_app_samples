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
 * 代理通道（proxyChannelManager）的状态机与文案。
 * openProxyChannel 是异步接口，成功后拿到 channelId，失败拿到 3239xxxx 错误码；
 * 通道自身的可用性另由 channelStateChange 回调的 ChannelState 表示，两者是两条独立的状态线。
 * 用户可见文案一律从 string.json 解析，函数返回的即当前语言下的文本。
 */

import { text, text1, text2 } from '../common/StringResource';

export enum ChannelStage {
  CLOSED = 0,
  OPENING = 1,
  OPEN = 2,
  FAILED = 3
}

export enum ChannelAction {
  OPEN = 0,
  OPEN_OK = 1,
  OPEN_FAIL = 2,
  SEND = 3,
  CLOSE = 4
}

export function channelStageName(stage: ChannelStage): string {
  switch (stage) {
    case ChannelStage.OPENING:
      return text('chan_stage_opening');
    case ChannelStage.OPEN:
      return text('chan_stage_open');
    case ChannelStage.FAILED:
      return text('chan_stage_failed');
    default:
      return text('chan_stage_closed');
  }
}

export function channelStageHint(stage: ChannelStage): string {
  switch (stage) {
    case ChannelStage.OPENING:
      return text('chan_hint_opening');
    case ChannelStage.OPEN:
      return text('chan_hint_open');
    case ChannelStage.FAILED:
      return text('chan_hint_failed');
    default:
      return text('chan_hint_closed');
  }
}

export function nextChannelStage(stage: ChannelStage, action: ChannelAction): ChannelStage {
  switch (action) {
    case ChannelAction.OPEN:
      return stage === ChannelStage.CLOSED || stage === ChannelStage.FAILED ? ChannelStage.OPENING : stage;
    case ChannelAction.OPEN_OK:
      return stage === ChannelStage.OPENING ? ChannelStage.OPEN : stage;
    case ChannelAction.OPEN_FAIL:
      return stage === ChannelStage.OPENING ? ChannelStage.FAILED : stage;
    case ChannelAction.SEND:
      return stage === ChannelStage.OPEN ? ChannelStage.OPEN : stage;
    case ChannelAction.CLOSE:
      return stage === ChannelStage.CLOSED ? stage : ChannelStage.CLOSED;
    default:
      return stage;
  }
}

export function canSendData(stage: ChannelStage): boolean {
  return stage === ChannelStage.OPEN;
}

export function describeChannel(channelId: number, stage: ChannelStage): string {
  if (channelId < 0) {
    return text1('chan_describe_no_id', channelStageName(stage));
  }
  return text2('chan_describe_with_id', channelStageName(stage), `${channelId}`);
}

/** openProxyChannel 允许的对端参数：MAC 形如 12:34:56:78:9A:BC，UUID 由 8-4-4-4-12 段十六进制组成 */
export function isMacAddress(value: string): boolean {
  if (value.length !== 17) {
    return false;
  }
  for (let i = 0; i < value.length; i++) {
    const char = value.charAt(i);
    const isColon = i % 3 === 2;
    if (isColon) {
      if (char !== ':') {
        return false;
      }
      continue;
    }
    const isHex = (char >= '0' && char <= '9') || (char >= 'A' && char <= 'F') || (char >= 'a' && char <= 'f');
    if (!isHex) {
      return false;
    }
  }
  return true;
}

export function isServiceUuid(value: string): boolean {
  if (value.length !== 36) {
    return false;
  }
  for (let i = 0; i < value.length; i++) {
    const char = value.charAt(i);
    const isDash = i === 8 || i === 13 || i === 18 || i === 23;
    if (isDash) {
      if (char !== '-') {
        return false;
      }
      continue;
    }
    const isHex = (char >= '0' && char <= '9') || (char >= 'A' && char <= 'F') || (char >= 'a' && char <= 'f');
    if (!isHex) {
      return false;
    }
  }
  return true;
}
