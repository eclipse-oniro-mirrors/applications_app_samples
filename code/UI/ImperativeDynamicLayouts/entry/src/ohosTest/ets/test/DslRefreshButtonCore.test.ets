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
const TAG: string = 'DslRefreshButtonCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;
const refresh: ESObject = topLevel[5];

export default function dslRefreshButtonCoreTest(): void {
  describe('DslRefreshButtonCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0601
     * @tc.name      testDslRefreshButton0601
     * @tc.desc      Verify the refresh node owns the refreshImage id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0601 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(refresh.id)=${String(refresh.id)}`);
      expect(String(refresh.id)).assertEqual('refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof refresh.id=${typeof refresh.id}, expected='string'`);
      expect(typeof refresh.id).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger String(refresh.id).length=${String(refresh.id).length}`);
      expect(String(refresh.id).length).assertLarger(0);
      log('testDslRefreshButton0601 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0602
     * @tc.name      testDslRefreshButton0602
     * @tc.desc      Verify the refresh node renders as Text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0602 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(refresh.type)=${String(refresh.type)}`);
      expect(String(refresh.type)).assertEqual('Text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof refresh.type=${typeof refresh.type}`);
      expect(typeof refresh.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(refresh.type) === 'Image'}`);
      expect(String(refresh.type) === 'Image').assertFalse();
      log('testDslRefreshButton0602 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0603
     * @tc.name      testDslRefreshButton0603
     * @tc.desc      Verify the refresh button label text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0603 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(refresh.content)=${String(refresh.content)}`);
      expect(String(refresh.content)).assertEqual('刷新');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof refresh.content=${typeof refresh.content}`);
      expect(typeof refresh.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${String(refresh.content).length}, expected=0`);
      expect(String(refresh.content).length).assertLarger(0);
      log('testDslRefreshButton0603 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0604
     * @tc.name      testDslRefreshButton0604
     * @tc.desc      Verify the refresh node carries a css object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0604 begin');
      const css: ESObject = refresh.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css !== undefined && css !== null}`);
      expect(css !== undefined && css !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css=${typeof css}, expected='object'`);
      expect(typeof css).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse Array.isArray(css)=${Array.isArray(css)}`);
      expect(Array.isArray(css)).assertFalse();
      log('testDslRefreshButton0604 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0605
     * @tc.name      testDslRefreshButton0605
     * @tc.desc      Verify the refresh button width of 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0605 begin');
      const css: ESObject = refresh.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.width)=${Number(css.width)}, expected=180`);
      expect(Number(css.width)).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.width=${typeof css.width}, expected='number'`);
      expect(typeof css.width).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.width)=${Number(css.width)}, expected=0`);
      expect(Number(css.width)).assertLarger(0);
      log('testDslRefreshButton0605 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0606
     * @tc.name      testDslRefreshButton0606
     * @tc.desc      Verify the refresh button height of 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0606 begin');
      const css: ESObject = refresh.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.height)=${Number(css.height)}, expected=40`);
      expect(Number(css.height)).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.height=${typeof css.height}, expected='number'`);
      expect(typeof css.height).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.height)=${Number(css.height)}, expected=0`);
      expect(Number(css.height)).assertLarger(0);
      log('testDslRefreshButton0606 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0607
     * @tc.name      testDslRefreshButton0607
     * @tc.desc      Verify the refresh button pill radius of 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0607 begin');
      const css: ESObject = refresh.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.borderRadius)=${Number(css.borderRadius)}`);
      expect(Number(css.borderRadius)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.borderRadius=${typeof css.borderRadius}`);
      expect(typeof css.borderRadius).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(css.borderRadius)=${Number(css.borderRadius)}`);
      expect(Number(css.borderRadius)).assertLarger(Number(css.height));
      log('testDslRefreshButton0607 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0608
     * @tc.name      testDslRefreshButton0608
     * @tc.desc      Verify the refresh button white font color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0608 begin');
      const css: ESObject = refresh.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.fontColor)=${String(css.fontColor)}`);
      expect(String(css.fontColor)).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.fontColor=${typeof css.fontColor}`);
      expect(typeof css.fontColor).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(css.fontColor) === '#000000'}`);
      expect(String(css.fontColor) === '#000000').assertFalse();
      log('testDslRefreshButton0608 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0609
     * @tc.name      testDslRefreshButton0609
     * @tc.desc      Verify the refresh button blue background color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0609 begin');
      const css: ESObject = refresh.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.backgroundColor)=${String(css.backgroundColor)}`);
      expect(String(css.backgroundColor)).assertEqual('#0000FF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css.backgroundColor=${typeof css.backgroundColor}`);
      expect(typeof css.backgroundColor).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(css.backgroundColor) === '#808080'}`);
      expect(String(css.backgroundColor) === '#808080').assertFalse();
      log('testDslRefreshButton0609 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0610
     * @tc.name      testDslRefreshButton0610
     * @tc.desc      Verify the refresh button is a leaf without children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0610 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${refresh.children === undefined}`);
      expect(refresh.children === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${Array.isArray(refresh.children)}`);
      expect(Array.isArray(refresh.children)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${refresh.css.fontSize === undefined}`);
      expect(refresh.css.fontSize === undefined).assertTrue();
      log('testDslRefreshButton0610 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0611
     * @tc.name      testDslRefreshButton0611
     * @tc.desc      Verify the refresh node is the last root child.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0611 begin');
      const count: number = topLevel.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=6`);
      expect(count).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${topLevel[count - 1] === refresh}`);
      expect(topLevel[count - 1] === refresh).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${String(topLevel[count - 1].id)}`);
      expect(String(topLevel[count - 1].id)).assertEqual('refreshImage');
      log('testDslRefreshButton0611 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLREFRESH_0612
     * @tc.name      testDslRefreshButton0612
     * @tc.desc      Verify the refresh pill is wider than channel tabs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRefreshButton0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRefreshButton0612 begin');
      const tabRow: ESObject = topLevel[2];
      const tab0: ESObject = (tabRow.children as Array<ESObject>)[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(refresh.css.width)=${Number(refresh.css.width)}`);
      expect(Number(refresh.css.width)).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(tab0.css.width)=${Number(tab0.css.width)}`);
      expect(Number(tab0.css.width)).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger Number(refresh.css.width)=${Number(refresh.css.width)}`);
      expect(Number(refresh.css.width)).assertLarger(Number(tab0.css.width));
      log('testDslRefreshButton0612 end');
    })
  })
}
