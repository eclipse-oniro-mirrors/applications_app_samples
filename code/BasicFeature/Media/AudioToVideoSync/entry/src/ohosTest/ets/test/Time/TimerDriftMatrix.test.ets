/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { systemDateTime } from '@kit.BasicServicesKit';
import { delay, paceTurn } from '../Shared/TestPace';

const NANOS_PER_MILLI: number = 1000000;

export default function timerDriftMatrixTest() {
  describe('timerDriftMatrixTest', () => {
    beforeAll(() => {
      console.info('timerDriftMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('timerDriftMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_TIME_DRIFT_0100
     * @tc.name      testTimerDrift0001
     * @tc.desc      Verify the uptime and wall clocks measure the same five short intervals within tolerance
     */
    it('testTimerDrift0001', 0, async () => {
      for (let i = 0; i < 5; i++) {
        const upBefore: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
        const wallBefore: number = Date.now();
        await delay(50);
        const upAfter: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
        const wallAfter: number = Date.now();
        const upDelta: number = upAfter - upBefore;
        const wallDelta: number = wallAfter - wallBefore;
        expect(upDelta).assertLargerOrEqual(30);
        expect(wallDelta).assertLargerOrEqual(30);
        expect(Math.abs(upDelta - wallDelta)).assertLess(200);
      }
    })

    /**
     * @tc.number    SUB_AVS_TIME_DRIFT_0200
     * @tc.name      testTimerDrift0002
     * @tc.desc      Verify twenty tiny delays complete without a cumulative drift beyond budget
     */
    it('testTimerDrift0002', 0, async () => {
      const upBefore: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const wallBefore: number = Date.now();
      for (let i = 0; i < 20; i++) {
        await delay(5);
      }
      const upDelta: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - upBefore;
      const wallDelta: number = Date.now() - wallBefore;
      expect(upDelta).assertLargerOrEqual(0);
      expect(wallDelta).assertLargerOrEqual(0);
      expect(wallDelta).assertLess(3000);
      expect(Math.abs(upDelta - wallDelta)).assertLess(300);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DRIFT_0300
     * @tc.name      testTimerDrift0003
     * @tc.desc      Verify the nanosecond and millisecond wall clocks stay consistent after a delay
     */
    it('testTimerDrift0003', 0, async () => {
      await delay(20);
      const millis: number = systemDateTime.getTime(false);
      const nanos: number = systemDateTime.getTime(true);
      expect(nanos).assertLarger(0);
      expect(Math.abs(nanos / NANOS_PER_MILLI - millis)).assertLess(2000);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DRIFT_0400
     * @tc.name      testTimerDrift0004
     * @tc.desc      Verify a 100 ms delay is observed by both clocks within the same tolerance
     */
    it('testTimerDrift0004', 0, async () => {
      const upBefore: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      const wallBefore: number = Date.now();
      await delay(100);
      const upDelta: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false) - upBefore;
      const wallDelta: number = Date.now() - wallBefore;
      expect(upDelta).assertLargerOrEqual(80);
      expect(wallDelta).assertLargerOrEqual(80);
      expect(Math.abs(upDelta - wallDelta)).assertLess(250);
    })
  });
}
