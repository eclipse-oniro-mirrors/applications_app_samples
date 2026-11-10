/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { systemDateTime } from '@kit.BasicServicesKit';
import { delay, paceTurn } from '../Shared/TestPace';

export default function timerLongDriftMatrixTest() {
  describe('timerLongDriftMatrixTest', () => {
    beforeAll(() => {
      console.info('timerLongDriftMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('timerLongDriftMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_TIME_LONGDRIFT_0100
     * @tc.name      testTimerLongDrift0001
     * @tc.desc      Verify ten fifty-millisecond delays keep both clocks within tolerance
     */
    it('testTimerLongDrift0001', 0, async () => {
      const upBefore: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const wallBefore: number = Date.now();
      for (let i = 0; i < 10; i++) {
        await delay(50);
      }
      const upDelta: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - upBefore;
      const wallDelta: number = Date.now() - wallBefore;
      expect(upDelta).assertLargerOrEqual(400);
      expect(wallDelta).assertLargerOrEqual(400);
      expect(Math.abs(upDelta - wallDelta)).assertLess(500);
    })

    /**
     * @tc.number    SUB_AVS_TIME_LONGDRIFT_0200
     * @tc.name      testTimerLongDrift0002
     * @tc.desc      Verify one hundred tiny delays complete inside the aggregate budget
     */
    it('testTimerLongDrift0002', 0, async () => {
      const start: number = Date.now();
      for (let i = 0; i < 100; i++) {
        await delay(1);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(5000);
    })

    /**
     * @tc.number    SUB_AVS_TIME_LONGDRIFT_0300
     * @tc.name      testTimerLongDrift0003
     * @tc.desc      Verify the uptime clock never moves backwards over fifty sampled reads
     */
    it('testTimerLongDrift0003', 0, () => {
      let previous: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      for (let i = 0; i < 50; i++) {
        const current: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
        expect(current).assertLargerOrEqual(previous);
        previous = current;
      }
      expect(previous).assertLarger(0);
    })
  });
}
