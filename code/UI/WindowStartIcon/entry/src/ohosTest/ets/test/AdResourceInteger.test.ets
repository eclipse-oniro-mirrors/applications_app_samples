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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF812;
const TAG: string = 'WindowStartIconAdIntegerTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * Reads an integer dimension resource through the application resource manager.
 */
function getNumber(resource: Resource): number {
  return delegator.getAppContext().resourceManager.getNumber(resource);
}

export default function adResourceIntegerTest(): void {
  describe('AdResourceIntegerTest', () => {
    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0201
     * @tc.name      testWindowStartIconAdInteger0201
     * @tc.desc      Verify the skip button corner radius resource equals 18 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0201 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_skip_borderRadius'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=18`);
      expect(actual).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(actual)=${Number.isFinite(actual)}`);
      expect(Number.isFinite(actual)).assertTrue();
      log('testWindowStartIconAdInteger0201 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0202
     * @tc.name      testWindowStartIconAdInteger0202
     * @tc.desc      Verify the skip radius stays smaller than the skip width for a rounded pill.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0202 begin');
      const radius: number = getNumber($r('app.integer.advertising_description_skip_borderRadius'));
      const width: number = getNumber($r('app.integer.advertising_description_skip_width'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger radius=${radius}, expected=0`);
      expect(radius).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess radius=${radius}, expected=width`);
      expect(radius).assertLess(width);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual radius=${radius}, expected=getNumber($r('app.integer.a...`);
      expect(radius).assertEqual(getNumber($r('app.integer.advertising_description_skip_borderRadius')));
      log('testWindowStartIconAdInteger0202 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0203
     * @tc.name      testWindowStartIconAdInteger0203
     * @tc.desc      Verify the skip button width resource equals 80 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0203 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_skip_width'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=80`);
      expect(actual).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0203 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0204
     * @tc.name      testWindowStartIconAdInteger0204
     * @tc.desc      Verify the skip width is about three times the skip font size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0204 begin');
      const width: number = getNumber($r('app.integer.advertising_description_skip_width'));
      const font: number = getNumber($r('app.integer.advertising_description_skip_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width / font=${width / font}, expected=3`);
      expect(width / font).assertLarger(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess width / font=${width / font}, expected=7`);
      expect(width / font).assertLess(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=font * 2`);
      expect(width).assertLarger(font * 2);
      log('testWindowStartIconAdInteger0204 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0205
     * @tc.name      testWindowStartIconAdInteger0205
     * @tc.desc      Verify the skip button vertical position resource equals 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0205 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_skip_position_y'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=40`);
      expect(actual).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0205 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0206
     * @tc.name      testWindowStartIconAdInteger0206
     * @tc.desc      Verify the skip vertical offset is smaller than the horizontal offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0206 begin');
      const posY: number = getNumber($r('app.integer.advertising_description_skip_position_y'));
      const posX: number = getNumber($r('app.integer.advertising_description_skip_position_x'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess posY=${posY}, expected=posX`);
      expect(posY).assertLess(posX);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger posY=${posY}, expected=0`);
      expect(posY).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual posX=${posX}, expected=280`);
      expect(posX).assertEqual(280);
      log('testWindowStartIconAdInteger0206 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0207
     * @tc.name      testWindowStartIconAdInteger0207
     * @tc.desc      Verify the countdown margin resource equals 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0207 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_pageCountDown_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(actual)=${Number.isFinite(actual)}`);
      expect(Number.isFinite(actual)).assertTrue();
      log('testWindowStartIconAdInteger0207 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0208
     * @tc.name      testWindowStartIconAdInteger0208
     * @tc.desc      Verify the countdown margin is the smallest spacing inside the skip pill.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0208 begin');
      const countdownMargin: number = getNumber($r('app.integer.advertising_description_pageCountDown_margin'));
      const skipTextMargin: number = getNumber($r('app.integer.skip_text_margin_left'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess countdownMargin=${countdownMargin}, expected=skipTextMargin`);
      expect(countdownMargin).assertLess(skipTextMargin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger countdownMargin=${countdownMargin}, expected=0`);
      expect(countdownMargin).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess countdownMargin=${countdownMargin}, expected=15`);
      expect(countdownMargin).assertLess(15);
      log('testWindowStartIconAdInteger0208 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0209
     * @tc.name      testWindowStartIconAdInteger0209
     * @tc.desc      Verify the skip font size resource equals 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0209 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_skip_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=16`);
      expect(actual).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0209 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0210
     * @tc.name      testWindowStartIconAdInteger0210
     * @tc.desc      Verify the skip font size stays within the readable caption range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0210 begin');
      const skipFont: number = getNumber($r('app.integer.advertising_description_skip_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue skipFont >= 12=${skipFont >= 12}`);
      expect(skipFont >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue skipFont <= 24=${skipFont <= 24}`);
      expect(skipFont <= 24).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual skipFont % 2=${skipFont % 2}, expected=0`);
      expect(skipFont % 2).assertEqual(0);
      log('testWindowStartIconAdInteger0210 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0211
     * @tc.name      testWindowStartIconAdInteger0211
     * @tc.desc      Verify the description block margin resource equals 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0211 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=200`);
      expect(actual).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0211 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0212
     * @tc.name      testWindowStartIconAdInteger0212
     * @tc.desc      Verify the description block margin exceeds the gif margin for spacing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0212 begin');
      const descMargin: number = getNumber($r('app.integer.advertising_description_margin'));
      const gifMargin: number = getNumber($r('app.integer.advertising_page_gif_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger descMargin=${descMargin}, expected=gifMargin`);
      expect(descMargin).assertLarger(gifMargin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger descMargin=${descMargin}, expected=100`);
      expect(descMargin).assertLarger(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger gifMargin=${gifMargin}, expected=0`);
      expect(gifMargin).assertLarger(0);
      log('testWindowStartIconAdInteger0212 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0213
     * @tc.name      testWindowStartIconAdInteger0213
     * @tc.desc      Verify the description font size resource equals 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0213 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=16`);
      expect(actual).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0213 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0214
     * @tc.name      testWindowStartIconAdInteger0214
     * @tc.desc      Verify the description font matches the skip font for consistent captions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0214 begin');
      const descFont: number = getNumber($r('app.integer.advertising_description_font_size'));
      const skipFont: number = getNumber($r('app.integer.advertising_description_skip_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual descFont=${descFont}, expected=skipFont`);
      expect(descFont).assertEqual(skipFont);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual descFont=${descFont}, expected=16`);
      expect(descFont).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger descFont=${descFont}, expected=0`);
      expect(descFont).assertLarger(0);
      log('testWindowStartIconAdInteger0214 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0215
     * @tc.name      testWindowStartIconAdInteger0215
     * @tc.desc      Verify the title-description text margin resource equals 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0215 begin');
      const actual: number = getNumber($r('app.integer.advertising_description_text_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=10`);
      expect(actual).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0215 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0216
     * @tc.name      testWindowStartIconAdInteger0216
     * @tc.desc      Verify the text margin stays below the skip text margin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0216 begin');
      const textMargin: number = getNumber($r('app.integer.advertising_description_text_margin'));
      const skipTextMargin: number = getNumber($r('app.integer.skip_text_margin_left'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess textMargin=${textMargin}, expected=skipTextMargin`);
      expect(textMargin).assertLess(skipTextMargin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger textMargin=${textMargin}, expected=0`);
      expect(textMargin).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess textMargin=${textMargin}, expected=50`);
      expect(textMargin).assertLess(50);
      log('testWindowStartIconAdInteger0216 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0217
     * @tc.name      testWindowStartIconAdInteger0217
     * @tc.desc      Verify the page title font size resource equals 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0217 begin');
      const actual: number = getNumber($r('app.integer.advertising_page_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=24`);
      expect(actual).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0217 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0218
     * @tc.name      testWindowStartIconAdInteger0218
     * @tc.desc      Verify the title font is larger than body captions for visual hierarchy.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0218 begin');
      const titleFont: number = getNumber($r('app.integer.advertising_page_font_size'));
      const descFont: number = getNumber($r('app.integer.advertising_description_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger titleFont=${titleFont}, expected=descFont`);
      expect(titleFont).assertLarger(descFont);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titleFont=${titleFont}, expected=24`);
      expect(titleFont).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titleFont / descFont=${titleFont / descFont}, expected=1.5`);
      expect(titleFont / descFont).assertEqual(1.5);
      log('testWindowStartIconAdInteger0218 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0219
     * @tc.name      testWindowStartIconAdInteger0219
     * @tc.desc      Verify the gif margin resource equals 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0219 begin');
      const actual: number = getNumber($r('app.integer.advertising_page_gif_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=60`);
      expect(actual).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0219 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0220
     * @tc.name      testWindowStartIconAdInteger0220
     * @tc.desc      Verify the gif margin stays smaller than the description margin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0220 begin');
      const gifMargin: number = getNumber($r('app.integer.advertising_page_gif_margin'));
      const descMargin: number = getNumber($r('app.integer.advertising_description_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess gifMargin=${gifMargin}, expected=descMargin`);
      expect(gifMargin).assertLess(descMargin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gifMargin >= 30=${gifMargin >= 30}`);
      expect(gifMargin >= 30).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess gifMargin=${gifMargin}, expected=120`);
      expect(gifMargin).assertLess(120);
      log('testWindowStartIconAdInteger0220 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0221
     * @tc.name      testWindowStartIconAdInteger0221
     * @tc.desc      Verify the skip text left margin resource equals 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0221 begin');
      const actual: number = getNumber($r('app.integer.skip_text_margin_left'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=15`);
      expect(actual).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0221 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0222
     * @tc.name      testWindowStartIconAdInteger0222
     * @tc.desc      Verify the skip text margin is near the skip font size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0222 begin');
      const skipTextMargin: number = getNumber($r('app.integer.skip_text_margin_left'));
      const skipFont: number = getNumber($r('app.integer.advertising_description_skip_font_size'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger skipTextMargin / skipFont=${skipTextMargin / skipFont}`);
      expect(skipTextMargin / skipFont).assertLarger(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess skipTextMargin / skipFont=${skipTextMargin / skipFont}`);
      expect(skipTextMargin / skipFont).assertLess(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual skipTextMargin=${skipTextMargin}, expected=15`);
      expect(skipTextMargin).assertEqual(15);
      log('testWindowStartIconAdInteger0222 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0223
     * @tc.name      testWindowStartIconAdInteger0223
     * @tc.desc      Verify the skip button top margin resource equals 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0223 begin');
      const actual: number = getNumber($r('app.integer.skip_button_margin_top'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=50`);
      expect(actual).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowStartIconAdInteger0223 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0224
     * @tc.name      testWindowStartIconAdInteger0224
     * @tc.desc      Verify the skip right margin exceeds the top margin to hug the corner.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0224 begin');
      const marginTop: number = getNumber($r('app.integer.skip_button_margin_top'));
      const marginRight: number = getNumber($r('app.integer.skip_button_margin_right'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger marginRight=${marginRight}, expected=marginTop`);
      expect(marginRight).assertLarger(marginTop);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual marginTop=${marginTop}, expected=50`);
      expect(marginTop).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual marginRight=${marginRight}, expected=60`);
      expect(marginRight).assertEqual(60);
      log('testWindowStartIconAdInteger0224 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0225
     * @tc.name      testWindowStartIconAdInteger0225
     * @tc.desc      Verify the skip button right margin resource equals 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0225 begin');
      const actual: number = getNumber($r('app.integer.skip_button_margin_right'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=60`);
      expect(actual).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(actual)=${Number.isFinite(actual)}`);
      expect(Number.isFinite(actual)).assertTrue();
      log('testWindowStartIconAdInteger0225 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0226
     * @tc.name      testWindowStartIconAdInteger0226
     * @tc.desc      Verify the skip horizontal position exceeds button width plus margins.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0226 begin');
      const posX: number = getNumber($r('app.integer.advertising_description_skip_position_x'));
      const width: number = getNumber($r('app.integer.advertising_description_skip_width'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger posX=${posX}, expected=width`);
      expect(posX).assertLarger(width);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual posX - width=${posX - width}, expected=200`);
      expect(posX - width).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual posX=${posX}, expected=280`);
      expect(posX).assertEqual(280);
      log('testWindowStartIconAdInteger0226 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0227
     * @tc.name      testWindowStartIconAdInteger0227
     * @tc.desc      Verify all fourteen integer dimension resources resolve as positive finite numbers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0227 begin');
      const values: number[] = [
        getNumber($r('app.integer.advertising_description_skip_borderRadius')),
        getNumber($r('app.integer.advertising_description_skip_width')),
        getNumber($r('app.integer.advertising_description_skip_position_y')),
        getNumber($r('app.integer.advertising_description_skip_position_x')),
        getNumber($r('app.integer.advertising_description_pageCountDown_margin')),
        getNumber($r('app.integer.advertising_description_skip_font_size')),
        getNumber($r('app.integer.advertising_description_margin')),
        getNumber($r('app.integer.advertising_description_font_size')),
        getNumber($r('app.integer.advertising_description_text_margin')),
        getNumber($r('app.integer.advertising_page_font_size')),
        getNumber($r('app.integer.advertising_page_gif_margin')),
        getNumber($r('app.integer.skip_text_margin_left')),
        getNumber($r('app.integer.skip_button_margin_top')),
        getNumber($r('app.integer.skip_button_margin_right'))
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values.length=${values.length}, expected=14`);
      expect(values.length).assertEqual(14);
      let allPositive: boolean = true;
      for (let i: number = 0; i < values.length; i++) {
        if (!(Number.isFinite(values[i]) && values[i] > 0)) {
          allPositive = false;
          break;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allPositive=${allPositive}, expected=true`);
      expect(allPositive).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof allPositive=${typeof allPositive}, expected='boolean'`);
      expect(typeof allPositive).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values[0]=${values[0]}, expected=18`);
      expect(values[0]).assertEqual(18);
      log('testWindowStartIconAdInteger0227 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0228
     * @tc.name      testWindowStartIconAdInteger0228
     * @tc.desc      Verify repeated reads of the skip width resource are idempotent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0228 begin');
      const first: number = getNumber($r('app.integer.advertising_description_skip_width'));
      const second: number = getNumber($r('app.integer.advertising_description_skip_width'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=80`);
      expect(first).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof second=${typeof second}, expected='number'`);
      expect(typeof second).assertEqual('number');
      log('testWindowStartIconAdInteger0228 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0229
     * @tc.name      testWindowStartIconAdInteger0229
     * @tc.desc      Verify a complete countdown skip pill geometry fits its width and radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0229 begin');
      const width: number = getNumber($r('app.integer.advertising_description_skip_width'));
      const radius: number = getNumber($r('app.integer.advertising_description_skip_borderRadius'));
      const textMargin: number = getNumber($r('app.integer.skip_text_margin_left'));
      const countdownMargin: number = getNumber($r('app.integer.advertising_description_pageCountDown_margin'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=radius * 2`);
      expect(width).assertLarger(radius * 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=textMargin + countdownMargin`);
      expect(width).assertLarger(textMargin + countdownMargin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width / radius=${width / radius}, expected=3`);
      expect(width / radius).assertLarger(3);
      log('testWindowStartIconAdInteger0229 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADINTEGER_0230
     * @tc.name      testWindowStartIconAdInteger0230
     * @tc.desc      Verify the skip vertical offset stays below the pill width on screen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdInteger0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdInteger0230 begin');
      const posY: number = getNumber($r('app.integer.advertising_description_skip_position_y'));
      const width: number = getNumber($r('app.integer.advertising_description_skip_width'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual posY=${posY}, expected=40`);
      expect(posY).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual width=${width}, expected=80`);
      expect(width).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess posY=${posY}, expected=width`);
      expect(posY).assertLess(width);
      log('testWindowStartIconAdInteger0230 end');
    })
  })
}
