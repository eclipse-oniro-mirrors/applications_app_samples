import { describe, expect, it } from '@ohos/hypium';
import { runSerialized } from './Shared/PerformanceDriver';

export default function driverQueueTest(): void {
  describe('PerformanceDriverQueue', () => {
    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0100
     * @tc.name serializedScenariosDoNotOverlapAndPreserveTheirResults
     * @tc.desc Serialized Scenarios Do Not Overlap And Preserve Their Results.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('serializedScenariosDoNotOverlapAndPreserveTheirResults', 0, async () => {
      const events: string[] = [];
      const first = runSerialized(async () => {
        events.push('first-start');
        await Promise.resolve();
        events.push('first-end');
        return 7;
      });
      const second = runSerialized(async () => {
        events.push('second-start');
        await Promise.resolve();
        events.push('second-end');
        return 11;
      });
      const results: number[] = await Promise.all([first, second]);
      expect(events.join(',')).assertEqual('first-start,first-end,second-start,second-end');
      expect(results[0]).assertEqual(7);
      expect(results[1]).assertEqual(11);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0200
     * @tc.name rejectedScenarioPropagatesItsErrorWithoutBlockingTheQueue
     * @tc.desc then: Rejected Scenario Propagates Its Error Without Blocking The Queue.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('rejectedScenarioPropagatesItsErrorWithoutBlockingTheQueue', 0, async () => {
      const events: string[] = [];
      const first = runSerialized(async () => {
        events.push('failed-start');
        await Promise.resolve();
        throw new Error('scenario failure');
      });
      const observedFailure = first.then(() => 'unexpected success', (error: Error) => error.message);
      const second = runSerialized(async () => {
        events.push('next-start');
        return 23;
      });
      expect(await observedFailure).assertEqual('scenario failure');
      expect(await second).assertEqual(23);
      expect(events.join(',')).assertEqual('failed-start,next-start');
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0300
     * @tc.name synchronousFailureDoesNotPoisonTheQueue
     * @tc.desc A synchronous exception inside the action rejects its result and releases later work.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('synchronousFailureDoesNotPoisonTheQueue', 0, async () => {
      const first = runSerialized<number>(() => { throw new Error('sync failure'); });
      const observed = first.then(() => 'unexpected success', (error: Error) => error.message);
      const next = runSerialized(async () => 37);
      expect(await observed).assertEqual('sync failure');
      expect(await next).assertEqual(37);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0400
     * @tc.name consecutiveFailuresStillPermitSuccessfulWork
     * @tc.desc More than one rejected scenario cannot leave the shared queue rejected.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('consecutiveFailuresStillPermitSuccessfulWork', 0, async () => {
      const first = runSerialized(async () => { throw new Error('first failure'); });
      const firstError = first.then(() => '', (error: Error) => error.message);
      const second = runSerialized(async () => { throw new Error('second failure'); });
      const secondError = second.then(() => '', (error: Error) => error.message);
      const third = runSerialized(async () => 43);
      expect(await firstError).assertEqual('first failure');
      expect(await secondError).assertEqual('second failure');
      expect(await third).assertEqual(43);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0500
     * @tc.name falsyResultsAreForwardedWithoutReplacement
     * @tc.desc Valid false, zero, empty text and undefined results must remain unchanged.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('falsyResultsAreForwardedWithoutReplacement', 0, async () => {
      const falseResult = await runSerialized(async () => false);
      const zeroResult = await runSerialized(async () => 0);
      const emptyResult = await runSerialized(async () => '');
      const undefinedResult = await runSerialized(async (): Promise<void> => {});
      expect(falseResult).assertFalse();
      expect(zeroResult).assertEqual(0);
      expect(emptyResult).assertEqual('');
      expect(undefinedResult === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0600
     * @tc.name resultObjectsPreserveTheirIdentity
     * @tc.desc The queue forwards the original result object without serializing or cloning it.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('resultObjectsPreserveTheirIdentity', 0, async () => {
      const expected: number[] = [7, 13];
      const result = await runSerialized(async () => expected);
      expect(result === expected).assertTrue();
      result.push(19);
      expect(expected.join(',')).assertEqual('7,13,19');
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0700
     * @tc.name rejectionPreservesTheOriginalErrorObject
     * @tc.desc Callers must receive the original error including its custom message.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('rejectionPreservesTheOriginalErrorObject', 0, async () => {
      const expected = new Error('original queue failure');
      const failed = runSerialized(async () => { throw expected; });
      const observed = await failed.then(() => new Error('unexpected success'),
        (error: Error) => error);
      expect(observed === expected).assertTrue();
      expect(observed.message).assertEqual('original queue failure');
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0800
     * @tc.name newWorkAfterIdleStartsAndCompletesNormally
     * @tc.desc Work scheduled after a completed batch must still use the same functional queue.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('newWorkAfterIdleStartsAndCompletesNormally', 0, async () => {
      const first = await runSerialized(async () => 11);
      await Promise.resolve();
      const second = await runSerialized(async () => 17);
      expect(first).assertEqual(11);
      expect(second).assertEqual(17);
    });

    /**
     * @tc.number SUB_PERFORMANCE_DRIVERQUEUE_0900
     * @tc.name eachQueuedActionRunsExactlyOnce
     * @tc.desc Scheduling and result observation must not invoke an action more than once.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('eachQueuedActionRunsExactlyOnce', 0, async () => {
      let firstCalls = 0;
      let secondCalls = 0;
      const first = runSerialized(async () => { firstCalls++; return 5; });
      const second = runSerialized(async () => { secondCalls++; return 9; });
      expect(await first).assertEqual(5);
      expect(await first).assertEqual(5);
      expect(await second).assertEqual(9);
      expect(firstCalls).assertEqual(1);
      expect(secondCalls).assertEqual(1);
    });
  });
}
