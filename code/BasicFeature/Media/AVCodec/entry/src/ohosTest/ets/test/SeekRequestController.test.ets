/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, expect, it } from '@ohos/hypium';
import { SeekRequestController } from '../../../main/ets/controller/SeekRequestController';
import { runAsyncTestCase } from './TestCaseLogger';

class ControlledSeek {
  targets: number[] = [];
  complete: ((success: boolean) => void) | undefined = undefined;
  started: (() => void) | undefined = undefined;

  execute(targetUs: number): Promise<boolean> {
    this.targets.push(targetUs);
    const result = new Promise<boolean>((resolve) => this.complete = resolve);
    this.started?.();
    return result;
  }

  waitForStart(): Promise<void> {
    return new Promise<void>((resolve) => this.started = resolve);
  }
}

export default function seekRequestControllerTest(): void {
  describe('SeekRequestControllerTest', () => {
    it('AVCodec_SeekQueue_LatestTarget_001', 0, async () => {
      await runAsyncTestCase('AVCodec_SeekQueue_LatestTarget_001', async () => {
        const worker = new ControlledSeek();
        const queue = new SeekRequestController((targetUs: number) => worker.execute(targetUs));
        const started = worker.waitForStart();
        const first = queue.request(1000000);
        const second = queue.request(2000000);
        const last = queue.request(3000000);
        expect(await first).assertEqual('superseded');
        expect(await second).assertEqual('superseded');
        await started;
        expect(worker.targets.length).assertEqual(1);
        expect(worker.targets[0]).assertEqual(3000000);
        worker.complete?.(true);
        expect(await last).assertEqual('completed');
        expect(queue.merged).assertEqual(2);
        expect(queue.isBusy()).assertFalse();
      });
    });
    it('AVCodec_SeekQueue_SingleWorker_002', 0, async () => {
      await runAsyncTestCase('AVCodec_SeekQueue_SingleWorker_002', async () => {
        const worker = new ControlledSeek();
        const queue = new SeekRequestController((targetUs: number) => worker.execute(targetUs));
        const started = worker.waitForStart();
        const first = queue.request(1000000);
        await started;
        const second = queue.request(2000000);
        const last = queue.request(3000000);
        expect(await second).assertEqual('superseded');
        expect(worker.targets.length).assertEqual(1);
        worker.complete?.(true);
        expect(await first).assertEqual('completed');
        expect(worker.targets.length).assertEqual(2);
        expect(worker.targets[1]).assertEqual(3000000);
        worker.complete?.(true);
        expect(await last).assertEqual('completed');
        await queue.waitForIdle();
        expect(queue.completed).assertEqual(2);
      });
    });
    it('AVCodec_SeekQueue_StopInvalidates_003', 0, async () => {
      await runAsyncTestCase('AVCodec_SeekQueue_StopInvalidates_003', async () => {
        const worker = new ControlledSeek();
        const queue = new SeekRequestController((targetUs: number) => worker.execute(targetUs));
        const started = worker.waitForStart();
        const first = queue.request(1000000);
        await started;
        const pending = queue.request(2000000);
        queue.cancel();
        expect(await pending).assertEqual('cancelled');
        expect(queue.isBusy()).assertTrue();
        worker.complete?.(true);
        expect(await first).assertEqual('cancelled');
        await queue.waitForIdle();
        expect(worker.targets.length).assertEqual(1);
        expect(queue.completed).assertEqual(0);
      });
    });
    it('AVCodec_SeekQueue_FailureAndReuse_004', 0, async () => {
      await runAsyncTestCase('AVCodec_SeekQueue_FailureAndReuse_004', async () => {
        const queue = new SeekRequestController(async (targetUs: number): Promise<boolean> => {
          if (targetUs === 0) {
            throw new Error('Decoder rebuild failed');
          }
          return true;
        });
        expect(await queue.request(0)).assertEqual('failed');
        expect(queue.isBusy()).assertFalse();
        expect(await queue.request(1000000)).assertEqual('completed');
        const cancelled = queue.request(2000000);
        queue.cancel();
        expect(await cancelled).assertEqual('cancelled');
        queue.resetStatistics();
        expect(queue.submitted).assertEqual(0);
        expect(queue.isBusy()).assertFalse();
      });
    });
  });
}
