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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { AnimationUtils } from '../../../main/ets/utils/AnimationUtils';
import { keepMainThreadResponsive } from './MainThreadYield';

export default function animationUtilsContractTest(): void {
  describe('AnimationUtilsContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0100
     * @tc.name animationFadeInDurationCurve001
     * @tc.desc Verify createFadeInAnimation pins an 800ms EaseIn fade used by detail text areas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationFadeInDurationCurve001', 0, (): void => {
      const spec = AnimationUtils.createFadeInAnimation();
      expect(spec !== undefined && spec !== null).assertTrue();
      expect(spec.duration).assertEqual(800);
      expect(spec.curve).assertEqual(Curve.EaseIn);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0200
     * @tc.name animationFadeInFreshObjectEachCall002
     * @tc.desc Verify consecutive fade-in calls return a fresh equivalent spec each time
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationFadeInFreshObjectEachCall002', 0, (): void => {
      // The helper must hand back a fresh object on every call so two animated
      // components never share (and therefore mutate) a single cached instance.
      const first = AnimationUtils.createFadeInAnimation();
      const second = AnimationUtils.createFadeInAnimation();
      expect(first === second).assertFalse();
      expect(first.duration).assertEqual(second.duration);
      expect(first.curve).assertEqual(second.curve);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0300
     * @tc.name animationSlideDurationCurve003
     * @tc.desc Verify createSlideAnimation pins a 500ms EaseOut slide used for swiper transitions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationSlideDurationCurve003', 0, (): void => {
      const spec = AnimationUtils.createSlideAnimation();
      expect(spec !== undefined && spec !== null).assertTrue();
      expect(spec.duration).assertEqual(500);
      expect(spec.curve).assertEqual(Curve.EaseOut);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0400
     * @tc.name animationSlideFasterThanFade004
     * @tc.desc Verify the slide transition is deliberately shorter than the text fade
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationSlideFasterThanFade004', 0, (): void => {
      // The page uses the slide to move the swiper while the fade layers text on
      // top; the slide must complete first so text never fades in mid-scroll.
      const fade = AnimationUtils.createFadeInAnimation();
      const slide = AnimationUtils.createSlideAnimation();
      expect(slide.duration < fade.duration).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0500
     * @tc.name animationScaleNoopSafe005
     * @tc.desc Verify createScaleAnimation is safely callable and never throws
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationScaleNoopSafe005', 0, (): void => {
      // The scale animation is a placeholder in the current build; it must still
      // be safe to call wherever a page invokes it during focus transitions.
      expect(AnimationUtils.createScaleAnimation() === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0600
     * @tc.name animationTimingWithinSwiperWindow006
     * @tc.desc Verify both animation durations stay inside the 1s hover debounce window
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationTimingWithinSwiperWindow006', 0, (): void => {
      // FeatureComponent debounces hover with a 1000ms window; both animations
      // must finish within it so a repeated hover never overlaps a still-running
      // transition of the previous one.
      const fade = AnimationUtils.createFadeInAnimation();
      const slide = AnimationUtils.createSlideAnimation();
      expect(fade.duration <= 1000).assertTrue();
      expect(slide.duration <= 1000).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0700
     * @tc.name animationDurationsPositive007
     * @tc.desc Verify animation durations are strictly positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationDurationsPositive007', 0, (): void => {
      const fade = AnimationUtils.createFadeInAnimation();
      const slide = AnimationUtils.createSlideAnimation();
      expect(fade.duration > 0).assertTrue();
      expect(slide.duration > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_ANIMATION_0800
     * @tc.name animationCurvesDifferByDirection008
     * @tc.desc Verify the fade and slide use different easing directions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('animationCurvesDifferByDirection008', 0, (): void => {
      const fade = AnimationUtils.createFadeInAnimation();
      const slide = AnimationUtils.createSlideAnimation();
      // Entrance fades accelerate (EaseIn) while swiper slides decelerate
      // (EaseOut); mixing the two would make page changes feel inconsistent.
      expect(fade.curve === slide.curve).assertFalse();
    });
  });
}
