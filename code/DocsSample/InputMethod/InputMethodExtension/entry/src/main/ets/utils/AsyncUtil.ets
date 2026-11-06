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
 * 异步调用的等待上限。
 *
 * 为什么需要它：图像类接口在底层实现异常时，Promise 可能既不 resolve 也不 reject，
 * 页面就会一直停在"处理中"。这里统一套一个上限，超时按本地占位码 -3 记录，
 * 并明确写成"页面不再等待"，不宣称底层调用已经结束。
 */

export const TIMEOUT_FLAG: string = 'LOCAL_TIMEOUT';

export function timeoutPromise<T>(ms: number): Promise<T> {
  return new Promise<T>((_resolve: (value: T) => void, reject: (reason: Object) => void) => {
    setTimeout(() => {
      reject(new Error(TIMEOUT_FLAG));
    }, ms);
  });
}

/** 给任意 Promise 套上限 */
export function withTimeout<T>(work: Promise<T>, ms: number): Promise<T> {
  return Promise.race<T>([work, timeoutPromise<T>(ms)]);
}

export function isTimeoutError(err: Object): boolean {
  const error = err as Error;
  return typeof error.message === 'string' && error.message.includes(TIMEOUT_FLAG);
}

export function timeoutText(ms: number): string {
  return `等待超过 ${ms} ms 仍未回调`;
}
