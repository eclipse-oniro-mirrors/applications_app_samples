/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointConstants } from '../../../main/ets/constants/BreakpointConstants';

const DOMAIN: number = 0xF814;
const TAG: string = 'BreakpointConstantsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function breakpointConstantsCoreTest(): void {
  describe('BreakpointConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0301
     * @tc.name      testBreakpoint0301
     * @tc.desc      Checks BREAKPOINT_SM is the small breakpoint token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0301 begin');
      const actual: string = BreakpointConstants.BREAKPOINT_SM;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='sm'`);
      expect(actual).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testBreakpoint0301 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0302
     * @tc.name      testBreakpoint0302
     * @tc.desc      Checks BREAKPOINT_MD is the middle breakpoint token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0302 begin');
      const actual: string = BreakpointConstants.BREAKPOINT_MD;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='md'`);
      expect(actual).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testBreakpoint0302 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0303
     * @tc.name      testBreakpoint0303
     * @tc.desc      Checks BREAKPOINT_LG is the large breakpoint token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0303 begin');
      const actual: string = BreakpointConstants.BREAKPOINT_LG;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='lg'`);
      expect(actual).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testBreakpoint0303 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0304
     * @tc.name      testBreakpoint0304
     * @tc.desc      Checks the three breakpoint tokens are pairwise distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0304 begin');
      const sm: string = BreakpointConstants.BREAKPOINT_SM;
      const md: string = BreakpointConstants.BREAKPOINT_MD;
      const lg: string = BreakpointConstants.BREAKPOINT_LG;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue sm !== md=${sm !== md}`);
      expect(sm !== md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue md !== lg=${md !== lg}`);
      expect(md !== lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue sm !== lg=${sm !== lg}`);
      expect(sm !== lg).assertTrue();
      log('testBreakpoint0304 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0305
     * @tc.name      testBreakpoint0305
     * @tc.desc      Checks BREAKPOINT_RANGES holds exactly three thresholds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0305 begin');
      const ranges: number[] = BreakpointConstants.BREAKPOINT_RANGES;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ranges.length=${ranges.length}, expected=3`);
      expect(ranges.length).assertEqual(3);
      log('testBreakpoint0305 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0306
     * @tc.name      testBreakpoint0306
     * @tc.desc      Checks BREAKPOINT_RANGES lower threshold is 320.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0306 begin');
      const actual: number = BreakpointConstants.BREAKPOINT_RANGES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=320`);
      expect(actual).assertEqual(320);
      log('testBreakpoint0306 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0307
     * @tc.name      testBreakpoint0307
     * @tc.desc      Checks BREAKPOINT_RANGES middle threshold is 600.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0307 begin');
      const actual: number = BreakpointConstants.BREAKPOINT_RANGES[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      log('testBreakpoint0307 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0308
     * @tc.name      testBreakpoint0308
     * @tc.desc      Checks BREAKPOINT_RANGES upper threshold is 840.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0308 begin');
      const actual: number = BreakpointConstants.BREAKPOINT_RANGES[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=840`);
      expect(actual).assertEqual(840);
      log('testBreakpoint0308 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0309
     * @tc.name      testBreakpoint0309
     * @tc.desc      Checks BREAKPOINT_RANGES thresholds are strictly increasing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0309 begin');
      const ranges: number[] = BreakpointConstants.BREAKPOINT_RANGES;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess ranges[0]=${ranges[0]}, expected=ranges[1]`);
      expect(ranges[0]).assertLess(ranges[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess ranges[1]=${ranges[1]}, expected=ranges[2]`);
      expect(ranges[1]).assertLess(ranges[2]);
      log('testBreakpoint0309 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0310
     * @tc.name      testBreakpoint0310
     * @tc.desc      Checks GRID_ROW_COLUMNS defines three column buckets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0310 begin');
      const columns: number[] = BreakpointConstants.GRID_ROW_COLUMNS;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual columns.length=${columns.length}, expected=3`);
      expect(columns.length).assertEqual(3);
      log('testBreakpoint0310 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0311
     * @tc.name      testBreakpoint0311
     * @tc.desc      Checks GRID_ROW_COLUMNS small bucket is 4 columns.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0311 begin');
      const actual: number = BreakpointConstants.GRID_ROW_COLUMNS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      log('testBreakpoint0311 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0312
     * @tc.name      testBreakpoint0312
     * @tc.desc      Checks GRID_ROW_COLUMNS middle bucket is 8 columns.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0312 begin');
      const actual: number = BreakpointConstants.GRID_ROW_COLUMNS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=8`);
      expect(actual).assertEqual(8);
      log('testBreakpoint0312 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0313
     * @tc.name      testBreakpoint0313
     * @tc.desc      Checks GRID_ROW_COLUMNS large bucket is 12 columns.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0313 begin');
      const actual: number = BreakpointConstants.GRID_ROW_COLUMNS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=12`);
      expect(actual).assertEqual(12);
      log('testBreakpoint0313 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0314
     * @tc.name      testBreakpoint0314
     * @tc.desc      Checks GRID_ROW_COLUMNS buckets are strictly increasing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0314 begin');
      const columns: number[] = BreakpointConstants.GRID_ROW_COLUMNS;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess columns[0]=${columns[0]}, expected=columns[1]`);
      expect(columns[0]).assertLess(columns[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess columns[1]=${columns[1]}, expected=columns[2]`);
      expect(columns[1]).assertLess(columns[2]);
      log('testBreakpoint0314 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0315
     * @tc.name      testBreakpoint0315
     * @tc.desc      Checks GRID_COLUMN_SPANS defines three span buckets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0315 begin');
      const spans: number[] = BreakpointConstants.GRID_COLUMN_SPANS;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual spans.length=${spans.length}, expected=3`);
      expect(spans.length).assertEqual(3);
      log('testBreakpoint0315 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0316
     * @tc.name      testBreakpoint0316
     * @tc.desc      Checks GRID_COLUMN_SPANS small span is 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0316 begin');
      const actual: number = BreakpointConstants.GRID_COLUMN_SPANS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testBreakpoint0316 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0317
     * @tc.name      testBreakpoint0317
     * @tc.desc      Checks GRID_COLUMN_SPANS middle span is 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0317 begin');
      const actual: number = BreakpointConstants.GRID_COLUMN_SPANS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      log('testBreakpoint0317 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0318
     * @tc.name      testBreakpoint0318
     * @tc.desc      Checks GRID_COLUMN_SPANS large span is 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0318 begin');
      const actual: number = BreakpointConstants.GRID_COLUMN_SPANS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=8`);
      expect(actual).assertEqual(8);
      log('testBreakpoint0318 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0319
     * @tc.name      testBreakpoint0319
     * @tc.desc      Checks every span bucket never exceeds its column bucket.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0319 begin');
      const spans: number[] = BreakpointConstants.GRID_COLUMN_SPANS;
      const columns: number[] = BreakpointConstants.GRID_ROW_COLUMNS;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLessOrEqual spans[0]=${spans[0]}, expected=columns[0]`);
      expect(spans[0]).assertLessOrEqual(columns[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLessOrEqual spans[1]=${spans[1]}, expected=columns[1]`);
      expect(spans[1]).assertLessOrEqual(columns[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLessOrEqual spans[2]=${spans[2]}, expected=columns[2]`);
      expect(spans[2]).assertLessOrEqual(columns[2]);
      log('testBreakpoint0319 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0320
     * @tc.name      testBreakpoint0320
     * @tc.desc      Checks breakpoint tokens and ranges keep a one-to-one count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0320 begin');
      const tokenCount: number = 3;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${BreakpointConstants.BREAKPOINT_RANGES.length}`);
      expect(BreakpointConstants.BREAKPOINT_RANGES.length).assertEqual(tokenCount);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${BreakpointConstants.GRID_ROW_COLUMNS.length}`);
      expect(BreakpointConstants.GRID_ROW_COLUMNS.length).assertEqual(tokenCount);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${BreakpointConstants.GRID_COLUMN_SPANS.length}`);
      expect(BreakpointConstants.GRID_COLUMN_SPANS.length).assertEqual(tokenCount);
      log('testBreakpoint0320 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_0321
     * @tc.name      testBreakpoint0321
     * @tc.desc      Checks all breakpoint and grid arrays hold numeric entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBreakpoint0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBreakpoint0321 begin');
      const ranges: number[] = BreakpointConstants.BREAKPOINT_RANGES;
      const columns: number[] = BreakpointConstants.GRID_ROW_COLUMNS;
      const spans: number[] = BreakpointConstants.GRID_COLUMN_SPANS;
      let allNumeric: boolean = true;
      for (let i: number = 0; i < ranges.length; i++) {
        if (typeof ranges[i] !== 'number') {
          allNumeric = false;
        }
      }
      for (let i: number = 0; i < columns.length; i++) {
        if (typeof columns[i] !== 'number') {
          allNumeric = false;
        }
      }
      for (let i: number = 0; i < spans.length; i++) {
        if (typeof spans[i] !== 'number') {
          allNumeric = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNumeric=${allNumeric}`);
      expect(allNumeric).assertTrue();
      log('testBreakpoint0321 end');
    })
  })
}
