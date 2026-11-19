/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { dslData } from '../../../main/ets/bridge/ImperativeDynamicLayoutsBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DslSwiperCarouselCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;
const swiper: ESObject = topLevel[1];
const slides: Array<ESObject> = swiper.children as Array<ESObject>;

export default function dslSwiperCarouselCoreTest(): void {
  describe('DslSwiperCarouselCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0201
     * @tc.name      testDslSwiperCarousel0201
     * @tc.desc      Verify the carousel section is a Swiper node.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(swiper.type)=${String(swiper.type)}`);
      expect(String(swiper.type)).assertEqual('Swiper');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof swiper.type=${typeof swiper.type}, expected='string'`);
      expect(typeof swiper.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swiper.css !== undefined=${swiper.css !== undefined}`);
      expect(swiper.css !== undefined).assertTrue();
      log('testDslSwiperCarousel0201 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0202
     * @tc.name      testDslSwiperCarousel0202
     * @tc.desc      Verify the swiper spans the full width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0202 begin');
      const css: ESObject = swiper.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.width=${typeof css.width}, expected='string'`);
      expect(typeof css.width).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(css.width) === '40%'=${String(css.width) === '40%'}`);
      expect(String(css.width) === '40%').assertFalse();
      log('testDslSwiperCarousel0202 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0203
     * @tc.name      testDslSwiperCarousel0203
     * @tc.desc      Verify the swiper holds exactly three slides.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(swiper.children)}`);
      expect(Array.isArray(swiper.children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual slides.length=${slides.length}, expected=3`);
      expect(slides.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger slides.length=${slides.length}, expected=0`);
      expect(slides.length).assertLarger(0);
      log('testDslSwiperCarousel0203 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0204
     * @tc.name      testDslSwiperCarousel0204
     * @tc.desc      Verify the swiper carries neither id nor text content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0204 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swiper.id === undefined=${swiper.id === undefined}`);
      expect(swiper.id === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swiper.content === undefined=${swiper.content === undefined}`);
      expect(swiper.content === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(swiper.id)=${String(swiper.id)}, expected='undefined'`);
      expect(String(swiper.id)).assertEqual('undefined');
      log('testDslSwiperCarousel0204 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0205
     * @tc.name      testDslSwiperCarousel0205
     * @tc.desc      Verify slide one is the movie1 image resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0205 begin');
      const slide: ESObject = slides[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slide.type)=${String(slide.type)}, expected='Image'`);
      expect(String(slide.type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slide.content)=${String(slide.content)}`);
      expect(String(slide.content)).assertEqual('app.media.movie1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(slide.content)=${String(slide.content)}`);
      expect(String(slide.content)).assertContain('app.media.');
      log('testDslSwiperCarousel0205 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0206
     * @tc.name      testDslSwiperCarousel0206
     * @tc.desc      Verify slide two is the movie2 image resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0206 begin');
      const slide: ESObject = slides[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slide.type)=${String(slide.type)}, expected='Image'`);
      expect(String(slide.type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slide.content)=${String(slide.content)}`);
      expect(String(slide.content)).assertEqual('app.media.movie2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(slide.content)=${String(slide.content)}`);
      expect(String(slide.content)).assertContain('app.media.');
      log('testDslSwiperCarousel0206 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0207
     * @tc.name      testDslSwiperCarousel0207
     * @tc.desc      Verify slide three is the movie3 image resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0207 begin');
      const slide: ESObject = slides[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slide.type)=${String(slide.type)}, expected='Image'`);
      expect(String(slide.type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slide.content)=${String(slide.content)}`);
      expect(String(slide.content)).assertEqual('app.media.movie3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(slide.content)=${String(slide.content)}`);
      expect(String(slide.content)).assertContain('app.media.');
      log('testDslSwiperCarousel0207 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0208
     * @tc.name      testDslSwiperCarousel0208
     * @tc.desc      Verify slide one fills the swiper height ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0208 begin');
      const css: ESObject = slides[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.height)=${String(css.height)}, expected='40%'`);
      expect(String(css.height)).assertEqual('40%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.height=${typeof css.height}, expected='string'`);
      expect(typeof css.height).assertEqual('string');
      log('testDslSwiperCarousel0208 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0209
     * @tc.name      testDslSwiperCarousel0209
     * @tc.desc      Verify slide two fills the swiper height ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0209 begin');
      const css: ESObject = slides[1].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.height)=${String(css.height)}, expected='40%'`);
      expect(String(css.height)).assertEqual('40%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.width=${typeof css.width}, expected='string'`);
      expect(typeof css.width).assertEqual('string');
      log('testDslSwiperCarousel0209 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0210
     * @tc.name      testDslSwiperCarousel0210
     * @tc.desc      Verify slide three fills the swiper height ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0210 begin');
      const css: ESObject = slides[2].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.height)=${String(css.height)}, expected='40%'`);
      expect(String(css.height)).assertEqual('40%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.height=${typeof css.height}, expected='string'`);
      expect(typeof css.height).assertEqual('string');
      log('testDslSwiperCarousel0210 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0211
     * @tc.name      testDslSwiperCarousel0211
     * @tc.desc      Verify all slides share the same css dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0211 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slides[0].css.width)=${String(slides[0].css.width)}`);
      expect(String(slides[0].css.width)).assertEqual(String(slides[1].css.width));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slides[1].css.width)=${String(slides[1].css.width)}`);
      expect(String(slides[1].css.width)).assertEqual(String(slides[2].css.width));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slides[0].css.height)=${String(slides[0].css.height)}`);
      expect(String(slides[0].css.height)).assertEqual(String(slides[2].css.height));
      log('testDslSwiperCarousel0211 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0212
     * @tc.name      testDslSwiperCarousel0212
     * @tc.desc      Verify slide one defines no rounded corners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0212 begin');
      const css: ESObject = slides[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.borderRadius === undefined}`);
      expect(css.borderRadius === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.backgroundColor === undefined}`);
      expect(css.backgroundColor === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.fontSize === undefined=${css.fontSize === undefined}`);
      expect(css.fontSize === undefined).assertTrue();
      log('testDslSwiperCarousel0212 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0213
     * @tc.name      testDslSwiperCarousel0213
     * @tc.desc      Verify slide two defines no rounded corners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0213 begin');
      const css: ESObject = slides[1].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.borderRadius === undefined}`);
      expect(css.borderRadius === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.backgroundColor === undefined}`);
      expect(css.backgroundColor === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.opacity === undefined=${css.opacity === undefined}`);
      expect(css.opacity === undefined).assertTrue();
      log('testDslSwiperCarousel0213 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0214
     * @tc.name      testDslSwiperCarousel0214
     * @tc.desc      Verify slide three defines no rounded corners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0214 begin');
      const css: ESObject = slides[2].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.borderRadius === undefined}`);
      expect(css.borderRadius === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.padding === undefined=${css.padding === undefined}`);
      expect(css.padding === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.margin === undefined=${css.margin === undefined}`);
      expect(css.margin === undefined).assertTrue();
      log('testDslSwiperCarousel0214 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0215
     * @tc.name      testDslSwiperCarousel0215
     * @tc.desc      Verify the slide order starts with movie1 and ends with movie3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0215 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slides[0].content)=${String(slides[0].content)}`);
      expect(String(slides[0].content)).assertEqual('app.media.movie1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slides[2].content)=${String(slides[2].content)}`);
      expect(String(slides[2].content)).assertEqual('app.media.movie3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(slides[0].content) === String(slides[2].content)`);
      expect(String(slides[0].content) === String(slides[2].content)).assertFalse();
      log('testDslSwiperCarousel0215 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLSWIPER_0216
     * @tc.name      testDslSwiperCarousel0216
     * @tc.desc      Verify every swiper child is an Image leaf.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslSwiperCarousel0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslSwiperCarousel0216 begin');
      for (let i: number = 0; i < slides.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(slides[i].type)=${String(slides[i].type)}`);
        expect(String(slides[i].type)).assertEqual('Image');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${Array.isArray(slides[i].children)}`);
        expect(Array.isArray(slides[i].children)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual slides.length=${slides.length}, expected=3`);
      expect(slides.length).assertEqual(3);
      log('testDslSwiperCarousel0216 end');
    })
  })
}
