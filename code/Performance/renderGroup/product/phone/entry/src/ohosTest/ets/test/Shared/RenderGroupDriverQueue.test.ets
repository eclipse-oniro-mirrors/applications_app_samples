import { describe, it, expect } from '@ohos/hypium';
import { runSerializedUiOperation } from './SharedDriver';

export default function renderGroupDriverQueueTest(): void {
  describe('RenderGroupDriverQueue', () => {
    it('queueReturnsWorkflowResultUnchanged', 0, async () => {
      const expected: string[] = ['first', 'second'];
      const result = await runSerializedUiOperation(async (): Promise<string[]> => expected);
      expect(result === expected).assertTrue();
      expect(result.join(',')).assertEqual('first,second');
    });

    it('queueWaitsForPendingWorkflowBeforeStartingNext', 0, async () => {
      const order: string[] = [];
      let releaseGate: () => void = () => {};
      let markStarted: () => void = () => {};
      const started = new Promise<void>((resolve) => {
        markStarted = resolve;
      });
      const gate = new Promise<void>((resolve) => {
        releaseGate = resolve;
      });
      const first = runSerializedUiOperation(async () => {
        order.push('first-start');
        markStarted();
        await gate;
        order.push('first-end');
      });
      const second = runSerializedUiOperation(async () => {
        order.push('second-start');
      });
      try {
        await started;
        expect(order.join(',')).assertEqual('first-start');
      } finally {
        releaseGate();
        await Promise.all([first, second]);
      }
      expect(order.join(',')).assertEqual('first-start,first-end,second-start');
    });

    it('queuePropagatesOriginalFailureAndRunsFollowingWorkflow', 0, async () => {
      const expected = new Error('original queue failure');
      const failed = runSerializedUiOperation(async (): Promise<void> => {
        throw expected;
      });
      const observed = failed.then(() => false, (error: Error) => {
        expect(error.name).assertEqual('Error');
        expect(error.message).assertEqual('original queue failure');
        return error === expected;
      });
      const next = runSerializedUiOperation(async (): Promise<string> => 'recovered');
      expect(await observed).assertTrue();
      expect(await next).assertEqual('recovered');
    });

    it('queueRecoversAfterSynchronousActionThrows', 0, async () => {
      const expected = new Error('synchronous queue failure');
      const failed = runSerializedUiOperation((): Promise<string> => {
        throw expected;
      });
      const observed = failed.then(() => false, (error: Error) => error === expected);
      const recovery = runSerializedUiOperation(async (): Promise<number> => 42);
      expect(await observed).assertTrue();
      expect(await recovery).assertEqual(42);
    });

    it('queueRunsWorkEnqueuedInsideAnActionAfterExistingWaiters', 0, async () => {
      const order: string[] = [];
      let nested: Promise<void> = Promise.resolve();
      const first = runSerializedUiOperation(async () => {
        order.push('first');
        nested = runSerializedUiOperation(async () => {
          order.push('nested');
        });
      });
      const second = runSerializedUiOperation(async () => {
        order.push('second');
      });
      await Promise.all([first, second]);
      await nested;
      expect(order.join(',')).assertEqual('first,second,nested');
    });
  });
}
