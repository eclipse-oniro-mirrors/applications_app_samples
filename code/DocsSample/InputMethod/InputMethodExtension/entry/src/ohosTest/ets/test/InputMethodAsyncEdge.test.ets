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

import { describe, expect, it } from '@ohos/hypium';
import { ERROR_CODE_LOCAL_TIMEOUT } from '../../../main/ets/model/CallOutcome';
import {
  TIMEOUT_FLAG,
  isTimeoutError,
  timeoutPromise,
  timeoutText,
  withTimeout
} from '../../../main/ets/utils/AsyncUtil';

/** 永不 settle 的 Promise：用来逼出超时分支，不依赖网络或系统接口 */
function neverSettles(): Promise<number> {
  return new Promise<number>((_resolve: (value: number) => void) => {
    // 故意不调用 resolve/reject
  });
}

/** 延迟 resolve：验证"工作先完成"时返回的是工作的值，而不是超时 */
function resolvesAfter(ms: number, value: number): Promise<number> {
  return new Promise<number>((resolve: (v: number) => void) => {
    setTimeout(() => {
      resolve(value);
    }, ms);
  });
}

/** 截断后的错误信息：catch 块里只能拿到 Object，统一在这里取文本 */
function messageOf(err: Object): string {
  return (err as Error).message;
}

/**
 * 异步等待上限的边界：超时占位码、超时文案、工作先完成、工作先失败、反复超时。
 *
 * 这一层决定了页面会不会一直停在"处理中"，又不能在失败时把底层调用说成已经结束，
 * 因此每条都从"结果从哪来"入手断言，而不是只看某个字符串。
 */
export default function inputMethodAsyncEdgeTest() {
  describe('InputMethodAsyncEdgeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0100
     * @tc.name testAsyncEdge0001
     * @tc.desc Verify the flag is a space free uppercase literal, so it survives hilog filtering intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0001', 0, () => {
      expect(TIMEOUT_FLAG).assertEqual('LOCAL_TIMEOUT');
      expect(TIMEOUT_FLAG.length > 0).assertTrue();
      expect(TIMEOUT_FLAG.includes(' ')).assertFalse();
      expect(TIMEOUT_FLAG.toUpperCase()).assertEqual(TIMEOUT_FLAG);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0200
     * @tc.name testAsyncEdge0002
     * @tc.desc Verify the timeout sentence carries the exact wait limit it was given, including zero and negative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0002', 0, () => {
      expect(timeoutText(8000)).assertEqual('等待超过 8000 ms 仍未回调');
      expect(timeoutText(0)).assertEqual('等待超过 0 ms 仍未回调');
      expect(timeoutText(-5).includes('-5')).assertTrue();
      expect(timeoutText(300000).startsWith('等待超过 300000')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0300
     * @tc.name testAsyncEdge0003
     * @tc.desc Verify the bare timer promise rejects with the flag instead of resolving undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0003', 0, async (done: Function) => {
      let text = '';
      let flagged = false;
      try {
        await timeoutPromise<number>(1);
      } catch (err) {
        text = messageOf(err);
        flagged = isTimeoutError(err);
      }
      expect(flagged).assertTrue();
      expect(text).assertEqual(TIMEOUT_FLAG);
      expect(text.includes(TIMEOUT_FLAG)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0400
     * @tc.name testAsyncEdge0004
     * @tc.desc Verify a promise that settles inside the budget returns its own value, untouched by the timeout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0004', 0, async (done: Function) => {
      const number = await withTimeout<number>(resolvesAfter(1, 42), 5000);
      const text = await withTimeout<string>(Promise.resolve('ok'), 5000);
      expect(number).assertEqual(42);
      expect(text).assertEqual('ok');
      expect(typeof number).assertEqual('number');
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0500
     * @tc.name testAsyncEdge0005
     * @tc.desc Verify a promise that never settles is reported as a timeout rather than hanging the test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0005', 0, async (done: Function) => {
      let flagged = false;
      let text = '';
      try {
        await withTimeout<number>(neverSettles(), 1);
      } catch (err) {
        flagged = isTimeoutError(err);
        text = messageOf(err);
      }
      expect(flagged).assertTrue();
      expect(text).assertEqual(TIMEOUT_FLAG);
      expect(flagged).assertEqual(text.includes(TIMEOUT_FLAG));
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0600
     * @tc.name testAsyncEdge0006
     * @tc.desc Verify a real failure inside the budget keeps its own message and is not relabelled as a timeout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0006', 0, async (done: Function) => {
      let text = '';
      let flagged = true;
      try {
        await withTimeout<number>(Promise.reject(new Error('401 bad param')), 5000);
      } catch (err) {
        text = messageOf(err);
        flagged = isTimeoutError(err);
      }
      expect(text).assertEqual('401 bad param');
      expect(flagged).assertFalse();
      expect(text.includes('401')).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0700
     * @tc.name testAsyncEdge0007
     * @tc.desc Verify the flag check matches on the message content and rejects objects that carry no message at all.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0007', 0, () => {
      expect(isTimeoutError(new Error('LOCAL_TIMEOUT'))).assertTrue();
      expect(isTimeoutError(new Error('失败 LOCAL_TIMEOUT 结束'))).assertTrue();
      expect(isTimeoutError(new Error('401'))).assertFalse();
      expect(isTimeoutError(new Error(''))).assertFalse();
      expect(isTimeoutError(new Object())).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0800
     * @tc.name testAsyncEdge0008
     * @tc.desc Verify the flag comparison is case sensitive, so a lowercase message is not mistaken for a timeout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0008', 0, () => {
      expect(isTimeoutError(new Error('local_timeout'))).assertFalse();
      expect(isTimeoutError(new Error('Local_Timeout'))).assertFalse();
      expect(isTimeoutError(new Error('LOCAL_TIMEOUT '))).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_0900
     * @tc.name testAsyncEdge0009
     * @tc.desc Verify two waits in a row each return their own value, so the race does not leak state between calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0009', 0, async (done: Function) => {
      const first = await withTimeout<number>(resolvesAfter(1, 1), 5000);
      const second = await withTimeout<number>(resolvesAfter(1, 2), 5000);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(first === second).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_1000
     * @tc.name testAsyncEdge0010
     * @tc.desc Verify a zero millisecond budget still rejects, so the caller never waits forever on a stuck promise.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0010', 0, async (done: Function) => {
      let flagged = false;
      try {
        await withTimeout<number>(neverSettles(), 0);
      } catch (err) {
        flagged = isTimeoutError(err);
      }
      expect(flagged).assertTrue();
      // 普通错误不会被误判成超时，所以上面的 true 确实是超时判定给出的
      expect(isTimeoutError(new Error('plain'))).assertFalse();
      // 已经 settle 的异步结果在同样的 0ms 预算下仍会正常返回，预算为 0 不等于必然超时
      expect(await withTimeout<number>(Promise.resolve(7), 0)).assertEqual(7);
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_1100
     * @tc.name testAsyncEdge0011
     * @tc.desc Verify the documented local code for a timeout is negative, so it can never be read as success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0011', 0, () => {
      expect(ERROR_CODE_LOCAL_TIMEOUT).assertEqual(-3);
      expect(ERROR_CODE_LOCAL_TIMEOUT < 0).assertTrue();
      expect(Math.abs(ERROR_CODE_LOCAL_TIMEOUT)).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ASYNC_1200
     * @tc.name testAsyncEdge0012
     * @tc.desc Verify five waits in a row all report a timeout, so repeated retries cannot silently
     * swallow the failure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAsyncEdge0012', 0, async (done: Function) => {
      let flaggedCount = 0;
      for (let i = 0; i < 5; i++) {
        try {
          await withTimeout<number>(neverSettles(), 1);
        } catch (err) {
          if (isTimeoutError(err)) {
            flaggedCount++;
          }
        }
      }
      expect(flaggedCount).assertEqual(5);
      expect(flaggedCount > 0).assertTrue();
      expect(flaggedCount === 4).assertFalse();
      done();
    });
  });
}
