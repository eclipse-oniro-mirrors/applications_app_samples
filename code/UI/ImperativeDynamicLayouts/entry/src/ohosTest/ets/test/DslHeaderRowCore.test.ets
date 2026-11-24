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
const TAG: string = 'DslHeaderRowCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;
const header: ESObject = topLevel[0];
const headerKids: Array<ESObject> = header.children as Array<ESObject>;

export default function dslHeaderRowCoreTest(): void {
  describe('DslHeaderRowCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0101
     * @tc.name      testDslHeaderRow0101
     * @tc.desc      Verify the header section is a Row with a css object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0101 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(header.type)=${String(header.type)}, expected='Row'`);
      expect(String(header.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof header.css=${typeof header.css}, expected='object'`);
      expect(typeof header.css).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue header.css !== undefined=${header.css !== undefined}`);
      expect(header.css !== undefined).assertTrue();
      log('testDslHeaderRow0101 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0102
     * @tc.name      testDslHeaderRow0102
     * @tc.desc      Verify the header row spans the full width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0102 begin');
      const css: ESObject = header.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.width=${typeof css.width}, expected='string'`);
      expect(typeof css.width).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(css.width) === '50%'=${String(css.width) === '50%'}`);
      expect(String(css.width) === '50%').assertFalse();
      log('testDslHeaderRow0102 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0103
     * @tc.name      testDslHeaderRow0103
     * @tc.desc      Verify the header row sets a numeric left padding of 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0103 begin');
      const padding: ESObject = header.css.padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${padding !== undefined && padding !== null}`);
      expect(padding !== undefined && padding !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}, expected=15`);
      expect(Number(padding.left)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof padding.left=${typeof padding.left}`);
      expect(typeof padding.left).assertEqual('number');
      log('testDslHeaderRow0103 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0104
     * @tc.name      testDslHeaderRow0104
     * @tc.desc      Verify the header row paddings are symmetric at 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0104 begin');
      const padding: ESObject = header.css.padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.right)=${Number(padding.right)}, expected=15`);
      expect(Number(padding.right)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(padding.left)=${Number(padding.left)}`);
      expect(Number(padding.left)).assertEqual(Number(padding.right));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(padding.left)=${Number(padding.left)}, expected=0`);
      expect(Number(padding.left)).assertLarger(0);
      log('testDslHeaderRow0104 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0105
     * @tc.name      testDslHeaderRow0105
     * @tc.desc      Verify the header row sets a numeric top margin of 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0105 begin');
      const margin: ESObject = header.css.margin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${margin !== undefined && margin !== null}`);
      expect(margin !== undefined && margin !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}, expected=5`);
      expect(Number(margin.top)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof margin.top=${typeof margin.top}, expected='number'`);
      expect(typeof margin.top).assertEqual('number');
      log('testDslHeaderRow0105 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0106
     * @tc.name      testDslHeaderRow0106
     * @tc.desc      Verify the header row margins are symmetric at 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0106 begin');
      const margin: ESObject = header.css.margin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.bottom)=${Number(margin.bottom)}, expected=5`);
      expect(Number(margin.bottom)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(margin.top)=${Number(margin.top)}`);
      expect(Number(margin.top)).assertEqual(Number(margin.bottom));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(margin.top)=${Number(margin.top)}, expected=0`);
      expect(Number(margin.top)).assertLarger(0);
      log('testDslHeaderRow0106 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0107
     * @tc.name      testDslHeaderRow0107
     * @tc.desc      Verify the header row declares space between alignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0107 begin');
      const css: ESObject = header.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.justifyContent)=${String(css.justifyContent)}`);
      expect(String(css.justifyContent)).assertEqual('FlexAlign.SpaceBetween');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.justifyContent=${typeof css.justifyContent}`);
      expect(typeof css.justifyContent).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(css.justifyContent)=${String(css.justifyContent)}`);
      expect(String(css.justifyContent)).assertContain('SpaceBetween');
      log('testDslHeaderRow0107 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0108
     * @tc.name      testDslHeaderRow0108
     * @tc.desc      Verify the header row holds exactly two children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0108 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(header.children)}`);
      expect(Array.isArray(header.children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual headerKids.length=${headerKids.length}, expected=2`);
      expect(headerKids.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${headerKids[0] !== headerKids[1]}`);
      expect(headerKids[0] !== headerKids[1]).assertTrue();
      log('testDslHeaderRow0108 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0109
     * @tc.name      testDslHeaderRow0109
     * @tc.desc      Verify the first header child is the home page title Text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0109 begin');
      const title: ESObject = headerKids[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(title.type)=${String(title.type)}, expected='Text'`);
      expect(String(title.type)).assertEqual('Text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(title.content)=${String(title.content)}`);
      expect(String(title.content)).assertEqual('首页');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof title.content=${typeof title.content}`);
      expect(typeof title.content).assertEqual('string');
      log('testDslHeaderRow0109 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0110
     * @tc.name      testDslHeaderRow0110
     * @tc.desc      Verify the home title uses fontSize 24 and white color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0110 begin');
      const css: ESObject = headerKids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.fontSize)=${Number(css.fontSize)}, expected=24`);
      expect(Number(css.fontSize)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.fontSize=${typeof css.fontSize}`);
      expect(typeof css.fontSize).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.fontColor)=${String(css.fontColor)}`);
      expect(String(css.fontColor)).assertEqual('#ffffff');
      log('testDslHeaderRow0110 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0111
     * @tc.name      testDslHeaderRow0111
     * @tc.desc      Verify the home title defines no fixed width or height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0111 begin');
      const css: ESObject = headerKids[0].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.width === undefined=${css.width === undefined}`);
      expect(css.width === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.height === undefined=${css.height === undefined}`);
      expect(css.height === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.backgroundColor === undefined}`);
      expect(css.backgroundColor === undefined).assertTrue();
      log('testDslHeaderRow0111 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0112
     * @tc.name      testDslHeaderRow0112
     * @tc.desc      Verify the second header child is the search Image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0112 begin');
      const search: ESObject = headerKids[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(search.type)=${String(search.type)}, expected='Image'`);
      expect(String(search.type)).assertEqual('Image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(search.content)=${String(search.content)}`);
      expect(String(search.content)).assertEqual('app.media.search');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain String(search.content)=${String(search.content)}`);
      expect(String(search.content)).assertContain('app.media.');
      log('testDslHeaderRow0112 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0113
     * @tc.name      testDslHeaderRow0113
     * @tc.desc      Verify the search icon is a 24x24 square.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0113 begin');
      const css: ESObject = headerKids[1].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.width)=${Number(css.width)}, expected=24`);
      expect(Number(css.width)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.height)=${Number(css.height)}, expected=24`);
      expect(Number(css.height)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.width)=${Number(css.width)}`);
      expect(Number(css.width)).assertEqual(Number(css.height));
      log('testDslHeaderRow0113 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLHEADER_0114
     * @tc.name      testDslHeaderRow0114
     * @tc.desc      Verify the search icon defines no radius or background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslHeaderRow0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslHeaderRow0114 begin');
      const css: ESObject = headerKids[1].css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.borderRadius === undefined}`);
      expect(css.borderRadius === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css.backgroundColor === undefined}`);
      expect(css.backgroundColor === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue css.opacity === undefined=${css.opacity === undefined}`);
      expect(css.opacity === undefined).assertTrue();
      log('testDslHeaderRow0114 end');
    })
  })
}
