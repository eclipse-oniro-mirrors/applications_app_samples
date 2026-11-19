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
const TAG: string = 'DslMovieColumnsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;
const movieRow: ESObject = topLevel[4];
const columns: Array<ESObject> = movieRow.children as Array<ESObject>;
const col0Kids: Array<ESObject> = columns[0].children as Array<ESObject>;
const col1Kids: Array<ESObject> = columns[1].children as Array<ESObject>;

export default function dslMovieColumnsCoreTest(): void {
  describe('DslMovieColumnsCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0501
     * @tc.name      testDslMovieColumns0501
     * @tc.desc      Verify the movie section is a Row node.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0501 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(movieRow.type)=${String(movieRow.type)}`);
      expect(String(movieRow.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof movieRow.type=${typeof movieRow.type}`);
      expect(typeof movieRow.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue movieRow.css !== undefined=${movieRow.css !== undefined}`);
      expect(movieRow.css !== undefined).assertTrue();
      log('testDslMovieColumns0501 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0502
     * @tc.name      testDslMovieColumns0502
     * @tc.desc      Verify the movie row paddings are symmetric at 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0502 begin');
      const padding: ESObject = movieRow.css.padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue padding !== undefined=${padding !== undefined}`);
      expect(padding !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}, expected=15`);
      expect(Number(padding.left)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}`);
      expect(Number(padding.left)).assertEqual(Number(padding.right));
      log('testDslMovieColumns0502 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0503
     * @tc.name      testDslMovieColumns0503
     * @tc.desc      Verify the movie row margins are symmetric at 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0503 begin');
      const margin: ESObject = movieRow.css.margin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue margin !== undefined=${margin !== undefined}`);
      expect(margin !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}, expected=5`);
      expect(Number(margin.top)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}`);
      expect(Number(margin.top)).assertEqual(Number(margin.bottom));
      log('testDslMovieColumns0503 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0504
     * @tc.name      testDslMovieColumns0504
     * @tc.desc      Verify the movie row is full width with space between.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0504 begin');
      const css: ESObject = movieRow.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.justifyContent)=${String(css.justifyContent)}`);
      expect(String(css.justifyContent)).assertEqual('FlexAlign.SpaceBetween');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.width=${typeof css.width}, expected='string'`);
      expect(typeof css.width).assertEqual('string');
      log('testDslMovieColumns0504 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0505
     * @tc.name      testDslMovieColumns0505
     * @tc.desc      Verify the movie row holds two Column children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0505 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(movieRow.children)}`);
      expect(Array.isArray(movieRow.children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual columns.length=${columns.length}, expected=2`);
      expect(columns.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(columns[0].type)=${String(columns[0].type)}`);
      expect(String(columns[0].type)).assertEqual('Column');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(columns[1].type)=${String(columns[1].type)}`);
      expect(String(columns[1].type)).assertEqual('Column');
      log('testDslMovieColumns0505 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0506
     * @tc.name      testDslMovieColumns0506
     * @tc.desc      Verify the first movie column aligns items to the start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0506 begin');
      const css: ESObject = columns[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.alignItems)=${String(css.alignItems)}`);
      expect(String(css.alignItems)).assertEqual('HorizontalAlign.Start');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.alignItems=${typeof css.alignItems}`);
      expect(typeof css.alignItems).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.width === undefined=${css.width === undefined}`);
      expect(css.width === undefined).assertTrue();
      log('testDslMovieColumns0506 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0507
     * @tc.name      testDslMovieColumns0507
     * @tc.desc      Verify the second movie column aligns items to the start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0507 begin');
      const css: ESObject = columns[1].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.alignItems)=${String(css.alignItems)}`);
      expect(String(css.alignItems)).assertEqual('HorizontalAlign.Start');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.alignItems=${typeof css.alignItems}`);
      expect(typeof css.alignItems).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.height === undefined=${css.height === undefined}`);
      expect(css.height === undefined).assertTrue();
      log('testDslMovieColumns0507 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0508
     * @tc.name      testDslMovieColumns0508
     * @tc.desc      Verify the first column stacks an image above a text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0508 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(columns[0].children)}`);
      expect(Array.isArray(columns[0].children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual col0Kids.length=${col0Kids.length}, expected=2`);
      expect(col0Kids.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(col0Kids[0].type)=${String(col0Kids[0].type)}`);
      expect(String(col0Kids[0].type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(col0Kids[1].type)=${String(col0Kids[1].type)}`);
      expect(String(col0Kids[1].type)).assertEqual('Text');
      log('testDslMovieColumns0508 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0509
     * @tc.name      testDslMovieColumns0509
     * @tc.desc      Verify the second column stacks an image above a text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0509 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(columns[1].children)}`);
      expect(Array.isArray(columns[1].children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual col1Kids.length=${col1Kids.length}, expected=2`);
      expect(col1Kids.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(col1Kids[0].type)=${String(col1Kids[0].type)}`);
      expect(String(col1Kids[0].type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(col1Kids[1].type)=${String(col1Kids[1].type)}`);
      expect(String(col1Kids[1].type)).assertEqual('Text');
      log('testDslMovieColumns0509 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0510
     * @tc.name      testDslMovieColumns0510
     * @tc.desc      Verify the first poster uses the movie4 resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0510 begin');
      const poster: ESObject = col0Kids[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(poster.content)=${String(poster.content)}`);
      expect(String(poster.content)).assertEqual('app.media.movie4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(poster.type)=${String(poster.type)}, expected='Image'`);
      expect(String(poster.type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(poster.content)=${String(poster.content)}`);
      expect(String(poster.content)).assertContain('app.media.');
      log('testDslMovieColumns0510 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0511
     * @tc.name      testDslMovieColumns0511
     * @tc.desc      Verify the first poster is 170x120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0511 begin');
      const css: ESObject = col0Kids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.width)=${Number(css.width)}, expected=170`);
      expect(Number(css.width)).assertEqual(170);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.height)=${Number(css.height)}, expected=120`);
      expect(Number(css.height)).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.width)=${Number(css.width)}`);
      expect(Number(css.width)).assertLarger(Number(css.height));
      log('testDslMovieColumns0511 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0512
     * @tc.name      testDslMovieColumns0512
     * @tc.desc      Verify the first poster has rounded corners of 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0512 begin');
      const css: ESObject = col0Kids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.borderRadius)=${Number(css.borderRadius)}`);
      expect(Number(css.borderRadius)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.borderRadius=${typeof css.borderRadius}`);
      expect(typeof css.borderRadius).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.backgroundColor === undefined}`);
      expect(css.backgroundColor === undefined).assertTrue();
      log('testDslMovieColumns0512 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0513
     * @tc.name      testDslMovieColumns0513
     * @tc.desc      Verify the first caption text and its white color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0513 begin');
      const caption: ESObject = col0Kids[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(caption.content)=${String(caption.content)}`);
      expect(String(caption.content)).assertEqual('电影1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(caption.css.fontColor)}, expected='#ffffff'`);
      expect(String(caption.css.fontColor)).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${caption.css.fontSize === undefined}`);
      expect(caption.css.fontSize === undefined).assertTrue();
      log('testDslMovieColumns0513 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0514
     * @tc.name      testDslMovieColumns0514
     * @tc.desc      Verify the second poster uses the movie5 resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0514 begin');
      const poster: ESObject = col1Kids[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(poster.content)=${String(poster.content)}`);
      expect(String(poster.content)).assertEqual('app.media.movie5');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(poster.type)=${String(poster.type)}, expected='Image'`);
      expect(String(poster.type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(poster.content)=${String(poster.content)}`);
      expect(String(poster.content)).assertContain('app.media.');
      log('testDslMovieColumns0514 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0515
     * @tc.name      testDslMovieColumns0515
     * @tc.desc      Verify the second poster is 170x120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0515 begin');
      const css: ESObject = col1Kids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.width)=${Number(css.width)}, expected=170`);
      expect(Number(css.width)).assertEqual(170);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.height)=${Number(css.height)}, expected=120`);
      expect(Number(css.height)).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.height)=${Number(css.height)}, expected=0`);
      expect(Number(css.height)).assertLarger(0);
      log('testDslMovieColumns0515 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0516
     * @tc.name      testDslMovieColumns0516
     * @tc.desc      Verify the second poster has rounded corners of 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0516 begin');
      const css: ESObject = col1Kids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.borderRadius)=${Number(css.borderRadius)}`);
      expect(Number(css.borderRadius)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.borderRadius=${typeof css.borderRadius}`);
      expect(typeof css.borderRadius).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.opacity === undefined=${css.opacity === undefined}`);
      expect(css.opacity === undefined).assertTrue();
      log('testDslMovieColumns0516 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0517
     * @tc.name      testDslMovieColumns0517
     * @tc.desc      Verify the second caption text and its white color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0517 begin');
      const caption: ESObject = col1Kids[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(caption.content)=${String(caption.content)}`);
      expect(String(caption.content)).assertEqual('电影2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(caption.css.fontColor)}, expected='#ffffff'`);
      expect(String(caption.css.fontColor)).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${caption.css.backgroundColor === undefined}`);
      expect(caption.css.backgroundColor === undefined).assertTrue();
      log('testDslMovieColumns0517 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0518
     * @tc.name      testDslMovieColumns0518
     * @tc.desc      Verify the two posters share identical css dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0518 begin');
      const css0: ESObject = col0Kids[0].css;
      const css1: ESObject = col1Kids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css0.width)=${Number(css0.width)}`);
      expect(Number(css0.width)).assertEqual(Number(css1.width));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css0.height)=${Number(css0.height)}`);
      expect(Number(css0.height)).assertEqual(Number(css1.height));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css0.borderRadius)=${Number(css0.borderRadius)}`);
      expect(Number(css0.borderRadius)).assertEqual(Number(css1.borderRadius));
      log('testDslMovieColumns0518 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0519
     * @tc.name      testDslMovieColumns0519
     * @tc.desc      Verify both captions carry no fixed dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0519 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${col0Kids[1].css.width === undefined}`);
      expect(col0Kids[1].css.width === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${col0Kids[1].css.height === undefined}`);
      expect(col0Kids[1].css.height === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${col1Kids[1].css.width === undefined}`);
      expect(col1Kids[1].css.width === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${col1Kids[1].css.height === undefined}`);
      expect(col1Kids[1].css.height === undefined).assertTrue();
      log('testDslMovieColumns0519 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLMOVIE_0520
     * @tc.name      testDslMovieColumns0520
     * @tc.desc      Verify the two movie entries are fully distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslMovieColumns0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslMovieColumns0520 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(col0Kids[0].content) === String(col1Kids[0].content)`);
      expect(String(col0Kids[0].content) === String(col1Kids[0].content)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(col0Kids[1].content) === String(col1Kids[1].content)`);
      expect(String(col0Kids[1].content) === String(col1Kids[1].content)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue columns[0] !== columns[1]=${columns[0] !== columns[1]}`);
      expect(columns[0] !== columns[1]).assertTrue();
      log('testDslMovieColumns0520 end');
    })
  })
}
