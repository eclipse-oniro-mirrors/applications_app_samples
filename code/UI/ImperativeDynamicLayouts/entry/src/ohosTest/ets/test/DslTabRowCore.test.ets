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
const TAG: string = 'DslTabRowCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;
const tabRow: ESObject = topLevel[2];
const tabs: Array<ESObject> = tabRow.children as Array<ESObject>;
const headerMarginTop: number = 5;

export default function dslTabRowCoreTest(): void {
  describe('DslTabRowCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0301
     * @tc.name      testDslTabRow0301
     * @tc.desc      Verify the tab section is a Row node.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0301 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tabRow.type)=${String(tabRow.type)}, expected='Row'`);
      expect(String(tabRow.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof tabRow.type=${typeof tabRow.type}, expected='string'`);
      expect(typeof tabRow.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue tabRow.css !== undefined=${tabRow.css !== undefined}`);
      expect(tabRow.css !== undefined).assertTrue();
      log('testDslTabRow0301 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0302
     * @tc.name      testDslTabRow0302
     * @tc.desc      Verify the tab row spans the full width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0302 begin');
      const css: ESObject = tabRow.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.width=${typeof css.width}, expected='string'`);
      expect(typeof css.width).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(css.width) === '75'=${String(css.width) === '75'}`);
      expect(String(css.width) === '75').assertFalse();
      log('testDslTabRow0302 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0303
     * @tc.name      testDslTabRow0303
     * @tc.desc      Verify the tab row sets a numeric left padding of 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0303 begin');
      const padding: ESObject = tabRow.css.padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue padding !== undefined=${padding !== undefined}`);
      expect(padding !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}, expected=15`);
      expect(Number(padding.left)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof padding.left=${typeof padding.left}`);
      expect(typeof padding.left).assertEqual('number');
      log('testDslTabRow0303 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0304
     * @tc.name      testDslTabRow0304
     * @tc.desc      Verify the tab row paddings are symmetric at 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0304 begin');
      const padding: ESObject = tabRow.css.padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.right)=${Number(padding.right)}, expected=15`);
      expect(Number(padding.right)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}`);
      expect(Number(padding.left)).assertEqual(Number(padding.right));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(padding.right)=${Number(padding.right)}, expected=0`);
      expect(Number(padding.right)).assertLarger(0);
      log('testDslTabRow0304 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0305
     * @tc.name      testDslTabRow0305
     * @tc.desc      Verify the tab row uses a larger top margin of 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0305 begin');
      const margin: ESObject = tabRow.css.margin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue margin !== undefined=${margin !== undefined}`);
      expect(margin !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}, expected=15`);
      expect(Number(margin.top)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof margin.top=${typeof margin.top}, expected='number'`);
      expect(typeof margin.top).assertEqual('number');
      log('testDslTabRow0305 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0306
     * @tc.name      testDslTabRow0306
     * @tc.desc      Verify the tab row margins are symmetric at 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0306 begin');
      const margin: ESObject = tabRow.css.margin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.bottom)=${Number(margin.bottom)}, expected=15`);
      expect(Number(margin.bottom)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}`);
      expect(Number(margin.top)).assertEqual(Number(margin.bottom));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(margin.top)=${Number(margin.top)}`);
      expect(Number(margin.top)).assertLarger(headerMarginTop);
      log('testDslTabRow0306 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0307
     * @tc.name      testDslTabRow0307
     * @tc.desc      Verify the tab row declares space between alignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0307 begin');
      const css: ESObject = tabRow.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.justifyContent)=${String(css.justifyContent)}`);
      expect(String(css.justifyContent)).assertEqual('FlexAlign.SpaceBetween');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.justifyContent=${typeof css.justifyContent}`);
      expect(typeof css.justifyContent).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(css.justifyContent)=${String(css.justifyContent)}`);
      expect(String(css.justifyContent)).assertContain('SpaceBetween');
      log('testDslTabRow0307 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0308
     * @tc.name      testDslTabRow0308
     * @tc.desc      Verify the tab row holds exactly four tabs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0308 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(tabRow.children)}`);
      expect(Array.isArray(tabRow.children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabs.length=${tabs.length}, expected=4`);
      expect(tabs.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger tabs.length=${tabs.length}, expected=0`);
      expect(tabs.length).assertLarger(0);
      log('testDslTabRow0308 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0309
     * @tc.name      testDslTabRow0309
     * @tc.desc      Verify every tab child is a Text node.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0309 begin');
      for (let i: number = 0; i < tabs.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tabs[i].type)=${String(tabs[i].type)}`);
        expect(String(tabs[i].type)).assertEqual('Text');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${Array.isArray(tabs[i].children)}`);
        expect(Array.isArray(tabs[i].children)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabs.length=${tabs.length}, expected=4`);
      expect(tabs.length).assertEqual(4);
      log('testDslTabRow0309 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0310
     * @tc.name      testDslTabRow0310
     * @tc.desc      Verify the first tab label is the featured channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0310 begin');
      const featured: ESObject = tabs[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(featured.content)=${String(featured.content)}`);
      expect(String(featured.content)).assertEqual('精选');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(featured.type)=${String(featured.type)}`);
      expect(String(featured.type)).assertEqual('Text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof featured.content=${typeof featured.content}`);
      expect(typeof featured.content).assertEqual('string');
      log('testDslTabRow0310 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0311
     * @tc.name      testDslTabRow0311
     * @tc.desc      Verify the featured tab is a 75x40 pill.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0311 begin');
      const css: ESObject = tabs[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.width)=${Number(css.width)}, expected=75`);
      expect(Number(css.width)).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.height)=${Number(css.height)}, expected=40`);
      expect(Number(css.height)).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.height)=${Number(css.height)}, expected=0`);
      expect(Number(css.height)).assertLarger(0);
      log('testDslTabRow0311 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0312
     * @tc.name      testDslTabRow0312
     * @tc.desc      Verify the featured tab is fully rounded with black text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0312 begin');
      const css: ESObject = tabs[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.borderRadius)=${Number(css.borderRadius)}`);
      expect(Number(css.borderRadius)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.fontColor)=${String(css.fontColor)}`);
      expect(String(css.fontColor)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.borderRadius=${typeof css.borderRadius}`);
      expect(typeof css.borderRadius).assertEqual('number');
      log('testDslTabRow0312 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0313
     * @tc.name      testDslTabRow0313
     * @tc.desc      Verify the featured tab uses a white background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0313 begin');
      const css: ESObject = tabs[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.backgroundColor)=${String(css.backgroundColor)}`);
      expect(String(css.backgroundColor)).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.backgroundColor=${typeof css.backgroundColor}`);
      expect(typeof css.backgroundColor).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(css.backgroundColor) === '#808080'}`);
      expect(String(css.backgroundColor) === '#808080').assertFalse();
      log('testDslTabRow0313 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0314
     * @tc.name      testDslTabRow0314
     * @tc.desc      Verify the series tab label with gray background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0314 begin');
      const tab: ESObject = tabs[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tab.content)=${String(tab.content)}, expected='电视剧'`);
      expect(String(tab.content)).assertEqual('电视剧');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(tab.css.backgroundColor)}`);
      expect(String(tab.css.backgroundColor)).assertEqual('#808080');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tab.type)=${String(tab.type)}, expected='Text'`);
      expect(String(tab.type)).assertEqual('Text');
      log('testDslTabRow0314 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0315
     * @tc.name      testDslTabRow0315
     * @tc.desc      Verify the movie tab label with gray background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0315 begin');
      const tab: ESObject = tabs[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tab.content)=${String(tab.content)}, expected='电影'`);
      expect(String(tab.content)).assertEqual('电影');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(tab.css.backgroundColor)}`);
      expect(String(tab.css.backgroundColor)).assertEqual('#808080');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(tab.content) === String(tabs[1].content)}`);
      expect(String(tab.content) === String(tabs[1].content)).assertFalse();
      log('testDslTabRow0315 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0316
     * @tc.name      testDslTabRow0316
     * @tc.desc      Verify the variety tab label with gray background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0316 begin');
      const tab: ESObject = tabs[3];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tab.content)=${String(tab.content)}, expected='综艺'`);
      expect(String(tab.content)).assertEqual('综艺');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(tab.css.backgroundColor)}`);
      expect(String(tab.css.backgroundColor)).assertEqual('#808080');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(tab.content) === String(tabs[0].content)}`);
      expect(String(tab.content) === String(tabs[0].content)).assertFalse();
      log('testDslTabRow0316 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0317
     * @tc.name      testDslTabRow0317
     * @tc.desc      Verify the three gray tabs share identical pill dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0317 begin');
      const css1: ESObject = tabs[1].css;
      const css2: ESObject = tabs[2].css;
      const css3: ESObject = tabs[3].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css1.width)=${Number(css1.width)}`);
      expect(Number(css1.width)).assertEqual(Number(css2.width));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css2.width)=${Number(css2.width)}`);
      expect(Number(css2.width)).assertEqual(Number(css3.width));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css1.borderRadius)=${Number(css1.borderRadius)}`);
      expect(Number(css1.borderRadius)).assertEqual(Number(css3.borderRadius));
      log('testDslTabRow0317 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0318
     * @tc.name      testDslTabRow0318
     * @tc.desc      Verify the featured tab stands out from gray tabs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0318 begin');
      const featuredBg: string = String(tabs[0].css.backgroundColor);
      const grayBg: string = String(tabs[1].css.backgroundColor);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse featuredBg === grayBg=${featuredBg === grayBg}`);
      expect(featuredBg === grayBg).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual featuredBg=${featuredBg}, expected='#ffffff'`);
      expect(featuredBg).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual grayBg=${grayBg}, expected='#808080'`);
      expect(grayBg).assertEqual('#808080');
      log('testDslTabRow0318 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0319
     * @tc.name      testDslTabRow0319
     * @tc.desc      Verify all four tabs share the black font color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0319 begin');
      for (let i: number = 0; i < tabs.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(tabs[i].css.fontColor)}`);
        expect(String(tabs[i].css.fontColor)).assertEqual('#000000');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(tabs[0].css.fontColor)}, expected='#000000'`);
      expect(String(tabs[0].css.fontColor)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabs.length=${tabs.length}, expected=4`);
      expect(tabs.length).assertEqual(4);
      log('testDslTabRow0319 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLTAB_0320
     * @tc.name      testDslTabRow0320
     * @tc.desc      Verify the tab order is featured, series, movie, variety.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslTabRow0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslTabRow0320 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tabs[0].content)=${String(tabs[0].content)}`);
      expect(String(tabs[0].content)).assertEqual('精选');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tabs[1].content)=${String(tabs[1].content)}`);
      expect(String(tabs[1].content)).assertEqual('电视剧');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tabs[2].content)=${String(tabs[2].content)}`);
      expect(String(tabs[2].content)).assertEqual('电影');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(tabs[3].content)=${String(tabs[3].content)}`);
      expect(String(tabs[3].content)).assertEqual('综艺');
      log('testDslTabRow0320 end');
    })
  })
}
