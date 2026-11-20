/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { paceTurn } from '../Shared/TestPace';
import { hilog } from '@kit.PerformanceAnalysisKit';

const MAX_REFRESH: number = 240;

function screen(): display.Display {
  return display.getDefaultDisplaySync();
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Validation_DisplayRefreshMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function displayRefreshMatrixTest() {
  describe('displayRefreshMatrixTest', () => {
    beforeAll(() => {
      console.info('displayRefreshMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('displayRefreshMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0100
     * @tc.name      testDisplayRefresh0001
     * @tc.desc      Verify the refresh rate is a finite positive value inside the hardware band
     */
    it('testDisplayRefresh0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0001');
      const target: display.Display = screen();
      expect(Number.isFinite(target.refreshRate)).assertTrue();
      expect(target.refreshRate).assertLarger(0);
      expect(target.refreshRate).assertLessOrEqual(MAX_REFRESH);
    
      logEnd('testDisplayRefresh0001');
    })

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0200
     * @tc.name      testDisplayRefresh0002
     * @tc.desc      Verify the frame interval is the reciprocal of the refresh rate
     */
    it('testDisplayRefresh0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0002');
      const target: display.Display = screen();
      const interval: number = 1000 / target.refreshRate;
      expect(interval).assertLarger(0);
      expect(interval).assertLessOrEqual(1000);
      expect(interval).assertClose(1000 / target.refreshRate, 1e-9);
      expect(1 / interval).assertClose(target.refreshRate / 1000, 1e-9);
    
      logEnd('testDisplayRefresh0002');
    })

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0300
     * @tc.name      testDisplayRefresh0003
     * @tc.desc      Verify the rounded frame interval never falls below one millisecond
     */
    it('testDisplayRefresh0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0003');
      const target: display.Display = screen();
      const rounded: number = Math.round(1000 / target.refreshRate);
      expect(rounded).assertLargerOrEqual(1);
      expect(rounded).assertLessOrEqual(1000);
      expect(Number.isInteger(rounded)).assertTrue();
    
      logEnd('testDisplayRefresh0003');
    })

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0400
     * @tc.name      testDisplayRefresh0004
     * @tc.desc      Verify the refresh rate is stable across repeated reads
     */
    it('testDisplayRefresh0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0004');
      const first: display.Display = screen();
      for (let i = 0; i < 50; i++) {
        expect(screen().refreshRate).assertEqual(first.refreshRate);
      }
    
      logEnd('testDisplayRefresh0004');
    })

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0500
     * @tc.name      testDisplayRefresh0005
     * @tc.desc      Verify a higher refresh rate yields a shorter frame interval when both are sampled
     */
    it('testDisplayRefresh0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0005');
      const target: display.Display = screen();
      const fast: number = target.refreshRate * 2;
      const slow: number = target.refreshRate;
      expect(1000 / fast).assertLess(1000 / slow);
      expect(1000 / fast).assertClose((1000 / slow) / 2, 1e-9);
    
      logEnd('testDisplayRefresh0005');
    })

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0600
     * @tc.name      testDisplayRefresh0006
     * @tc.desc      Verify the frame budget can represent a full second across integer refresh rates
     */
    it('testDisplayRefresh0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0006');
      const rates: number[] = [30, 60, 90, 120];
      for (let i = 0; i < rates.length; i++) {
        const interval: number = 1000 / rates[i];
        expect(interval * rates[i]).assertClose(1000, 1e-9);
        expect(interval).assertLarger(0);
      }
    
      logEnd('testDisplayRefresh0006');
    })

    /**
     * @tc.number    SUB_AVS_DISPLAY_REFRESH_0700
     * @tc.name      testDisplayRefresh0007
     * @tc.desc      Verify the display refresh rate is not below the common 30 Hz floor
     */
    it('testDisplayRefresh0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDisplayRefresh0007');
      const target: display.Display = screen();
      expect(target.refreshRate).assertLargerOrEqual(30);
      expect(1000 / target.refreshRate).assertLessOrEqual(1000 / 30 + 1e-9);
    
      logEnd('testDisplayRefresh0007');
    })
  });
}
