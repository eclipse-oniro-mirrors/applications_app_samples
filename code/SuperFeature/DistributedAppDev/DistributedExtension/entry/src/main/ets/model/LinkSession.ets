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
 * 链路增强（linkEnhance）的状态机：Server 与 Connection 两条对象各自有创建 / 启动 / 连接 / 关闭，
 * 文档没有把它们串成一个状态机，但页面需要回答"当前能不能点下一步"，所以这里用纯函数固化允许的转移。
 * 非法转移一律返回原状态，页面据此把按钮置灰，而不是发出一次注定失败的调用。
 *
 * 文案统一走 resources/base/element/string.json：本层不拼中文，只返回资源名，经 common/StringResource 解析。
 */

import { text, text2 } from '../common/StringResource';

export enum LinkStage {
  EMPTY = 0,
  SERVER_CREATED = 1,
  SERVER_STARTED = 2,
  SERVER_STOPPED = 3,
  CONNECTION_CREATED = 4,
  CONNECTING = 5,
  CONNECTED = 6,
  CLOSED = 7
}

export enum LinkAction {
  CREATE_SERVER = 0,
  START = 1,
  STOP = 2,
  CREATE_CONNECTION = 3,
  CONNECT = 4,
  PEER_CONNECTED = 5,
  DISCONNECT = 6,
  CLOSE = 7
}

export function stageName(stage: LinkStage): string {
  switch (stage) {
    case LinkStage.SERVER_CREATED:
      return text('link_stage_server_created');
    case LinkStage.SERVER_STARTED:
      return text('link_stage_server_started');
    case LinkStage.SERVER_STOPPED:
      return text('link_stage_server_stopped');
    case LinkStage.CONNECTION_CREATED:
      return text('link_stage_connection_created');
    case LinkStage.CONNECTING:
      return text('link_stage_connecting');
    case LinkStage.CONNECTED:
      return text('link_stage_connected');
    case LinkStage.CLOSED:
      return text('link_stage_closed');
    default:
      return text('link_stage_empty');
  }
}

export function stageHint(stage: LinkStage): string {
  switch (stage) {
    case LinkStage.SERVER_CREATED:
      return text('link_hint_server_created');
    case LinkStage.SERVER_STARTED:
      return text('link_hint_server_started');
    case LinkStage.SERVER_STOPPED:
      return text('link_hint_server_stopped');
    case LinkStage.CONNECTION_CREATED:
      return text('link_hint_connection_created');
    case LinkStage.CONNECTING:
      return text('link_hint_connecting');
    case LinkStage.CONNECTED:
      return text('link_hint_connected');
    case LinkStage.CLOSED:
      return text('link_hint_closed');
    default:
      return text('link_hint_empty');
  }
}

export function nextStage(stage: LinkStage, action: LinkAction): LinkStage {
  switch (action) {
    case LinkAction.CREATE_SERVER:
      return stage === LinkStage.EMPTY || stage === LinkStage.SERVER_STOPPED || stage === LinkStage.CLOSED ?
        LinkStage.SERVER_CREATED : stage;
    case LinkAction.START:
      return stage === LinkStage.SERVER_CREATED || stage === LinkStage.SERVER_STOPPED ?
        LinkStage.SERVER_STARTED : stage;
    case LinkAction.STOP:
      return stage === LinkStage.SERVER_STARTED ? LinkStage.SERVER_STOPPED : stage;
    case LinkAction.CREATE_CONNECTION:
      return stage === LinkStage.EMPTY || stage === LinkStage.SERVER_STOPPED || stage === LinkStage.CLOSED ?
        LinkStage.CONNECTION_CREATED : stage;
    case LinkAction.CONNECT:
      return stage === LinkStage.CONNECTION_CREATED ? LinkStage.CONNECTING : stage;
    case LinkAction.PEER_CONNECTED:
      return stage === LinkStage.CONNECTING ? LinkStage.CONNECTED : stage;
    case LinkAction.DISCONNECT:
      return stage === LinkStage.CONNECTED || stage === LinkStage.CONNECTING ?
        LinkStage.CONNECTION_CREATED : stage;
    case LinkAction.CLOSE:
      return stage === LinkStage.EMPTY ? stage : LinkStage.CLOSED;
    default:
      return stage;
  }
}

export function canStart(stage: LinkStage): boolean {
  return stage === LinkStage.SERVER_CREATED || stage === LinkStage.SERVER_STOPPED;
}

export function canStop(stage: LinkStage): boolean {
  return stage === LinkStage.SERVER_STARTED;
}

export function canConnect(stage: LinkStage): boolean {
  return stage === LinkStage.CONNECTION_CREATED;
}

export function canSend(stage: LinkStage): boolean {
  return stage === LinkStage.CONNECTED;
}

export function canClose(stage: LinkStage): boolean {
  return stage !== LinkStage.EMPTY;
}

/** 页面上按顺序渲染的按钮可用性，避免每处都写一遍枚举比较 */
export function allowedActions(stage: LinkStage): string[] {
  const actions: string[] = [];
  if (canStart(stage)) {
    actions.push('start');
  }
  if (canStop(stage)) {
    actions.push('stop');
  }
  if (canConnect(stage)) {
    actions.push('connect');
  }
  if (canSend(stage)) {
    actions.push('sendData');
  }
  if (canClose(stage)) {
    actions.push('close');
  }
  return actions;
}

export function summarizeStage(stage: LinkStage, serverName: string): string {
  const name = serverName.trim().length > 0 ? serverName : text('link_server_name_empty');
  return text2('link_stage_summary', stageName(stage), name);
}
