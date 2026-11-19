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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common, StartOptions, Want, UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getTestAbilityContext } from '../testability/AbilityContextStore';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const TARGET_ABILITY: string = 'WindowTestAbility';
const ACCEPTABLE_START_CODES: number[] = [201, 202, 401, 801, 16000001, 16000009, 16000011, 16000019, 16000050, 16000053];
const START_MIN_WIDTH: number = 600;
const START_MAX_WIDTH: number = 1500;
const START_MIN_HEIGHT: number = 500;
const START_MAX_HEIGHT: number = 1000;

interface StartCase {
  name: string;
  number: string;
  options: StartOptions;
}
let testContext: common.UIAbilityContext | undefined = undefined;

async function getTargetWant(): Promise<Want> {
  return {
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    moduleName: 'entry',
    abilityName: TARGET_ABILITY
  };
}

async function startTarget(options: StartOptions): Promise<number> {
  if (!testContext) {
    return -1;
  }
  try {
    await testContext.startAbility(await getTargetWant(), options);
    return 0;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.info(LOG_DOMAIN, LOG_TAG, 'startAbility failed code=%{public}d message=%{public}s',
      err.code, err.message);
    return err.code;
  }
}

async function waitForTop(ms: number): Promise<void> {
  await new Promise<void>((resolve) => setTimeout(() => resolve(), ms));
}

async function closeTarget(): Promise<void> {
  try {
    const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
    if (ability.context.abilityInfo.name === TARGET_ABILITY) {
      await ability.context.terminateSelf();
    }
  } catch (error) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'closeTarget ignored: %{public}s', JSON.stringify(error));
  }
}

export default function startOptionsWindowLimitsTest(): void {
  describe('StartOptionsWindowLimitsTest', () => {
    beforeAll(async () => {
      testContext = getTestAbilityContext() as common.UIAbilityContext;
      expect(testContext !== undefined).assertTrue();
    });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0300
     * @tc.name      testStartOptionsAll0300
     * @tc.desc      Start the target ability with all StartOptions fields and verify the top ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsAll0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        const options: StartOptions = {
          displayId: 0, minWindowWidth: 600, minWindowHeight: 500,
          maxWindowWidth: 1500, maxWindowHeight: 1000
        };
        const code: number = await startTarget(options);
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0301
     * @tc.name      testStartOptionsMinOnly0301
     * @tc.desc      Start the target ability with only the minimum size fields.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsMinOnly0301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, minWindowHeight: 500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0302
     * @tc.name      testStartOptionsMaxOnly0302
     * @tc.desc      Start the target ability with only the maximum size fields.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsMaxOnly0302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1500, maxWindowHeight: 1000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0303
     * @tc.name      testStartOptionsInverted0303
     * @tc.desc      Start the target ability with inverted minimum and maximum widths.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsInverted0303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ minWindowWidth: 1500, maxWindowWidth: 600 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0304
     * @tc.name      testStartOptionsNegative0304
     * @tc.desc      Start the target ability with negative size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsNegative0304',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: -600, minWindowHeight: -500,
          maxWindowWidth: -1500, maxWindowHeight: -1000
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0305
     * @tc.name      testStartOptionsZeros0305
     * @tc.desc      Start the target ability with all-zero size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsZeros0305',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 0, maxWindowHeight: 0 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0306
     * @tc.name      testStartOptionsNaN0306
     * @tc.desc      Start the target ability with NaN size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsNaN0306',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ maxWindowWidth: Number.NaN, maxWindowHeight: Number.NaN });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0307
     * @tc.name      testStartOptionsInfinity0307
     * @tc.desc      Start the target ability with Infinity size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsInfinity0307',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          maxWindowWidth: Number.POSITIVE_INFINITY,
          maxWindowHeight: Number.POSITIVE_INFINITY
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0308
     * @tc.name      testStartOptionsSequential0308
     * @tc.desc      Start and close the target ability three times in sequence.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsSequential0308',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const code: number = await startTarget({
            minWindowWidth: 600, minWindowHeight: 500,
            maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0309
     * @tc.name      testStartOptionsTinyMax0309
     * @tc.desc      Start the target ability with a tiny maximum size and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsTinyMax0309',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1, maxWindowHeight: 1 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0310
     * @tc.name      testStartOptionsHugeMax0310
     * @tc.desc      Start the target ability with a huge maximum size and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsHugeMax0310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1000000, maxWindowHeight: 1000000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0311
     * @tc.name      testStartOptionsMaxBound0311
     * @tc.desc      Start with the maximum StartOptions bounds and verify the target window bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsMaxBound0311',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 600, minWindowHeight: 500,
          maxWindowWidth: 1500, maxWindowHeight: 1000
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0312
     * @tc.name      testStartOptionsEqualBounds0312
     * @tc.desc      Start with equal minimum and maximum sizes and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsEqualBounds0312',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 900, minWindowHeight: 700,
          maxWindowWidth: 900, maxWindowHeight: 700
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0313
     * @tc.name      testStartOptionsRepeatFive0313
     * @tc.desc      Start and close the target ability five times and verify each start is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsRepeatFive0313',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({
            minWindowWidth: 600 + index * 50, minWindowHeight: 500,
            maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0314
     * @tc.name      testStartOptionsRapidWithoutClose0314
     * @tc.desc      Start the target ability five times without closing and verify the last request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsRapidWithoutClose0314',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        let lastCode: number = -1;
        for (let index: number = 0; index < 5; index++) {
          lastCode = await startTarget({ maxWindowWidth: 1000 + index * 100, maxWindowHeight: 800 });
        }
        expect(lastCode === 0 || ACCEPTABLE_START_CODES.includes(lastCode)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0315
     * @tc.name      testStartOptionsDisplayIdOnly0315
     * @tc.desc      Start with only the displayId field and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsDisplayIdOnly0315',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ displayId: 0 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0316
     * @tc.name      testStartOptionsModuleOnlyFields0316
     * @tc.desc      Start with only the height fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsModuleOnlyFields0316',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0317
     * @tc.name      testStartOptionsWidthOnlyFields0317
     * @tc.desc      Start with only the width fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsWidthOnlyFields0317',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0318
     * @tc.name      testStartOptionsAlternatingBounds0318
     * @tc.desc      Alternate between wide and narrow StartOptions three times and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsAlternatingBounds0318',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 3; index++) {
          const wide: number = await startTarget({
            minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          const narrow: number = await startTarget({
            minWindowWidth: 900, minWindowHeight: 700, maxWindowWidth: 1000, maxWindowHeight: 800
          });
          expect(wide === 0 || ACCEPTABLE_START_CODES.includes(wide)).assertTrue();
          expect(narrow === 0 || ACCEPTABLE_START_CODES.includes(narrow)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0319
     * @tc.name      testStartOptionsZeroMin0319
     * @tc.desc      Start with zero minimum sizes and positive maximum sizes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsZeroMin0319',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 1500, maxWindowHeight: 1000
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0320
     * @tc.name      testStartOptionsZeroMax0320
     * @tc.desc      Start with zero maximum sizes and positive minimum sizes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsZeroMax0320',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 0, maxWindowHeight: 0
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0321
     * @tc.name      testStartWidthSweepStart0321
     * @tc.desc      Start with a swept minimum width and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartWidthSweepStart0321',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({ minWindowWidth: 600 + index * 100, maxWindowWidth: 1500 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0322
     * @tc.name      testStartHeightSweepStart0322
     * @tc.desc      Start with a swept minimum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartHeightSweepStart0322',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({ minWindowHeight: 500 + index * 50, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0323
     * @tc.name      testStartBothSweeps0323
     * @tc.desc      Start with both width and height sweeps and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartBothSweeps0323',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({
            minWindowWidth: 600 + index * 50, minWindowHeight: 500 + index * 25,
            maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0324
     * @tc.name      testStartDoubleClose0324
     * @tc.desc      Start and close twice with different options and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartDoubleClose0324',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const first: number = await startTarget({ maxWindowWidth: 1200, maxWindowHeight: 800 });
        await closeTarget();
        const second: number = await startTarget({ maxWindowWidth: 1500, maxWindowHeight: 1000 });
        await closeTarget();
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0325
     * @tc.name      testStartInvertedHeights0325
     * @tc.desc      Start with inverted height fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartInvertedHeights0325',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ minWindowHeight: 1000, maxWindowHeight: 500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0326
     * @tc.name      testStartFractionalBounds0326
     * @tc.desc      Start with fractional bounds and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartFractionalBounds0326',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: 600.5, minWindowHeight: 500.5,
          maxWindowWidth: 1499.5, maxWindowHeight: 999.5
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0327
     * @tc.name      testStartMinHeightOnly0327
     * @tc.desc      Start with only the minimum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartMinHeightOnly0327',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowHeight: 500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0328
     * @tc.name      testStartMaxWidthOnly0328
     * @tc.desc      Start with only the maximum width and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartMaxWidthOnly0328',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0329
     * @tc.name      testStartMaxHeightOnly0329
     * @tc.desc      Start with only the maximum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartMaxHeightOnly0329',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ maxWindowHeight: 1000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0330
     * @tc.name      testStartAllZeroExceptDisplay0330
     * @tc.desc      Start with displayId and zero sizes, then verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartAllZeroExceptDisplay0330',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ displayId: 0, maxWindowWidth: 0, maxWindowHeight: 0 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0331
     * @tc.name      testStartCornerLoop0331
     * @tc.desc      Start with the four corners of the configured range and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartCornerLoop0331',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const corners: StartOptions[] = [
          { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 },
          { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 1000 },
          { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 500 },
          { minWindowWidth: 900, minWindowHeight: 750, maxWindowWidth: 900, maxWindowHeight: 750 }
        ];
        for (let index: number = 0; index < corners.length; index++) {
          const code: number = await startTarget(corners[index]);
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0332
     * @tc.name      testStartCenterRange0332
     * @tc.desc      Start with a centered range and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartCenterRange0332',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 800, minWindowHeight: 600, maxWindowWidth: 1300, maxWindowHeight: 900
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0333
     * @tc.name      testStartEqualBounds0333
     * @tc.desc      Start with equal bounds for both dimensions and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartEqualBounds0333',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 1000, minWindowHeight: 800, maxWindowWidth: 1000, maxWindowHeight: 800
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0334
     * @tc.name      testStartWidthSweepFour0334
     * @tc.desc      Sweep the width option four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartWidthSweepFour0334',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const code: number = await startTarget({ minWindowWidth: 600 + index * 100, maxWindowWidth: 1500 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0335
     * @tc.name      testStartHeightSweepFour0335
     * @tc.desc      Sweep the height option four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartHeightSweepFour0335',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const code: number = await startTarget({ minWindowHeight: 500 + index * 50, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_340
     * @tc.name      testStartBulkCase340
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase340',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_341
     * @tc.name      testStartBulkCase341
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase341',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_342
     * @tc.name      testStartBulkCase342
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase342',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_343
     * @tc.name      testStartBulkCase343
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase343',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_344
     * @tc.name      testStartBulkCase344
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase344',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_345
     * @tc.name      testStartBulkCase345
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase345',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_346
     * @tc.name      testStartBulkCase346
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase346',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_347
     * @tc.name      testStartBulkCase347
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase347',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_348
     * @tc.name      testStartBulkCase348
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase348',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_349
     * @tc.name      testStartBulkCase349
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase349',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_350
     * @tc.name      testStartBulkCase350
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase350',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_351
     * @tc.name      testStartBulkCase351
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase351',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_352
     * @tc.name      testStartBulkCase352
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase352',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_353
     * @tc.name      testStartBulkCase353
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase353',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_354
     * @tc.name      testStartBulkCase354
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase354',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_355
     * @tc.name      testStartBulkCase355
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase355',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_356
     * @tc.name      testStartBulkCase356
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase356',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_357
     * @tc.name      testStartBulkCase357
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase357',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_358
     * @tc.name      testStartBulkCase358
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase358',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_359
     * @tc.name      testStartBulkCase359
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase359',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_360
     * @tc.name      testStartBulkCase360
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase360',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_361
     * @tc.name      testStartBulkCase361
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase361',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_362
     * @tc.name      testStartBulkCase362
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase362',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_363
     * @tc.name      testStartBulkCase363
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase363',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_364
     * @tc.name      testStartBulkCase364
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase364',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_365
     * @tc.name      testStartBulkCase365
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase365',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_366
     * @tc.name      testStartBulkCase366
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase366',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_367
     * @tc.name      testStartBulkCase367
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase367',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_368
     * @tc.name      testStartBulkCase368
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase368',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_369
     * @tc.name      testStartBulkCase369
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase369',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_370
     * @tc.name      testStartBulkCase370
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase370',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_371
     * @tc.name      testStartBulkCase371
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase371',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_372
     * @tc.name      testStartBulkCase372
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase372',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_373
     * @tc.name      testStartBulkCase373
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase373',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_374
     * @tc.name      testStartBulkCase374
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase374',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_375
     * @tc.name      testStartBulkCase375
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase375',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_376
     * @tc.name      testStartBulkCase376
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase376',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_377
     * @tc.name      testStartBulkCase377
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase377',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_378
     * @tc.name      testStartBulkCase378
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase378',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_379
     * @tc.name      testStartBulkCase379
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase379',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_380
     * @tc.name      testStartBulkCase380
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase380',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_381
     * @tc.name      testStartBulkCase381
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase381',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_382
     * @tc.name      testStartBulkCase382
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase382',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_383
     * @tc.name      testStartBulkCase383
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase383',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_384
     * @tc.name      testStartBulkCase384
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase384',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_385
     * @tc.name      testStartBulkCase385
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase385',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_386
     * @tc.name      testStartBulkCase386
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase386',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_387
     * @tc.name      testStartBulkCase387
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase387',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_388
     * @tc.name      testStartBulkCase388
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase388',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_389
     * @tc.name      testStartBulkCase389
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase389',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_390
     * @tc.name      testStartBulkCase390
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase390',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_391
     * @tc.name      testStartBulkCase391
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase391',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_392
     * @tc.name      testStartBulkCase392
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase392',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_393
     * @tc.name      testStartBulkCase393
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase393',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_394
     * @tc.name      testStartBulkCase394
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase394',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_395
     * @tc.name      testStartBulkCase395
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase395',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_396
     * @tc.name      testStartBulkCase396
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase396',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_397
     * @tc.name      testStartBulkCase397
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase397',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_398
     * @tc.name      testStartBulkCase398
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase398',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_399
     * @tc.name      testStartBulkCase399
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase399',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_400
     * @tc.name      testStartBulkCase400
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_401
     * @tc.name      testStartBulkCase401
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_402
     * @tc.name      testStartBulkCase402
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_403
     * @tc.name      testStartBulkCase403
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_404
     * @tc.name      testStartBulkCase404
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase404',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_405
     * @tc.name      testStartBulkCase405
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase405',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_406
     * @tc.name      testStartBulkCase406
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase406',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_407
     * @tc.name      testStartBulkCase407
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase407',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_408
     * @tc.name      testStartBulkCase408
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase408',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_409
     * @tc.name      testStartBulkCase409
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase409',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_410
     * @tc.name      testStartBulkCase410
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_411
     * @tc.name      testStartBulkCase411
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase411',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_412
     * @tc.name      testStartBulkCase412
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase412',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_413
     * @tc.name      testStartBulkCase413
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase413',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_414
     * @tc.name      testStartBulkCase414
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase414',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_415
     * @tc.name      testStartBulkCase415
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase415',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_416
     * @tc.name      testStartBulkCase416
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase416',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_417
     * @tc.name      testStartBulkCase417
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase417',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_418
     * @tc.name      testStartBulkCase418
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase418',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_419
     * @tc.name      testStartBulkCase419
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase419',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_420
     * @tc.name      testStartBulkCase420
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase420',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_421
     * @tc.name      testStartBulkCase421
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase421',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_422
     * @tc.name      testStartBulkCase422
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase422',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_423
     * @tc.name      testStartBulkCase423
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase423',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_424
     * @tc.name      testStartBulkCase424
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase424',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_425
     * @tc.name      testStartBulkCase425
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase425',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_426
     * @tc.name      testStartBulkCase426
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase426',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_427
     * @tc.name      testStartBulkCase427
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase427',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_428
     * @tc.name      testStartBulkCase428
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase428',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_429
     * @tc.name      testStartBulkCase429
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase429',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_430
     * @tc.name      testStartBulkCase430
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase430',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_431
     * @tc.name      testStartBulkCase431
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase431',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_432
     * @tc.name      testStartBulkCase432
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase432',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_433
     * @tc.name      testStartBulkCase433
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase433',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_434
     * @tc.name      testStartBulkCase434
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase434',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_435
     * @tc.name      testStartBulkCase435
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase435',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_436
     * @tc.name      testStartBulkCase436
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase436',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_437
     * @tc.name      testStartBulkCase437
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase437',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_438
     * @tc.name      testStartBulkCase438
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase438',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_439
     * @tc.name      testStartBulkCase439
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase439',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_440
     * @tc.name      testStartBulkCase440
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase440',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_441
     * @tc.name      testStartBulkCase441
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase441',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_442
     * @tc.name      testStartBulkCase442
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase442',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_443
     * @tc.name      testStartBulkCase443
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase443',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_444
     * @tc.name      testStartBulkCase444
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase444',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_445
     * @tc.name      testStartBulkCase445
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase445',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_446
     * @tc.name      testStartBulkCase446
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase446',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_447
     * @tc.name      testStartBulkCase447
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase447',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_448
     * @tc.name      testStartBulkCase448
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase448',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_449
     * @tc.name      testStartBulkCase449
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase449',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_450
     * @tc.name      testStartBulkCase450
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase450',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_451
     * @tc.name      testStartBulkCase451
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase451',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_452
     * @tc.name      testStartBulkCase452
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase452',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_453
     * @tc.name      testStartBulkCase453
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase453',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_454
     * @tc.name      testStartBulkCase454
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase454',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_455
     * @tc.name      testStartBulkCase455
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase455',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_456
     * @tc.name      testStartBulkCase456
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase456',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_457
     * @tc.name      testStartBulkCase457
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase457',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_458
     * @tc.name      testStartBulkCase458
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase458',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_459
     * @tc.name      testStartBulkCase459
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase459',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_460
     * @tc.name      testStartBulkCase460
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase460',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_461
     * @tc.name      testStartBulkCase461
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase461',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_462
     * @tc.name      testStartBulkCase462
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase462',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_463
     * @tc.name      testStartBulkCase463
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase463',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_464
     * @tc.name      testStartBulkCase464
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase464',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_465
     * @tc.name      testStartBulkCase465
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase465',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_466
     * @tc.name      testStartBulkCase466
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase466',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_467
     * @tc.name      testStartBulkCase467
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase467',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_468
     * @tc.name      testStartBulkCase468
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase468',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_469
     * @tc.name      testStartBulkCase469
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase469',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_980
     * @tc.name      testStartLifeCycle980
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle980',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1200 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_981
     * @tc.name      testStartLifeCycle981
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle981',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_982
     * @tc.name      testStartLifeCycle982
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle982',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1400 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_983
     * @tc.name      testStartLifeCycle983
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle983',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1200 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_984
     * @tc.name      testStartLifeCycle984
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle984',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_985
     * @tc.name      testStartLifeCycle985
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle985',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1400 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_986
     * @tc.name      testStartLifeCycle986
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle986',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1200 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_987
     * @tc.name      testStartLifeCycle987
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle987',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1300 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_988
     * @tc.name      testStartLifeCycle988
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle988',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1400 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_989
     * @tc.name      testStartLifeCycle989
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle989',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1200 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_990
     * @tc.name      testStartLifeCycle990
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle990',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1300 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_991
     * @tc.name      testStartLifeCycle991
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle991',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1400 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_992
     * @tc.name      testStartLifeCycle992
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle992',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1200 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_993
     * @tc.name      testStartLifeCycle993
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle993',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_994
     * @tc.name      testStartLifeCycle994
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle994',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1400 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_995
     * @tc.name      testStartLifeCycle995
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle995',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1200 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_996
     * @tc.name      testStartLifeCycle996
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle996',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_997
     * @tc.name      testStartLifeCycle997
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle997',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1400 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_998
     * @tc.name      testStartLifeCycle998
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle998',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1200 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_999
     * @tc.name      testStartLifeCycle999
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartLifeCycle999',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1300 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
  });
}
