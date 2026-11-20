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
 * 协同请求（onCollaborate）的纯逻辑部分。
 * 系统把调用方传入的 wantParam 交给扩展的 onCollaborate，扩展只读
 * "ohos.extra.param.key.supportCollaborateIndex" 这个键，然后回 ACCEPT / REJECT。
 * 这里把"参数解析 + 结果文案"拆成纯函数，页面与用例共用。
 * 文案存于 string.json，函数返回当前语言下的文本。
 */

import { text, text2, text3 } from '../common/StringResource';

/** d.ts 中唯一被支持的参数键 */
export const COLLABORATE_INDEX_KEY: string = 'ohos.extra.param.key.supportCollaborateIndex';

export class CollaborateRequest {
  public index: string;
  public accepted: boolean;
  public keyCount: number;

  constructor(index: string, accepted: boolean, keyCount: number) {
    this.index = index;
    this.accepted = accepted;
    this.keyCount = keyCount;
  }

  describe(): string {
    const result = this.accepted ? 'ACCEPT' : 'REJECT';
    const index = this.index.length > 0 ? this.index : text('collab_index_empty');
    return text3('collab_describe', index, `${this.keyCount}`, result);
  }
}

/** 读取协同下标；参数缺失时返回空串，调用方据此决定是否拒绝 */
export function collaborateIndex(wantParam: Record<string, Object>): string {
  const value: Object | undefined = wantParam[COLLABORATE_INDEX_KEY];
  return value === undefined ? '' : `${value}`;
}

/** 取出调用方实际传了哪些键，页面上用来提示"多传的参数不会生效" */
export function wantParamKeys(wantParam: Record<string, Object>): string[] {
  return Object.keys(wantParam);
}

/** 与扩展里 onCollaborate 的判断保持一致：下标非空才接受协同 */
export function shouldAccept(index: string): boolean {
  return index.trim().length > 0;
}

export function buildRequest(wantParam: Record<string, Object>): CollaborateRequest {
  const index = collaborateIndex(wantParam);
  return new CollaborateRequest(index, shouldAccept(index), wantParamKeys(wantParam).length);
}

/** 页面上的模拟请求：只填下标时不传别的键，便于对照扩展的读取路径 */
export function mockRequest(index: string): CollaborateRequest {
  return new CollaborateRequest(index, shouldAccept(index), index.length > 0 ? 1 : 0);
}

export function summarizeRequest(request: CollaborateRequest): string {
  const verdict = request.accepted ? text('collab_verdict_accept') : text('collab_verdict_reject');
  return text2('collab_summary', request.describe(), verdict);
}

export function toggleAccepted(accepted: boolean): boolean {
  return !accepted;
}
