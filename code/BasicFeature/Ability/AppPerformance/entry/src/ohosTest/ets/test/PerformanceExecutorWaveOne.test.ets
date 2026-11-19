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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import { SafeExecutor } from '../../../main/ets/core/SafeExecutor';
import { WaveExecutorClock, WaveReply, waveDrain } from '../support/PerformanceWaveOneFixtures';

export default function performanceExecutorWaveOneTests(): void {
  describe('PerformanceExecutorWaveOne', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0100
     * @tc.name testPerformanceExecutorWaveOne0001
     * @tc.desc 非持有者与停止后的等待不执行任务，也不创建定时器
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0001', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      let calls = 0;
      const action = (): Promise<number> => { calls++; return Promise.resolve(9); };
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:35 assertEqual actual', (await executor.wait(0, action)).status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:35 assertEqual expected', 'cancelled'));
      const token = executor.acquire();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:37 assertEqual actual', (await executor.wait(token + 1, action)).status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:37 assertEqual expected', 'cancelled'));
      executor.cancel();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:39 assertEqual actual', (await executor.wait(token, action)).status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:39 assertEqual expected', 'cancelled'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:40 assertEqual actual', calls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:40 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:41 assertEqual actual', clock.timeoutDelays.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0001 PerformanceExecutorWaveOne.test:41 assertEqual expected', 0));
      executor.release(token);
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0200
     * @tc.name testPerformanceExecutorWaveOne0002
     * @tc.desc 零值、false与undefined都作为成功值交付并清理各自定时器
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0002', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const token = executor.acquire();
      const zero = await executor.wait(token, (): Promise<number> => Promise.resolve(0));
      const no = await executor.wait(token, (): Promise<boolean> => Promise.resolve(false));
      const empty = await executor.wait(token, (): Promise<void> => Promise.resolve());
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:60 assertEqual actual', zero.value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:60 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:61 assertFalse actual', no.value)).assertFalse();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:62 assertEqual actual', empty.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:62 assertEqual expected', 'success'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:63 assertUndefined actual', empty.error)).assertUndefined();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:64 assertEqual actual', clock.clearedTimeouts.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:64 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0002 PerformanceExecutorWaveOne.test:65 assertTrue actual', executor.busy())).assertTrue();
      executor.release(token);
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0300
     * @tc.name testPerformanceExecutorWaveOne0003
     * @tc.desc 异步拒绝保留原始异常，当前持有者可继续下一阶段
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0003', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      let notifications = 0;
      const executor = new SafeExecutor(clock, (): void => { notifications++; });
      const token = executor.acquire();
      const failure = new Error('async failure');
      const result = await executor.wait(token, (): Promise<number> => Promise.reject(failure));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:84 assertEqual actual', result.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:84 assertEqual expected', 'error'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:85 assertTrue actual', result.error === failure)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:86 assertUndefined actual', result.value)).assertUndefined();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:87 assertEqual actual', notifications)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:87 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:88 assertEqual actual', (await executor.wait(token, (): Promise<number> => Promise.resolve(42))).value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:88 assertEqual expected', 42));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:89 assertEqual actual', clock.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0003 PerformanceExecutorWaveOne.test:89 assertEqual expected', 0));
      executor.release(token);
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0400
     * @tc.name testPerformanceExecutorWaveOne0004
     * @tc.desc 同步抛错被转换为等待结果，任务计数与定时器不会泄漏
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0004', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const token = executor.acquire();
      const failure = new Error('before promise');
      const result = await executor.wait(token, (): Promise<number> => { throw failure; });
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:107 assertTrue actual', result.error === failure)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:108 assertEqual actual', result.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:108 assertEqual expected', 'error'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:109 assertEqual actual', clock.clearedTimeouts.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:109 assertEqual expected', 1));
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:111 assertFalse actual', executor.busy())).assertFalse();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0004 PerformanceExecutorWaveOne.test:112 assertTrue actual', executor.acquire() > token)).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0500
     * @tc.name testPerformanceExecutorWaveOne0005
     * @tc.desc 截止前一毫秒不结束，到达指定截止才进入隔离
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0005', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const reply = new WaveReply<number>();
      const token = executor.acquire();
      const statuses: string[] = [];
      const pending = executor.wait(token, (): Promise<number> => reply.promise, 25).then((result): void => {
        statuses.push(result.status);
      });
      clock.advance(24); await waveDrain();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:133 assertEqual actual', statuses.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:133 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:134 assertFalse actual', executor.quarantined())).assertFalse();
      clock.advance(1); await pending;
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:136 assertEqual actual', statuses.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:136 assertEqual expected', 'timeout'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:137 assertEqual actual', clock.timeoutDelays[0])).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:137 assertEqual expected', 25));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0005 PerformanceExecutorWaveOne.test:138 assertTrue actual', executor.quarantined())).assertTrue();
      executor.release(token); reply.resolve(7); await waveDrain();
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0600
     * @tc.name testPerformanceExecutorWaveOne0006
     * @tc.desc 超时后的迟到成功只排空底层任务，不修改已返回的结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0006', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const reply = new WaveReply<string>();
      const token = executor.acquire();
      const pending = executor.wait(token, (): Promise<string> => reply.promise);
      clock.advance(10000);
      const result = await pending;
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:159 assertEqual actual', executor.acquire())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:159 assertEqual expected', 0));
      reply.resolve('late value'); await waveDrain();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:161 assertEqual actual', result.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:161 assertEqual expected', 'timeout'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:162 assertUndefined actual', result.value)).assertUndefined();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:163 assertFalse actual', executor.busy())).assertFalse();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:164 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:164 assertEqual expected', 'timeout'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:165 assertEqual actual', clock.timeoutDelays[0])).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0006 PerformanceExecutorWaveOne.test:165 assertEqual expected', 10000));
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0700
     * @tc.name testPerformanceExecutorWaveOne0007
     * @tc.desc 超时后的迟到拒绝不会替换终态，排空后新任务清除停止原因
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0007', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      let notifications = 0;
      const executor = new SafeExecutor(clock, (): void => { notifications++; });
      const reply = new WaveReply<number>();
      const first = executor.acquire();
      const pending = executor.wait(first, (): Promise<number> => reply.promise, 1);
      clock.advance(1);
      const result = await pending;
      executor.release(first);
      reply.reject(new Error('late rejection')); await waveDrain();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:187 assertUndefined actual', result.error)).assertUndefined();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:188 assertEqual actual', notifications)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:188 assertEqual expected', 3));
      const second = executor.acquire();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:190 assertTrue actual', second > first)).assertTrue();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:191 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:191 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:192 assertEqual actual', (await executor.wait(second, (): Promise<number> => Promise.resolve(8))).value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0007 PerformanceExecutorWaveOne.test:192 assertEqual expected', 8));
      executor.release(second);
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0800
     * @tc.name testPerformanceExecutorWaveOne0008
     * @tc.desc 取消清除本地时钟但未结算任务继续占用执行器
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0008', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const reply = new WaveReply<number>();
      const token = executor.acquire();
      const pending = executor.wait(token, (): Promise<number> => reply.promise, 30);
      executor.cancel();
      const result = await pending;
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:212 assertEqual actual', result.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:212 assertEqual expected', 'cancelled'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:213 assertEqual actual', clock.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:213 assertEqual expected', 0));
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:215 assertEqual actual', executor.acquire())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:215 assertEqual expected', 0));
      clock.advance(100); reply.resolve(5); await waveDrain();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:217 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:217 assertEqual expected', 'cancelled'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0008 PerformanceExecutorWaveOne.test:218 assertFalse actual', executor.busy())).assertFalse();
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_0900
     * @tc.name testPerformanceExecutorWaveOne0009
     * @tc.desc 释放持有权不取消在途任务，空持有者取消也不截断结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0009', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const reply = new WaveReply<number>();
      const token = executor.acquire();
      const pending = executor.wait(token, (): Promise<number> => reply.promise);
      executor.release(token);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:236 assertTrue actual', executor.quarantined())).assertTrue();
      executor.cancel();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:238 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:238 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:239 assertEqual actual', clock.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:239 assertEqual expected', 1));
      reply.resolve(91);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:241 assertEqual actual', (await pending).value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:241 assertEqual expected', 91));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0009 PerformanceExecutorWaveOne.test:242 assertFalse actual', executor.busy())).assertFalse();
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_1000
     * @tc.name testPerformanceExecutorWaveOne0010
     * @tc.desc 旧令牌不能释放或执行新一轮持有者的任务
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0010', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const first = executor.acquire();
      executor.release(first);
      const second = executor.acquire();
      let oldCalls = 0;
      const stale = await executor.wait(first, (): Promise<number> => { oldCalls++; return Promise.resolve(1); });
      executor.release(first);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:262 assertEqual actual', stale.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:262 assertEqual expected', 'cancelled'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:263 assertEqual actual', oldCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:263 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:264 assertEqual actual', executor.acquire())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:264 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:265 assertEqual actual', (await executor.wait(second, (): Promise<number> => Promise.resolve(2))).value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:265 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:266 assertEqual actual', clock.timeoutDelays.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0010 PerformanceExecutorWaveOne.test:266 assertEqual expected', 1));
      executor.release(second);
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_1100
     * @tc.name testPerformanceExecutorWaveOne0011
     * @tc.desc 已完成阶段后取消会阻止同一轮的下一阶段而不改写前一结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0011', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const token = executor.acquire();
      const first = await executor.wait(token, (): Promise<string> => Promise.resolve('first'));
      executor.cancel();
      let nextCalls = 0;
      const next = await executor.wait(token, (): Promise<string> => { nextCalls++; return Promise.resolve('next'); });
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:286 assertEqual actual', first.value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:286 assertEqual expected', 'first'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:287 assertEqual actual', next.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:287 assertEqual expected', 'cancelled'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:288 assertEqual actual', nextCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:288 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:289 assertEqual actual', clock.clearedTimeouts.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:289 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0011 PerformanceExecutorWaveOne.test:290 assertFalse actual', executor.quarantined())).assertFalse();
      executor.release(token);
    });

    /**
     * @tc.number SUB_PERFORMANCE_EXECUTORWAVEONE_1200
     * @tc.name testPerformanceExecutorWaveOne0012
     * @tc.desc 已清除的旧截止不会污染随后较长的等待
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceExecutorWaveOne0012', 0, async (): Promise<void> => {
      const clock = new WaveExecutorClock();
      const executor = new SafeExecutor(clock, (): void => {});
      const token = executor.acquire();
      await executor.wait(token, (): Promise<number> => Promise.resolve(1), 5);
      const reply = new WaveReply<number>();
      const statuses: string[] = [];
      const pending = executor.wait(token, (): Promise<number> => reply.promise, 20).then((result): void => {
        statuses.push(result.status);
      });
      clock.advance(5); await waveDrain();
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:313 assertEqual actual', statuses.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:313 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:314 assertEqual actual', executor.reason())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:314 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:315 assertEqual actual', clock.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:315 assertEqual expected', 1));
      reply.resolve(2); await pending;
      clock.advance(20);
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:318 assertEqual actual', statuses.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:318 assertEqual expected', 'success'));
      expect(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:319 assertEqual actual', clock.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceExecutorWaveOne_0012 PerformanceExecutorWaveOne.test:319 assertEqual expected', 0));
      executor.release(token);
    });
  });
}
