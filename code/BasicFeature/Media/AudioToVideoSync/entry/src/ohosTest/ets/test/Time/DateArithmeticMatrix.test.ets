/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { paceTurn } from '../Shared/TestPace';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DAY_MS: number = 86400000;


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Time_DateArithmeticMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function dateArithmeticMatrixTest() {
  describe('dateArithmeticMatrixTest', () => {
    beforeAll(() => {
      console.info('dateArithmeticMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('dateArithmeticMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0100
     * @tc.name      testDateArithmetic0001
     * @tc.desc      Verify February 29 exists in a leap year
     */
    it('testDateArithmetic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0001');
      const date: Date = new Date(2024, 1, 29);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    
      logEnd('testDateArithmetic0001');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0200
     * @tc.name      testDateArithmetic0002
     * @tc.desc      Verify February 29 rolls into March 1 in a non-leap year
     */
    it('testDateArithmetic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0002');
      const date: Date = new Date(2023, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    
      logEnd('testDateArithmetic0002');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0300
     * @tc.name      testDateArithmetic0003
     * @tc.desc      Verify the day after January 31 is February 1
     */
    it('testDateArithmetic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0003');
      const date: Date = new Date(2024, 0, 31 + 1);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    
      logEnd('testDateArithmetic0003');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0400
     * @tc.name      testDateArithmetic0004
     * @tc.desc      Verify the millisecond difference between consecutive days is exactly one day
     */
    it('testDateArithmetic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0004');
      const first: Date = new Date(2024, 0, 1);
      const second: Date = new Date(2024, 0, 2);
      expect(second.getTime() - first.getTime()).assertEqual(DAY_MS);
    
      logEnd('testDateArithmetic0004');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0500
     * @tc.name      testDateArithmetic0005
     * @tc.desc      Verify February has twenty-nine days in 2024 and twenty-eight in 2023
     */
    it('testDateArithmetic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0005');
      expect(new Date(2024, 2, 0).getDate()).assertEqual(29);
      expect(new Date(2023, 2, 0).getDate()).assertEqual(28);
    
      logEnd('testDateArithmetic0005');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0600
     * @tc.name      testDateArithmetic0006
     * @tc.desc      Verify month lengths match the calendar for all sampled months
     */
    it('testDateArithmetic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0006');
      const expected: number[] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
      for (let month = 0; month < 12; month++) {
        expect(new Date(2024, month + 1, 0).getDate()).assertEqual(expected[month]);
      }
    
      logEnd('testDateArithmetic0006');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0700
     * @tc.name      testDateArithmetic0007
     * @tc.desc      Verify the timezone offset is a finite minute value inside the legal range
     */
    it('testDateArithmetic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0007');
      const offset: number = new Date().getTimezoneOffset();
      expect(Number.isFinite(offset)).assertTrue();
      expect(Number.isInteger(offset)).assertTrue();
      expect(Math.abs(offset)).assertLessOrEqual(14 * 60);
      expect(offset % 15).assertEqual(0);
    
      logEnd('testDateArithmetic0007');
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_ARITH_0800
     * @tc.name      testDateArithmetic0008
     * @tc.desc      Verify subtracting one day from March 1 lands on February 29 in a leap year
     */
    it('testDateArithmetic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testDateArithmetic0008');
      const date: Date = new Date(new Date(2024, 2, 1).getTime() - DAY_MS);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    
      logEnd('testDateArithmetic0008');
    })
  });
}
