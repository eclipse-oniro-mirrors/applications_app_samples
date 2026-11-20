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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { CommonEventConstants, EventSource, UiConstants } from '../../../main/ets/util/Constants';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the contract shared with the host application and the layout constants of this sample.
 */
export default function constantsCoreTest() {
  describe('ConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_CCER_CONST_0001
     * @tc.name      testEventName0001
     * @tc.desc      自定义公共事件名称与宿主约定一致
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEventName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEventName0001';
      logBegin(caseName);
      const eventName: string = CommonEventConstants.EVENT_NAME;
      logPair(caseName, 'EVENT_NAME', eventName, 'Acts_CommonEvent_Test');
      expect(eventName).assertEqual('Acts_CommonEvent_Test');
      expect(eventName.length > 0).assertTrue();
      expect(CommonEventConstants.EVENT_NAME.startsWith('Acts_')).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0002
     * @tc.name      testEventData0002
     * @tc.desc      InApp 与 OutApp 两个事件数据字面值固定且互不相同
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEventData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEventData0002';
      logBegin(caseName);
      const inApp: string = CommonEventConstants.DATA_IN_APP;
      const outApp: string = CommonEventConstants.DATA_OUT_APP;
      logPair(caseName, 'DATA_IN_APP', inApp, 'InApp');
      expect(inApp).assertEqual('InApp');
      logPair(caseName, 'DATA_OUT_APP', outApp, 'OutApp');
      expect(outApp).assertEqual('OutApp');
      logPair(caseName, 'distinct', inApp, outApp);
      expect(inApp === outApp).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0003
     * @tc.name      testBundleName0003
     * @tc.desc      本示例与宿主应用的包名固定且互不相同
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBundleName0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBundleName0003';
      logBegin(caseName);
      const bundleName: string = CommonEventConstants.BUNDLE_NAME;
      const hostBundleName: string = CommonEventConstants.HOST_BUNDLE_NAME;
      logPair(caseName, 'BUNDLE_NAME', bundleName, 'com.samples.customcommoneventrely');
      expect(bundleName).assertEqual('com.samples.customcommoneventrely');
      logPair(caseName, 'HOST_BUNDLE_NAME', hostBundleName, 'com.samples.customcommonevent');
      expect(hostBundleName).assertEqual('com.samples.customcommonevent');
      logPair(caseName, 'distinct', bundleName, hostBundleName);
      expect(bundleName === hostBundleName).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0004
     * @tc.name      testAbilityAndFormName0004
     * @tc.desc      Ability、卡片与模块名称与工程配置保持一致
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testAbilityAndFormName0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testAbilityAndFormName0004';
      logBegin(caseName);
      logPair(caseName, 'ABILITY_NAME', CommonEventConstants.ABILITY_NAME, 'EntryAbility');
      expect(CommonEventConstants.ABILITY_NAME).assertEqual('EntryAbility');
      logPair(caseName, 'FORM_ABILITY_NAME', CommonEventConstants.FORM_ABILITY_NAME, 'EntryFormAbility');
      expect(CommonEventConstants.FORM_ABILITY_NAME).assertEqual('EntryFormAbility');
      logPair(caseName, 'FORM_NAME', CommonEventConstants.FORM_NAME, 'publishCard');
      expect(CommonEventConstants.FORM_NAME).assertEqual('publishCard');
      logPair(caseName, 'MODULE_NAME', CommonEventConstants.MODULE_NAME, 'entry');
      expect(CommonEventConstants.MODULE_NAME).assertEqual('entry');
      logPair(caseName, 'abilityDiffersFromFormAbility',
        CommonEventConstants.ABILITY_NAME, CommonEventConstants.FORM_ABILITY_NAME);
      expect(CommonEventConstants.ABILITY_NAME === CommonEventConstants.FORM_ABILITY_NAME).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0005
     * @tc.name      testBindingDataKeys0005
     * @tc.desc      卡片绑定数据键与卡片消息键固定且互不相同
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBindingDataKeys0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBindingDataKeys0005';
      logBegin(caseName);
      const countKey: string = CommonEventConstants.FORM_COUNT_KEY;
      const messageKey: string = CommonEventConstants.FORM_MESSAGE_KEY;
      logPair(caseName, 'FORM_COUNT_KEY', countKey, 'publishCount');
      expect(countKey).assertEqual('publishCount');
      logPair(caseName, 'FORM_MESSAGE_KEY', messageKey, 'message');
      expect(messageKey).assertEqual('message');
      logPair(caseName, 'distinct', countKey, messageKey);
      expect(countKey === messageKey).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0006
     * @tc.name      testRecordLimit0006
     * @tc.desc      首页记录容量上限为 20 条
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testRecordLimit0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testRecordLimit0006';
      logBegin(caseName);
      const limit: number = CommonEventConstants.MAX_RECORD_COUNT;
      logPair(caseName, 'MAX_RECORD_COUNT', limit.toString(), '20');
      expect(limit).assertEqual(20);
      logPair(caseName, 'positive', (limit > 0).toString(), 'true');
      expect(limit > 0).assertTrue();
      expect(CommonEventConstants.MAX_RECORD_COUNT < CommonEventConstants.MAX_EVENT_DATA_LENGTH).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0007
     * @tc.name      testEventDataLengthLimit0007
     * @tc.desc      公共事件数据长度上限为 64 KB
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEventDataLengthLimit0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEventDataLengthLimit0007';
      logBegin(caseName);
      const limit: number = CommonEventConstants.MAX_EVENT_DATA_LENGTH;
      logPair(caseName, 'MAX_EVENT_DATA_LENGTH', limit.toString(), '65536');
      expect(limit).assertEqual(65536);
      logPair(caseName, 'equals64KB', (limit === 64 * 1024).toString(), 'true');
      expect(limit === 64 * 1024).assertTrue();
      logPair(caseName, 'limitInKiB', (limit / 1024).toString(), '64');
      expect(Number.isInteger(limit / 1024)).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0008
     * @tc.name      testEmptyValue0008
     * @tc.desc      空值常量是长度为 0 的字符串
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEmptyValue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEmptyValue0008';
      logBegin(caseName);
      const emptyValue: string = CommonEventConstants.EMPTY_VALUE;
      logPair(caseName, 'length', emptyValue.length.toString(), '0');
      expect(emptyValue.length).assertEqual(0);
      logPair(caseName, 'equalsEmptyLiteral', (emptyValue === '').toString(), 'true');
      expect(emptyValue === '').assertTrue();
      expect(CommonEventConstants.EMPTY_VALUE.length < CommonEventConstants.EVENT_NAME.length).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0009
     * @tc.name      testEventSourceCode0009
     * @tc.desc      事件来源码取值固定且互不相同
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEventSourceCode0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEventSourceCode0009';
      logBegin(caseName);
      logPair(caseName, 'UNKNOWN', EventSource.UNKNOWN.toString(), '0');
      expect(EventSource.UNKNOWN).assertEqual(0);
      logPair(caseName, 'FORM', EventSource.FORM.toString(), '1001');
      expect(EventSource.FORM).assertEqual(1001);
      logPair(caseName, 'PAGE', EventSource.PAGE.toString(), '1002');
      expect(EventSource.PAGE).assertEqual(1002);
      logPair(caseName, 'formDiffersFromPage', (EventSource.FORM !== EventSource.PAGE).toString(), 'true');
      expect(EventSource.FORM === EventSource.PAGE).assertFalse();
      logPair(caseName, 'unknownDiffersFromForm', (EventSource.UNKNOWN !== EventSource.FORM).toString(), 'true');
      expect(EventSource.UNKNOWN === EventSource.FORM).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0010
     * @tc.name      testResolveFormAndPageName0010
     * @tc.desc      卡片与页面来源码解析为约定的来源名称
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testResolveFormAndPageName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testResolveFormAndPageName0010';
      logBegin(caseName);
      const formName: string = EventSource.resolveName(EventSource.FORM);
      logPair(caseName, 'resolveName(FORM)', formName, 'form');
      expect(formName).assertEqual(EventSource.NAME_FORM);
      const pageName: string = EventSource.resolveName(EventSource.PAGE);
      logPair(caseName, 'resolveName(PAGE)', pageName, 'page');
      expect(pageName).assertEqual(EventSource.NAME_PAGE);
      logPair(caseName, 'distinct', formName, pageName);
      expect(formName === pageName).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0011
     * @tc.name      testResolveExternalName0011
     * @tc.desc      未知、越界与负数来源码均解析为外部来源名称
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testResolveExternalName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testResolveExternalName0011';
      logBegin(caseName);
      const codes: number[] = [EventSource.UNKNOWN, -1, 999, 1003, 99999];
      for (let index: number = 0; index < codes.length; index++) {
        const resolved: string = EventSource.resolveName(codes[index]);
        logPair(caseName, `resolveName(${codes[index]})`, resolved, EventSource.NAME_EXTERNAL);
        expect(resolved).assertEqual(EventSource.NAME_EXTERNAL);
      }
      expect(EventSource.resolveName(EventSource.FORM)).assertEqual(EventSource.NAME_FORM);
      expect(EventSource.resolveName(EventSource.PAGE)).assertEqual(EventSource.NAME_PAGE);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0012
     * @tc.name      testEventSourceNameLiteral0012
     * @tc.desc      来源名称常量字面值固定且互不相同
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEventSourceNameLiteral0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEventSourceNameLiteral0012';
      logBegin(caseName);
      logPair(caseName, 'NAME_FORM', EventSource.NAME_FORM, 'form');
      expect(EventSource.NAME_FORM).assertEqual('form');
      logPair(caseName, 'NAME_PAGE', EventSource.NAME_PAGE, 'page');
      expect(EventSource.NAME_PAGE).assertEqual('page');
      logPair(caseName, 'NAME_EXTERNAL', EventSource.NAME_EXTERNAL, 'external');
      expect(EventSource.NAME_EXTERNAL).assertEqual('external');
      logPair(caseName, 'formDiffersFromExternal', EventSource.NAME_FORM, EventSource.NAME_EXTERNAL);
      expect(EventSource.NAME_FORM === EventSource.NAME_EXTERNAL).assertFalse();
      logPair(caseName, 'pageDiffersFromExternal', EventSource.NAME_PAGE, EventSource.NAME_EXTERNAL);
      expect(EventSource.NAME_PAGE === EventSource.NAME_EXTERNAL).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0013
     * @tc.name      testLayoutSizeOrder0013
     * @tc.desc      布局尺寸为正数且标题字号大于正文字号大于说明字号
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testLayoutSizeOrder0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLayoutSizeOrder0013';
      logBegin(caseName);
      logPair(caseName, 'PAGE_PADDING', UiConstants.PAGE_PADDING.toString(), '>0');
      expect(UiConstants.PAGE_PADDING > 0).assertTrue();
      logPair(caseName, 'CARD_RADIUS', UiConstants.CARD_RADIUS.toString(), '>0');
      expect(UiConstants.CARD_RADIUS > 0).assertTrue();
      logPair(caseName, 'BUTTON_HEIGHT', UiConstants.BUTTON_HEIGHT.toString(), '>=40');
      expect(UiConstants.BUTTON_HEIGHT >= 40).assertTrue();
      logPair(caseName, 'LABEL_WIDTH', UiConstants.LABEL_WIDTH.toString(), '>0');
      expect(UiConstants.LABEL_WIDTH > 0).assertTrue();
      logPair(caseName, 'title>body', UiConstants.TITLE_FONT_SIZE.toString(), UiConstants.BODY_FONT_SIZE.toString());
      expect(UiConstants.TITLE_FONT_SIZE > UiConstants.BODY_FONT_SIZE).assertTrue();
      logPair(caseName, 'body>caption', UiConstants.BODY_FONT_SIZE.toString(),
        UiConstants.CAPTION_FONT_SIZE.toString());
      expect(UiConstants.BODY_FONT_SIZE > UiConstants.CAPTION_FONT_SIZE).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_CONST_0014
     * @tc.name      testLayoutPercentAndWidth0014
     * @tc.desc      全宽全高为百分比字符串且内容最大宽度适配手机与平板
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testLayoutPercentAndWidth0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLayoutPercentAndWidth0014';
      logBegin(caseName);
      logPair(caseName, 'FULL_WIDTH_PERCENT', UiConstants.FULL_WIDTH_PERCENT, '100%');
      expect(UiConstants.FULL_WIDTH_PERCENT).assertEqual('100%');
      logPair(caseName, 'FULL_HEIGHT_PERCENT', UiConstants.FULL_HEIGHT_PERCENT, '100%');
      expect(UiConstants.FULL_HEIGHT_PERCENT).assertEqual('100%');
      logPair(caseName, 'CONTENT_MAX_WIDTH', UiConstants.CONTENT_MAX_WIDTH.toString(), '>=320');
      expect(UiConstants.CONTENT_MAX_WIDTH >= 320).assertTrue();
      logPair(caseName, 'SECTION_SPACING', UiConstants.SECTION_SPACING.toString(), '>0');
      expect(UiConstants.SECTION_SPACING > 0).assertTrue();
      logEnd(caseName);
    })
  })
}
