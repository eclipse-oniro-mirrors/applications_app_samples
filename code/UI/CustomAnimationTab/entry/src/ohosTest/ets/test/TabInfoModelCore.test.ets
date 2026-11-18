/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { TabInfo, TabBarItemInterface } from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabInfoModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

@Builder
function tabInfoTestContent($$: ESObject) {
  Column() {
    Text('tabInfoTestContent')
  }
}

@Builder
function tabInfoTestBar($$: TabBarItemInterface) {
  Column() {
    Text(String($$.index))
  }
}

const CONTENT_BUILDER: WrappedBuilder<[ESObject]> = wrapBuilder(tabInfoTestContent);
const ALT_CONTENT_BUILDER: WrappedBuilder<[ESObject]> = wrapBuilder(tabInfoTestBar);
const BAR_BUILDER: WrappedBuilder<[TabBarItemInterface]> = wrapBuilder(tabInfoTestBar);

export default function tabInfoModelCoreTest(): void {
  describe('TabInfoModelCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0101
     * @tc.name      testTabInfoModel0101
     * @tc.desc      Verify a two-arg TabInfo keeps the given title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0101 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected='全部'`);
      expect(tabInfo.title).assertEqual('全部');
      log('testTabInfoModel0101 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0102
     * @tc.name      testTabInfoModel0102
     * @tc.desc      Verify a Chinese title is preserved on construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0102 begin');
      const tabInfo: TabInfo = new TabInfo('标题1', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected='标题1'`);
      expect(tabInfo.title).assertEqual('标题1');
      log('testTabInfoModel0102 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0103
     * @tc.name      testTabInfoModel0103
     * @tc.desc      Verify an empty title is preserved on construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0103 begin');
      const tabInfo: TabInfo = new TabInfo('', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected=''`);
      expect(tabInfo.title).assertEqual('');
      log('testTabInfoModel0103 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0104
     * @tc.name      testTabInfoModel0104
     * @tc.desc      Verify a 128-character long title is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0104 begin');
      const longTitle: string = 'a'.repeat(128);
      const tabInfo: TabInfo = new TabInfo(longTitle, CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected=longTitle`);
      expect(tabInfo.title).assertEqual(longTitle);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title.length=${tabInfo.title.length}, expected=128`);
      expect(tabInfo.title.length).assertEqual(128);
      log('testTabInfoModel0104 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0105
     * @tc.name      testTabInfoModel0105
     * @tc.desc      Verify a title containing spaces is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0105 begin');
      const tabInfo: TabInfo = new TabInfo('custom animation tab', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}`);
      expect(tabInfo.title).assertEqual('custom animation tab');
      log('testTabInfoModel0105 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0106
     * @tc.name      testTabInfoModel0106
     * @tc.desc      Verify a numeric-string title is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0106 begin');
      const tabInfo: TabInfo = new TabInfo('12345', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected='12345'`);
      expect(tabInfo.title).assertEqual('12345');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof tabInfo.title=${typeof tabInfo.title}`);
      expect(typeof tabInfo.title).assertEqual('string');
      log('testTabInfoModel0106 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0107
     * @tc.name      testTabInfoModel0107
     * @tc.desc      Verify contentBuilder keeps the registered builder reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0107 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.contentBuilder=${tabInfo.contentBuilder}`);
      expect(tabInfo.contentBuilder).assertEqual(CONTENT_BUILDER);
      log('testTabInfoModel0107 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0108
     * @tc.name      testTabInfoModel0108
     * @tc.desc      Verify title field type remains string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0108 begin');
      const tabInfo: TabInfo = new TabInfo('标题2', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof tabInfo.title=${typeof tabInfo.title}`);
      expect(typeof tabInfo.title).assertEqual('string');
      log('testTabInfoModel0108 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0109
     * @tc.name      testTabInfoModel0109
     * @tc.desc      Verify barBuilder stays undefined when omitted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0109 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${tabInfo.barBuilder === undefined}`);
      expect(tabInfo.barBuilder === undefined).assertTrue();
      log('testTabInfoModel0109 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0110
     * @tc.name      testTabInfoModel0110
     * @tc.desc      Verify barBuilder keeps the registered builder reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0110 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, BAR_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.barBuilder=${tabInfo.barBuilder}`);
      expect(tabInfo.barBuilder).assertEqual(BAR_BUILDER);
      log('testTabInfoModel0110 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0111
     * @tc.name      testTabInfoModel0111
     * @tc.desc      Verify params stays undefined when omitted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0111 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue tabInfo.params === undefined=${tabInfo.params === undefined}`);
      expect(tabInfo.params === undefined).assertTrue();
      log('testTabInfoModel0111 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0112
     * @tc.name      testTabInfoModel0112
     * @tc.desc      Verify a number param is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0112 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, 42);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=42`);
      expect(params).assertEqual(42);
      log('testTabInfoModel0112 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0113
     * @tc.name      testTabInfoModel0113
     * @tc.desc      Verify a string param is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0113 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, 'param');
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected='param'`);
      expect(params).assertEqual('param');
      log('testTabInfoModel0113 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0114
     * @tc.name      testTabInfoModel0114
     * @tc.desc      Verify a Record param object reference is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0114 begin');
      const paramObj: Record<string, number> = { 'width': 90, 'height': 40 };
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, paramObj);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=paramObj`);
      expect(params).assertEqual(paramObj);
      log('testTabInfoModel0114 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0115
     * @tc.name      testTabInfoModel0115
     * @tc.desc      Verify a boolean param is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0115 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, true);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=true`);
      expect(params).assertEqual(true);
      log('testTabInfoModel0115 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0116
     * @tc.name      testTabInfoModel0116
     * @tc.desc      Verify an array param is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0116 begin');
      const paramArray: number[] = [1, 2, 3];
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, paramArray);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=paramArray`);
      expect(params).assertEqual(paramArray);
      log('testTabInfoModel0116 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0117
     * @tc.name      testTabInfoModel0117
     * @tc.desc      Verify all four fields survive a full-arg construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0117 begin');
      const tabInfo: TabInfo = new TabInfo('Native', CONTENT_BUILDER, BAR_BUILDER, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected='Native'`);
      expect(tabInfo.title).assertEqual('Native');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.contentBuilder=${tabInfo.contentBuilder}`);
      expect(tabInfo.contentBuilder).assertEqual(CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.barBuilder=${tabInfo.barBuilder}`);
      expect(tabInfo.barBuilder).assertEqual(BAR_BUILDER);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=7`);
      expect(params).assertEqual(7);
      log('testTabInfoModel0117 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0118
     * @tc.name      testTabInfoModel0118
     * @tc.desc      Verify two instances with the same title stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0118 begin');
      const first: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      const second: TabInfo = new TabInfo('全部', ALT_CONTENT_BUILDER);
      first.title = 'changed';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.title=${first.title}, expected='changed'`);
      expect(first.title).assertEqual('changed');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.title=${second.title}, expected='全部'`);
      expect(second.title).assertEqual('全部');
      log('testTabInfoModel0118 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0119
     * @tc.name      testTabInfoModel0119
     * @tc.desc      Verify title is mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0119 begin');
      const tabInfo: TabInfo = new TabInfo('标题1', CONTENT_BUILDER);
      tabInfo.title = '新标题';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected='新标题'`);
      expect(tabInfo.title).assertEqual('新标题');
      log('testTabInfoModel0119 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0120
     * @tc.name      testTabInfoModel0120
     * @tc.desc      Verify params is mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0120 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      tabInfo.params = 'updated';
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected='updated'`);
      expect(params).assertEqual('updated');
      log('testTabInfoModel0120 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0121
     * @tc.name      testTabInfoModel0121
     * @tc.desc      Verify contentBuilder field is an object reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0121 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof tabInfo.contentBuilder}, expected='object'`);
      expect(typeof tabInfo.contentBuilder).assertEqual('object');
      log('testTabInfoModel0121 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0122
     * @tc.name      testTabInfoModel0122
     * @tc.desc      Verify barBuilder can be assigned after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0122 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      tabInfo.barBuilder = BAR_BUILDER;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.barBuilder=${tabInfo.barBuilder}`);
      expect(tabInfo.barBuilder).assertEqual(BAR_BUILDER);
      log('testTabInfoModel0122 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0123
     * @tc.name      testTabInfoModel0123
     * @tc.desc      Verify a nested object param is preserved by reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0123 begin');
      const nested: Record<string, Record<string, number>> = { 'inner': { 'key': 1 } };
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, nested);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=nested`);
      expect(params).assertEqual(nested);
      log('testTabInfoModel0123 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0124
     * @tc.name      testTabInfoModel0124
     * @tc.desc      Verify two instances share the same builder when given it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0124 begin');
      const first: TabInfo = new TabInfo('标题1', CONTENT_BUILDER);
      const second: TabInfo = new TabInfo('标题2', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.contentBuilder=${first.contentBuilder}`);
      expect(first.contentBuilder).assertEqual(second.contentBuilder);
      log('testTabInfoModel0124 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0125
     * @tc.name      testTabInfoModel0125
     * @tc.desc      Verify different builders are not equal references.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0125 begin');
      const first: TabInfo = new TabInfo('标题1', CONTENT_BUILDER);
      const second: TabInfo = new TabInfo('标题2', ALT_CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${first.contentBuilder === second.contentBuilder}`);
      expect(first.contentBuilder === second.contentBuilder).assertFalse();
      log('testTabInfoModel0125 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0126
     * @tc.name      testTabInfoModel0126
     * @tc.desc      Verify special-character title is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0126 begin');
      const special: string = '!@#￥%……&*（';
      const tabInfo: TabInfo = new TabInfo(special, CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tabInfo.title=${tabInfo.title}, expected=special`);
      expect(tabInfo.title).assertEqual(special);
      log('testTabInfoModel0126 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0127
     * @tc.name      testTabInfoModel0127
     * @tc.desc      Verify TabInfo instances pass an instanceof check.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0127 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue tabInfo instanceof TabInfo=${tabInfo instanceof TabInfo}`);
      expect(tabInfo instanceof TabInfo).assertTrue();
      log('testTabInfoModel0127 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0128
     * @tc.name      testTabInfoModel0128
     * @tc.desc      Verify barBuilder mutation does not leak to other instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0128 begin');
      const first: TabInfo = new TabInfo('标题1', CONTENT_BUILDER);
      const second: TabInfo = new TabInfo('标题2', CONTENT_BUILDER);
      first.barBuilder = BAR_BUILDER;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.barBuilder=${first.barBuilder}, expected=BAR_BUILDER`);
      expect(first.barBuilder).assertEqual(BAR_BUILDER);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${second.barBuilder === undefined}`);
      expect(second.barBuilder === undefined).assertTrue();
      log('testTabInfoModel0128 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0129
     * @tc.name      testTabInfoModel0129
     * @tc.desc      Verify numeric-zero param is preserved as defined value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0129 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, 0);
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=0`);
      expect(params).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse tabInfo.params === undefined=${tabInfo.params === undefined}`);
      expect(tabInfo.params === undefined).assertFalse();
      log('testTabInfoModel0129 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABINFOMODEL_0130
     * @tc.name      testTabInfoModel0130
     * @tc.desc      Verify empty-string param is preserved as defined value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabInfoModel0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabInfoModel0130 begin');
      const tabInfo: TabInfo = new TabInfo('全部', CONTENT_BUILDER, undefined, '');
      const params: ESObject = tabInfo.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=''`);
      expect(params).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse tabInfo.params === undefined=${tabInfo.params === undefined}`);
      expect(tabInfo.params === undefined).assertFalse();
      log('testTabInfoModel0130 end');
    })
  })
}
