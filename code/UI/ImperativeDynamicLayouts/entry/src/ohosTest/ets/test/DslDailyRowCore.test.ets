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
const TAG: string = 'DslDailyRowCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;
const dailyRow: ESObject = topLevel[3];
const dailyKids: Array<ESObject> = dailyRow.children as Array<ESObject>;

export default function dslDailyRowCoreTest(): void {
  describe('DslDailyRowCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0401
     * @tc.name      testDslDailyRow0401
     * @tc.desc      Verify the daily section is a Row node.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(dailyRow.type)=${String(dailyRow.type)}`);
      expect(String(dailyRow.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof dailyRow.type=${typeof dailyRow.type}`);
      expect(typeof dailyRow.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue dailyRow.css !== undefined=${dailyRow.css !== undefined}`);
      expect(dailyRow.css !== undefined).assertTrue();
      log('testDslDailyRow0401 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0402
     * @tc.name      testDslDailyRow0402
     * @tc.desc      Verify the daily row paddings are symmetric at 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0402 begin');
      const padding: ESObject = dailyRow.css.padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue padding !== undefined=${padding !== undefined}`);
      expect(padding !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}, expected=15`);
      expect(Number(padding.left)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}`);
      expect(Number(padding.left)).assertEqual(Number(padding.right));
      log('testDslDailyRow0402 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0403
     * @tc.name      testDslDailyRow0403
     * @tc.desc      Verify the daily row margins are symmetric at 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0403 begin');
      const margin: ESObject = dailyRow.css.margin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue margin !== undefined=${margin !== undefined}`);
      expect(margin !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}, expected=5`);
      expect(Number(margin.top)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}`);
      expect(Number(margin.top)).assertEqual(Number(margin.bottom));
      log('testDslDailyRow0403 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0404
     * @tc.name      testDslDailyRow0404
     * @tc.desc      Verify the daily row is full width with space between.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0404 begin');
      const css: ESObject = dailyRow.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.justifyContent)=${String(css.justifyContent)}`);
      expect(String(css.justifyContent)).assertEqual('FlexAlign.SpaceBetween');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.justifyContent=${typeof css.justifyContent}`);
      expect(typeof css.justifyContent).assertEqual('string');
      log('testDslDailyRow0404 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0405
     * @tc.name      testDslDailyRow0405
     * @tc.desc      Verify the daily row holds two Text children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0405 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(dailyRow.children)}`);
      expect(Array.isArray(dailyRow.children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dailyKids.length=${dailyKids.length}, expected=2`);
      expect(dailyKids.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(dailyKids[0].type)=${String(dailyKids[0].type)}`);
      expect(String(dailyKids[0].type)).assertEqual('Text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(dailyKids[1].type)=${String(dailyKids[1].type)}`);
      expect(String(dailyKids[1].type)).assertEqual('Text');
      log('testDslDailyRow0405 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0406
     * @tc.name      testDslDailyRow0406
     * @tc.desc      Verify the daily section title text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0406 begin');
      const title: ESObject = dailyKids[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(title.content)=${String(title.content)}`);
      expect(String(title.content)).assertEqual('每日推荐');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(title.type)=${String(title.type)}, expected='Text'`);
      expect(String(title.type)).assertEqual('Text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof title.content=${typeof title.content}`);
      expect(typeof title.content).assertEqual('string');
      log('testDslDailyRow0406 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0407
     * @tc.name      testDslDailyRow0407
     * @tc.desc      Verify the daily title uses fontSize 24 in white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0407 begin');
      const css: ESObject = dailyKids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.fontSize)=${Number(css.fontSize)}, expected=24`);
      expect(Number(css.fontSize)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.fontColor)=${String(css.fontColor)}`);
      expect(String(css.fontColor)).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.fontSize=${typeof css.fontSize}`);
      expect(typeof css.fontSize).assertEqual('number');
      log('testDslDailyRow0407 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0408
     * @tc.name      testDslDailyRow0408
     * @tc.desc      Verify the more entry label and its smaller font size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0408 begin');
      const more: ESObject = dailyKids[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(more.content)=${String(more.content)}, expected='更多'`);
      expect(String(more.content)).assertEqual('更多');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(more.css.fontSize)=${Number(more.css.fontSize)}`);
      expect(Number(more.css.fontSize)).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(more.css.fontSize)=${Number(more.css.fontSize)}`);
      expect(Number(more.css.fontSize)).assertLarger(0);
      log('testDslDailyRow0408 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0409
     * @tc.name      testDslDailyRow0409
     * @tc.desc      Verify the more entry is a half opacity white text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0409 begin');
      const css: ESObject = dailyKids[1].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.fontColor)=${String(css.fontColor)}`);
      expect(String(css.fontColor)).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.opacity)=${Number(css.opacity)}, expected=0.5`);
      expect(Number(css.opacity)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.opacity)=${Number(css.opacity)}, expected=0`);
      expect(Number(css.opacity)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess Number(css.opacity)=${Number(css.opacity)}, expected=1`);
      expect(Number(css.opacity)).assertLess(1);
      log('testDslDailyRow0409 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDAILY_0410
     * @tc.name      testDslDailyRow0410
     * @tc.desc      Verify the two daily row fonts differ in size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDailyRow0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDailyRow0410 begin');
      const titleSize: number = Number(dailyKids[0].css.fontSize);
      const moreSize: number = Number(dailyKids[1].css.fontSize);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titleSize=${titleSize}, expected=24`);
      expect(titleSize).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual moreSize=${moreSize}, expected=20`);
      expect(moreSize).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger titleSize=${titleSize}, expected=moreSize`);
      expect(titleSize).assertLarger(moreSize);
      log('testDslDailyRow0410 end');
    })
  })
}
