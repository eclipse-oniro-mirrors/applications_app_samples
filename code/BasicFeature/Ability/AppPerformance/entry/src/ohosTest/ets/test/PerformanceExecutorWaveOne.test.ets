import { describe, expect, it } from '@ohos/hypium';
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
      expect((await executor.wait(0, action)).status).assertEqual('cancelled');
      const token = executor.acquire();
      expect((await executor.wait(token + 1, action)).status).assertEqual('cancelled');
      executor.cancel();
      expect((await executor.wait(token, action)).status).assertEqual('cancelled');
      expect(calls).assertEqual(0);
      expect(clock.timeoutDelays.length).assertEqual(0);
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
      expect(zero.value).assertEqual(0);
      expect(no.value).assertFalse();
      expect(empty.status).assertEqual('success');
      expect(empty.error).assertUndefined();
      expect(clock.clearedTimeouts.length).assertEqual(3);
      expect(executor.busy()).assertTrue();
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
      expect(result.status).assertEqual('error');
      expect(result.error === failure).assertTrue();
      expect(result.value).assertUndefined();
      expect(notifications).assertEqual(1);
      expect((await executor.wait(token, (): Promise<number> => Promise.resolve(42))).value).assertEqual(42);
      expect(clock.pendingTimers()).assertEqual(0);
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
      expect(result.error === failure).assertTrue();
      expect(result.status).assertEqual('error');
      expect(clock.clearedTimeouts.length).assertEqual(1);
      executor.release(token);
      expect(executor.busy()).assertFalse();
      expect(executor.acquire() > token).assertTrue();
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
      expect(statuses.length).assertEqual(0);
      expect(executor.quarantined()).assertFalse();
      clock.advance(1); await pending;
      expect(statuses.join('|')).assertEqual('timeout');
      expect(clock.timeoutDelays[0]).assertEqual(25);
      expect(executor.quarantined()).assertTrue();
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
      expect(executor.acquire()).assertEqual(0);
      reply.resolve('late value'); await waveDrain();
      expect(result.status).assertEqual('timeout');
      expect(result.value).assertUndefined();
      expect(executor.busy()).assertFalse();
      expect(executor.reason()).assertEqual('timeout');
      expect(clock.timeoutDelays[0]).assertEqual(10000);
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
      expect(result.error).assertUndefined();
      expect(notifications).assertEqual(3);
      const second = executor.acquire();
      expect(second > first).assertTrue();
      expect(executor.reason()).assertEqual('');
      expect((await executor.wait(second, (): Promise<number> => Promise.resolve(8))).value).assertEqual(8);
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
      expect(result.status).assertEqual('cancelled');
      expect(clock.pendingTimers()).assertEqual(0);
      executor.release(token);
      expect(executor.acquire()).assertEqual(0);
      clock.advance(100); reply.resolve(5); await waveDrain();
      expect(executor.reason()).assertEqual('cancelled');
      expect(executor.busy()).assertFalse();
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
      expect(executor.quarantined()).assertTrue();
      executor.cancel();
      expect(executor.reason()).assertEqual('');
      expect(clock.pendingTimers()).assertEqual(1);
      reply.resolve(91);
      expect((await pending).value).assertEqual(91);
      expect(executor.busy()).assertFalse();
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
      expect(stale.status).assertEqual('cancelled');
      expect(oldCalls).assertEqual(0);
      expect(executor.acquire()).assertEqual(0);
      expect((await executor.wait(second, (): Promise<number> => Promise.resolve(2))).value).assertEqual(2);
      expect(clock.timeoutDelays.length).assertEqual(1);
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
      expect(first.value).assertEqual('first');
      expect(next.status).assertEqual('cancelled');
      expect(nextCalls).assertEqual(0);
      expect(clock.clearedTimeouts.length).assertEqual(1);
      expect(executor.quarantined()).assertFalse();
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
      expect(statuses.length).assertEqual(0);
      expect(executor.reason()).assertEqual('');
      expect(clock.pendingTimers()).assertEqual(1);
      reply.resolve(2); await pending;
      clock.advance(20);
      expect(statuses.join('|')).assertEqual('success');
      expect(clock.pendingTimers()).assertEqual(0);
      executor.release(token);
    });
  });
}
