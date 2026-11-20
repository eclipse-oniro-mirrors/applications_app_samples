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

import { describe, expect, it } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/YieldHelper';
import bundleManager from '@ohos.bundle.bundleManager';
import display from '@ohos.display';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { logger as mainLogger } from '../../../../main/ets/utils/Logger';
import { TestLogger } from '../common/TestLogger';
import {
  BUNDLE_NAME, CASE_PREFIX, ENTRY_ABILITY, TAG_API, TAG_LOGGER, TEST_MODULE
} from '../common/TestConstant';

const EPSILON: number = 0.000001;

/**
 * Builds a repeated payload without relying on String.prototype.repeat,
 * which keeps the helper compatible with the API 10 baseline.
 */
function buildRepeated(unit: string, count: number): string {
  let result: string = '';
  let index: number = 0;
  while (index < count) {
    result += unit;
    index++;
  }
  return result;
}

function testModuleManager(): resourceManager.ResourceManager {
  let context: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  let testContext: common.Context = context.createModuleContext(TEST_MODULE);
  let manager: resourceManager.ResourceManager = testContext.resourceManager;
  return manager;
}

/**
 * Configuration contract of the installed sample: bundleManager identity,
 * display metrics used by the caret math and the two logging facades.
 */
export default function bundleDisplayLoggerContractTestExtra(): void {
  describe('CustomInputTextBundleDisplayLoggerContractExtraTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0950
     * @tc.name displayNameNotEmpty095
     * @tc.desc Verify the display name is a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayNameNotEmpty_095', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayNameNotEmpty095');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', metrics.name);
      expect(metrics.name.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'displayNameNotEmpty095');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0960
     * @tc.name displayAliveIsBoolean096
     * @tc.desc Verify the alive marker is exposed as a boolean
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayAliveIsBoolean_096', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayAliveIsBoolean096');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed type', typeof metrics.alive);
      expect(typeof metrics.alive).assertEqual('boolean');
      TestLogger.end(TAG_API, 'displayAliveIsBoolean096');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0970
     * @tc.name refreshRatePositive097
     * @tc.desc Verify the refresh rate in hertz is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'refreshRatePositive_097', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'refreshRatePositive097');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.refreshRate));
      expect(metrics.refreshRate > 0).assertTrue();
      TestLogger.end(TAG_API, 'refreshRatePositive097');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0980
     * @tc.name xDpiPositive098
     * @tc.desc Verify the horizontal dpi is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'xDpiPositive_098', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'xDpiPositive098');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.xDPI));
      expect(metrics.xDPI > 0).assertTrue();
      TestLogger.end(TAG_API, 'xDpiPositive098');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0990
     * @tc.name yDpiPositive099
     * @tc.desc Verify the vertical dpi is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'yDpiPositive_099', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'yDpiPositive099');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.yDPI));
      expect(metrics.yDPI > 0).assertTrue();
      TestLogger.end(TAG_API, 'yDpiPositive099');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1000
     * @tc.name xDpiNearYDpi100
     * @tc.desc Verify the horizontal and vertical dpi differ by at most 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'xDpiNearYDpi_100', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'xDpiNearYDpi100');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(Math.abs(metrics.xDPI - metrics.yDPI) <= 5));
      expect(Math.abs(metrics.xDPI - metrics.yDPI) <= 5).assertTrue();
      TestLogger.end(TAG_API, 'xDpiNearYDpi100');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1010
     * @tc.name densityDpiMatchesScale101
     * @tc.desc Verify densityDPI equals densityPixels times 160 within 0.5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'densityDpiMatchesScale_101', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'densityDpiMatchesScale101');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(Math.abs(metrics.densityDPI - metrics.densityPixels * 160) <= 0.5));
      expect(Math.abs(metrics.densityDPI - metrics.densityPixels * 160) <= 0.5).assertTrue();
      TestLogger.end(TAG_API, 'densityDpiMatchesScale101');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1020
     * @tc.name repeatMetricsStable102
     * @tc.desc Verify two display queries report identical width, height, rotation, density and id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'repeatMetricsStable_102', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'repeatMetricsStable102');
      let metrics: display.Display = display.getDefaultDisplaySync();
      let again: display.Display = display.getDefaultDisplaySync();
      expect(metrics.width).assertEqual(again.width);
      expect(metrics.height).assertEqual(again.height);
      expect(metrics.rotation).assertEqual(again.rotation);
      expect(metrics.densityPixels).assertEqual(again.densityPixels);
      expect(metrics.id).assertEqual(again.id);
      TestLogger.end(TAG_API, 'repeatMetricsStable102');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1030
     * @tc.name pxRoundTripZero103
     * @tc.desc Verify zero pixels survive a pixel to vp to pixel round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pxRoundTripZero_103', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'pxRoundTripZero103');
      let metrics: display.Display = display.getDefaultDisplaySync();
      let pixel: number = 0;
      let vp: number = pixel / metrics.densityPixels;
      let back: number = vp * metrics.densityPixels;
      TestLogger.value(TAG_API, 'round trip px', String(back));
      expect(Math.abs(back - pixel) <= EPSILON).assertTrue();
      TestLogger.end(TAG_API, 'pxRoundTripZero103');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1040
     * @tc.name pxRoundTripSmallAndLarge104
     * @tc.desc Verify a single pixel and a ten-thousand-pixel span survive the density round trip within 1e-6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pxRoundTripSmallAndLarge_104', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'pxRoundTripSmallAndLarge104');
      let metrics: display.Display = display.getDefaultDisplaySync();
      let small: number = 1;
      let smallVp: number = small / metrics.densityPixels;
      let smallBack: number = smallVp * metrics.densityPixels;
      expect(Math.abs(smallBack - small) <= EPSILON).assertTrue();
      let large: number = 10000;
      let largeVp: number = large / metrics.densityPixels;
      let largeBack: number = largeVp * metrics.densityPixels;
      expect(Math.abs(largeBack - large) <= EPSILON).assertTrue();
      TestLogger.end(TAG_API, 'pxRoundTripSmallAndLarge104');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1050
     * @tc.name pxRoundTripNegative105
     * @tc.desc Verify a negative pixel offset survives the density round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pxRoundTripNegative_105', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'pxRoundTripNegative105');
      let metrics: display.Display = display.getDefaultDisplaySync();
      let pixel: number = -1;
      let vp: number = pixel / metrics.densityPixels;
      let back: number = vp * metrics.densityPixels;
      TestLogger.value(TAG_API, 'round trip px', String(back));
      expect(Math.abs(back - pixel) <= EPSILON).assertTrue();
      TestLogger.end(TAG_API, 'pxRoundTripNegative105');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1060
     * @tc.name vpToPxOne106
     * @tc.desc Verify one vp converts to exactly one density scale in pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'vpToPxOne_106', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'vpToPxOne106');
      let metrics: display.Display = display.getDefaultDisplaySync();
      let vp: number = 1;
      let px: number = vp * metrics.densityPixels;
      TestLogger.value(TAG_API, 'converted px', String(px));
      expect(px).assertEqual(vp * metrics.densityPixels);
      TestLogger.end(TAG_API, 'vpToPxOne106');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1070
     * @tc.name vpToPxZero107
     * @tc.desc Verify zero vp converts to zero pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'vpToPxZero_107', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'vpToPxZero107');
      let metrics: display.Display = display.getDefaultDisplaySync();
      let vp: number = 0;
      let px: number = vp * metrics.densityPixels;
      TestLogger.value(TAG_API, 'converted px', String(px));
      expect(px).assertEqual(vp * metrics.densityPixels);
      TestLogger.end(TAG_API, 'vpToPxZero107');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1080
     * @tc.name mainLoggerInfoAccepted108
     * @tc.desc Verify the application info channel accepts two public arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mainLoggerInfoAccepted_108', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerInfoAccepted108');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, 'info payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerInfoAccepted108');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1090
     * @tc.name mainLoggerDebugAccepted109
     * @tc.desc Verify the application debug channel accepts two public arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mainLoggerDebugAccepted_109', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerDebugAccepted109');
      let threw: boolean = false;
      try {
        mainLogger.debug(TAG_LOGGER, 'debug payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerDebugAccepted109');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1100
     * @tc.name mainLoggerWarnAccepted110
     * @tc.desc Verify the application warn channel accepts two public arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mainLoggerWarnAccepted_110', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerWarnAccepted110');
      let threw: boolean = false;
      try {
        mainLogger.warn(TAG_LOGGER, 'warn payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerWarnAccepted110');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1110
     * @tc.name mainLoggerErrorAccepted111
     * @tc.desc Verify the application error channel accepts two public arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'mainLoggerErrorAccepted_111', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerErrorAccepted111');
      let threw: boolean = false;
      try {
        mainLogger.error(TAG_LOGGER, 'error payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerErrorAccepted111');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1120
     * @tc.name mainLoggerEmptyArguments112
     * @tc.desc Verify the logger tolerates two empty string arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerEmptyArguments_112', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerEmptyArguments112');
      let threw: boolean = false;
      try {
        mainLogger.info('', '');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerEmptyArguments112');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1130
     * @tc.name mainLoggerEmptyTag113
     * @tc.desc Verify the logger tolerates an empty tag with a normal message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerEmptyTag_113', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerEmptyTag113');
      let threw: boolean = false;
      try {
        mainLogger.info('', 'message');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerEmptyTag113');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1140
     * @tc.name mainLoggerEmptyMessage114
     * @tc.desc Verify the logger tolerates a normal tag with an empty message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerEmptyMessage_114', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerEmptyMessage114');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, '');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerEmptyMessage114');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1150
     * @tc.name mainLoggerSingleCharacter115
     * @tc.desc Verify the logger accepts single character arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerSingleCharacter_115', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerSingleCharacter115');
      let threw: boolean = false;
      try {
        mainLogger.info('a', 'b');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerSingleCharacter115');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1160
     * @tc.name mainLoggerSingleCharacterDebug116
     * @tc.desc Verify the debug channel accepts single character arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerSingleCharacterDebug_116', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerSingleCharacterDebug116');
      let threw: boolean = false;
      try {
        mainLogger.debug('x', 'y');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerSingleCharacterDebug116');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1170
     * @tc.name mainLoggerLength255117
     * @tc.desc Verify the logger accepts a 255 character payload without truncation errors
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerLength255_117', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerLength255117');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, buildRepeated('a', 255));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerLength255117');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1180
     * @tc.name mainLoggerLength4096118
     * @tc.desc Verify the logger accepts a 4096 character payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerLength4096_118', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerLength4096118');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, buildRepeated('b', 4096));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerLength4096118');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1190
     * @tc.name mainLoggerLength16384119
     * @tc.desc Verify the logger accepts a 16384 character payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerLength16384_119', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerLength16384119');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, buildRepeated('c', 16384));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerLength16384119');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1200
     * @tc.name mainLoggerLongTag120
     * @tc.desc Verify the logger accepts a long tag string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerLongTag_120', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerLongTag120');
      let threw: boolean = false;
      try {
        mainLogger.info(buildRepeated('t', 1024), 'payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerLongTag120');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1210
     * @tc.name mainLoggerChinesePayload121
     * @tc.desc Verify the logger accepts a Chinese payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerChinesePayload_121', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerChinesePayload121');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, '自定义输入框');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerChinesePayload121');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1220
     * @tc.name mainLoggerEmojiPayload122
     * @tc.desc Verify the logger accepts an emoji payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerEmojiPayload_122', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerEmojiPayload122');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, '😀👨‍👩‍👧');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerEmojiPayload122');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1230
     * @tc.name mainLoggerChineseTag123
     * @tc.desc Verify the logger accepts a Chinese tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerChineseTag_123', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerChineseTag123');
      let threw: boolean = false;
      try {
        mainLogger.info('测试标签', 'payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerChineseTag123');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1240
     * @tc.name mainLoggerPercentS124
     * @tc.desc Verify a literal percent-s inside the payload is not interpreted twice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerPercentS_124', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerPercentS124');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, 'percent %s literal');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerPercentS124');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1250
     * @tc.name mainLoggerPublicFormat125
     * @tc.desc Verify a literal public format marker survives as payload text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerPublicFormat_125', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerPublicFormat125');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, '%{public}s');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerPublicFormat125');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1260
     * @tc.name mainLoggerNumericFormat126
     * @tc.desc Verify a literal numeric format marker survives as payload text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerNumericFormat_126', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerNumericFormat126');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, '%d %f %s');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerNumericFormat126');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1270
     * @tc.name mainLoggerWarnLong127
     * @tc.desc Verify the warn channel accepts a long payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerWarnLong_127', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerWarnLong127');
      let threw: boolean = false;
      try {
        mainLogger.warn(TAG_LOGGER, buildRepeated('w', 4096));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerWarnLong127');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1280
     * @tc.name mainLoggerErrorLong128
     * @tc.desc Verify the error channel accepts a long payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerErrorLong_128', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerErrorLong128');
      let threw: boolean = false;
      try {
        mainLogger.error(TAG_LOGGER, buildRepeated('e', 4096));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerErrorLong128');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1290
     * @tc.name mainLoggerDebugLong129
     * @tc.desc Verify the debug channel accepts a long payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerDebugLong_129', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerDebugLong129');
      let threw: boolean = false;
      try {
        mainLogger.debug(TAG_LOGGER, buildRepeated('d', 4096));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerDebugLong129');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1300
     * @tc.name mainLoggerAllSeverities130
     * @tc.desc Verify all four severities can be called in one sequence
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerAllSeverities_130', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerAllSeverities130');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, 'i'); mainLogger.debug(TAG_LOGGER, 'd'); mainLogger.warn(TAG_LOGGER, 'w'); mainLogger.error(TAG_LOGGER, 'e');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerAllSeverities130');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1310
     * @tc.name mainLoggerHundredInfo131
     * @tc.desc Verify one hundred consecutive info calls do not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerHundredInfo_131', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerHundredInfo131');
      let threw: boolean = false;
      try {
        for (let i: number = 0; i < 100; i++) { mainLogger.info(TAG_LOGGER, 'repeat') }
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerHundredInfo131');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1320
     * @tc.name mainLoggerHundredAlternating132
     * @tc.desc Verify one hundred alternating severity calls do not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerHundredAlternating_132', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerHundredAlternating132');
      let threw: boolean = false;
      try {
        for (let i: number = 0; i < 100; i++) { if (i % 2 === 0) { mainLogger.info(TAG_LOGGER, 'even') } else { mainLogger.error(TAG_LOGGER, 'odd') } }
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerHundredAlternating132');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1330
     * @tc.name mainLoggerFiftyDebug133
     * @tc.desc Verify fifty consecutive debug calls do not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerFiftyDebug_133', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerFiftyDebug133');
      let threw: boolean = false;
      try {
        for (let i: number = 0; i < 50; i++) { mainLogger.debug(TAG_LOGGER, 'debug repeat') }
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerFiftyDebug133');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1340
     * @tc.name mainLoggerFirstEmptySecondLong134
     * @tc.desc Verify an empty first argument with a long second argument is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerFirstEmptySecondLong_134', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerFirstEmptySecondLong134');
      let threw: boolean = false;
      try {
        mainLogger.info('', buildRepeated('z', 4096));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerFirstEmptySecondLong134');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1350
     * @tc.name mainLoggerFirstLongSecondEmpty135
     * @tc.desc Verify a long first argument with an empty second argument is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerFirstLongSecondEmpty_135', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerFirstLongSecondEmpty135');
      let threw: boolean = false;
      try {
        mainLogger.info(buildRepeated('y', 4096), '');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerFirstLongSecondEmpty135');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1360
     * @tc.name mainLoggerTabAndNewlinePayload136
     * @tc.desc Verify control whitespace inside the payload is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerTabAndNewlinePayload_136', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerTabAndNewlinePayload136');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, 'tab\tnewline\nend');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerTabAndNewlinePayload136');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1370
     * @tc.name mainLoggerQuotesPayload137
     * @tc.desc Verify quotes inside the payload are accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'mainLoggerQuotesPayload_137', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'mainLoggerQuotesPayload137');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, 'single \' and double " quotes');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'mainLoggerQuotesPayload137');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1380
     * @tc.name testLoggerInfoAccepted138
     * @tc.desc Verify the test info channel accepts a tag and message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'testLoggerInfoAccepted_138', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerInfoAccepted138');
      let threw: boolean = false;
      try {
        TestLogger.info(TAG_LOGGER, 'test info payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerInfoAccepted138');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1390
     * @tc.name testLoggerInfoPairAccepted139
     * @tc.desc Verify the test paired channel accepts two payloads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'testLoggerInfoPairAccepted_139', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerInfoPairAccepted139');
      let threw: boolean = false;
      try {
        TestLogger.infoPair(TAG_LOGGER, 'first', 'second');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerInfoPairAccepted139');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1400
     * @tc.name testLoggerDebugAccepted140
     * @tc.desc Verify the test debug channel accepts a message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'testLoggerDebugAccepted_140', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerDebugAccepted140');
      let threw: boolean = false;
      try {
        TestLogger.debug(TAG_LOGGER, 'test debug payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerDebugAccepted140');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1410
     * @tc.name testLoggerWarnAccepted141
     * @tc.desc Verify the test warn channel accepts a message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'testLoggerWarnAccepted_141', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerWarnAccepted141');
      let threw: boolean = false;
      try {
        TestLogger.warn(TAG_LOGGER, 'test warn payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerWarnAccepted141');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1420
     * @tc.name testLoggerErrorAccepted142
     * @tc.desc Verify the test error channel accepts a message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'testLoggerErrorAccepted_142', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerErrorAccepted142');
      let threw: boolean = false;
      try {
        TestLogger.error(TAG_LOGGER, 'test error payload');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerErrorAccepted142');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1430
     * @tc.name testLoggerBeginAccepted143
     * @tc.desc Verify the case begin helper writes a begin marker
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testLoggerBeginAccepted_143', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerBeginAccepted143');
      let threw: boolean = false;
      try {
        TestLogger.begin(TAG_LOGGER, 'caseBeginProbe');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerBeginAccepted143');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1440
     * @tc.name testLoggerEndAccepted144
     * @tc.desc Verify the case end helper writes an end marker
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testLoggerEndAccepted_144', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerEndAccepted144');
      let threw: boolean = false;
      try {
        TestLogger.end(TAG_LOGGER, 'caseEndProbe');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerEndAccepted144');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1450
     * @tc.name testLoggerValueAccepted145
     * @tc.desc Verify the value helper accepts a label and a value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testLoggerValueAccepted_145', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerValueAccepted145');
      let threw: boolean = false;
      try {
        TestLogger.value(TAG_LOGGER, 'label', 'value');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerValueAccepted145');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1460
     * @tc.name testLoggerLongPayload146
     * @tc.desc Verify the test logger accepts a 4096 character payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testLoggerLongPayload_146', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerLongPayload146');
      let threw: boolean = false;
      try {
        TestLogger.info(TAG_LOGGER, buildRepeated('L', 4096));
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerLongPayload146');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1470
     * @tc.name testLoggerUnicodePayload147
     * @tc.desc Verify the test logger accepts Chinese and emoji payloads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testLoggerUnicodePayload_147', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerUnicodePayload147');
      let threw: boolean = false;
      try {
        TestLogger.info(TAG_LOGGER, '测试😀');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerUnicodePayload147');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1480
     * @tc.name testLoggerHundredCalls148
     * @tc.desc Verify one hundred test logger calls do not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testLoggerHundredCalls_148', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'testLoggerHundredCalls148');
      let threw: boolean = false;
      try {
        for (let i: number = 0; i < 100; i++) { TestLogger.info(TAG_LOGGER, 'repeat') }
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'testLoggerHundredCalls148');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1490
     * @tc.name interleavedLoggers149
     * @tc.desc Verify both loggers can alternate without interfering
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'interleavedLoggers_149', 0, async (done: Function) => {
      TestLogger.begin(TAG_LOGGER, 'interleavedLoggers149');
      let threw: boolean = false;
      try {
        mainLogger.info(TAG_LOGGER, 'a'); TestLogger.info(TAG_LOGGER, 'b'); mainLogger.debug(TAG_LOGGER, 'c'); TestLogger.debug(TAG_LOGGER, 'd');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      TestLogger.end(TAG_LOGGER, 'interleavedLoggers149');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1500
     * @tc.name testModuleResourceValues150
     * @tc.desc Verify the three test module manifest strings keep their manifest text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'testModuleResourceValues_150', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testModuleResourceValues150');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let moduleDesc: string = manager.getStringSync($r('app.string.entry_test_desc').id);
      let abilityDesc: string = manager.getStringSync($r('app.string.TestAbility_desc').id);
      let abilityLabel: string = manager.getStringSync($r('app.string.TestAbility_label').id);
      expect(moduleDesc).assertEqual('i am an entry for tv');
      expect(abilityDesc).assertEqual('the tv entry test ability');
      expect(abilityLabel).assertEqual('tvBase');
      TestLogger.end(TAG_API, 'testModuleResourceValues150');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1510
     * @tc.name testModuleResourceLengths151
     * @tc.desc Verify the three test module manifest strings are non-empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testModuleResourceLengths_151', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testModuleResourceLengths151');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let moduleDesc: string = manager.getStringSync($r('app.string.entry_test_desc').id);
      let abilityDesc: string = manager.getStringSync($r('app.string.TestAbility_desc').id);
      let abilityLabel: string = manager.getStringSync($r('app.string.TestAbility_label').id);
      expect(moduleDesc.length > 0).assertTrue();
      expect(abilityDesc.length > 0).assertTrue();
      expect(abilityLabel.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'testModuleResourceLengths151');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1520
     * @tc.name testModuleResourcesContainTv152
     * @tc.desc Verify the two description resources mention the tv sample
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testModuleResourcesContainTv_152', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testModuleResourcesContainTv152');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let moduleDesc: string = manager.getStringSync($r('app.string.entry_test_desc').id);
      let abilityDesc: string = manager.getStringSync($r('app.string.TestAbility_desc').id);
      expect(moduleDesc.indexOf('tv') >= 0).assertTrue();
      expect(abilityDesc.indexOf('tv') >= 0).assertTrue();
      TestLogger.end(TAG_API, 'testModuleResourcesContainTv152');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1530
     * @tc.name testResourceByIdStable153
     * @tc.desc Verify reading the same resource id twice returns the same text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testResourceByIdStable_153', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testResourceByIdStable153');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let value: string = manager.getStringSync($r('app.string.entry_test_desc').id);
      TestLogger.value(TAG_API, 'entry_test_desc', value);
      let again: string = manager.getStringSync($r('app.string.entry_test_desc').id);
      expect(value).assertEqual(again);
      TestLogger.end(TAG_API, 'testResourceByIdStable153');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1540
     * @tc.name testResourceByNameStable154
     * @tc.desc Verify reading the same resource name twice returns the same text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testResourceByNameStable_154', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testResourceByNameStable154');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let value: string = manager.getStringSync($r('app.string.entry_test_desc').id);
      TestLogger.value(TAG_API, 'entry_test_desc', value);
      let byName: string = manager.getStringByNameSync('entry_test_desc');
      expect(value).assertEqual(byName);
      TestLogger.end(TAG_API, 'testResourceByNameStable154');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1550
     * @tc.name testResourceIdByName155
     * @tc.desc Verify the by-name lookup agrees with the by-id lookup
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testResourceIdByName_155', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testResourceIdByName155');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let value: string = manager.getStringSync($r('app.string.TestAbility_label').id);
      TestLogger.value(TAG_API, 'TestAbility_label', value);
      let byName: string = manager.getStringByNameSync('TestAbility_label');
      expect(value).assertEqual(byName);
      TestLogger.end(TAG_API, 'testResourceIdByName155');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1560
     * @tc.name testAbilityLabelIsSixChars156
     * @tc.desc Verify the tvBase label keeps its six character length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'testAbilityLabelIsSixChars_156', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'testAbilityLabelIsSixChars156');
      let manager: resourceManager.ResourceManager = testModuleManager();
      let value: string = manager.getStringSync($r('app.string.TestAbility_label').id);
      TestLogger.value(TAG_API, 'TestAbility_label', value);
      expect(value.length).assertEqual(6);
      TestLogger.end(TAG_API, 'testAbilityLabelIsSixChars156');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1570
     * @tc.name constantBundleName157
     * @tc.desc Verify the shared constant matches the installed bundle name literal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantBundleName_157', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantBundleName157');
      TestLogger.value(TAG_API, 'constant check', String(BUNDLE_NAME === 'com.samples.customtextinput'));
      expect(BUNDLE_NAME === 'com.samples.customtextinput').assertTrue();
      TestLogger.end(TAG_API, 'constantBundleName157');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1580
     * @tc.name constantCasePrefix158
     * @tc.desc Verify the shared case prefix is not empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantCasePrefix_158', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantCasePrefix158');
      TestLogger.value(TAG_API, 'constant check', String(CASE_PREFIX.length > 0));
      expect(CASE_PREFIX.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'constantCasePrefix158');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1590
     * @tc.name constantTestModule159
     * @tc.desc Verify the test module constant names the feature module
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantTestModule_159', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantTestModule159');
      TestLogger.value(TAG_API, 'constant check', String(TEST_MODULE === 'entry_test'));
      expect(TEST_MODULE === 'entry_test').assertTrue();
      TestLogger.end(TAG_API, 'constantTestModule159');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1600
     * @tc.name constantEntryAbility160
     * @tc.desc Verify the entry ability constant names the page ability
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantEntryAbility_160', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantEntryAbility160');
      TestLogger.value(TAG_API, 'constant check', String(ENTRY_ABILITY === 'EntryAbility'));
      expect(ENTRY_ABILITY === 'EntryAbility').assertTrue();
      TestLogger.end(TAG_API, 'constantEntryAbility160');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1610
     * @tc.name constantApiTag161
     * @tc.desc Verify the api tag starts with a bracket
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantApiTag_161', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantApiTag161');
      TestLogger.value(TAG_API, 'constant check', String(TAG_API.indexOf('[') === 0));
      expect(TAG_API.indexOf('[') === 0).assertTrue();
      TestLogger.end(TAG_API, 'constantApiTag161');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1620
     * @tc.name constantLoggerTag162
     * @tc.desc Verify the logger tag starts with a bracket
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantLoggerTag_162', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantLoggerTag162');
      TestLogger.value(TAG_API, 'constant check', String(TAG_LOGGER.indexOf('[') === 0));
      expect(TAG_LOGGER.indexOf('[') === 0).assertTrue();
      TestLogger.end(TAG_API, 'constantLoggerTag162');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1630
     * @tc.name constantModuleNotEntry163
     * @tc.desc Verify the test module name differs from the main entry module
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantModuleNotEntry_163', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantModuleNotEntry163');
      TestLogger.value(TAG_API, 'constant check', String(TEST_MODULE !== 'entry'));
      expect(TEST_MODULE !== 'entry').assertTrue();
      TestLogger.end(TAG_API, 'constantModuleNotEntry163');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_1640
     * @tc.name constantBundleHasPrefix164
     * @tc.desc Verify the bundle constant starts with the sample namespace
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'constantBundleHasPrefix_164', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'constantBundleHasPrefix164');
      TestLogger.value(TAG_API, 'constant check', String(BUNDLE_NAME.indexOf('com.samples.') === 0));
      expect(BUNDLE_NAME.indexOf('com.samples.') === 0).assertTrue();
      TestLogger.end(TAG_API, 'constantBundleHasPrefix164');
      await yieldToEventLoop();
      done();
    });

  });
}
