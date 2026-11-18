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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormRequestState } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FormRequestState flow (42 cases). */
export default function formRequestStateFlow2Test(): void {
  describe('FormRequestStateFlow2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0043
     * @tc.name      RequestAddForm_FormRequestStateFlow_0043
     * @tc.desc      FormRequestState call flow succeed > fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0043 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('wM');
      logInfo(`step1 succeed("wM"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : wM');
      const step2: string = subject.fail('   ');
      logInfo(`step2 fail("   "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :    ');
      const step3: string = subject.succeed('wM');
      logInfo(`step3 succeed("wM"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : wM');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>fail>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>fail>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>fail>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : wM');
      logInfo(`succeed>fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0044
     * @tc.name      RequestAddForm_FormRequestStateFlow_0044
     * @tc.desc      FormRequestState call flow fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0044 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('');
      logInfo(`step1 fail(""): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : ');
      const step2: string = subject.fail('xHello');
      logInfo(`step2 fail("xHello"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : xHello');
      logInfo(`fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xHello');
      logInfo(`fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0045
     * @tc.name      RequestAddForm_FormRequestStateFlow_0045
     * @tc.desc      FormRequestState call flow request > succeed > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0045 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('y');
      logInfo(`step2 succeed("y"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : y');
      const step3: string = subject.succeed('wI');
      logInfo(`step3 succeed("wI"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : wI');
      const step4: string = subject.succeed('6kl8y66k1rb');
      logInfo(`step4 succeed("6kl8y66k1rb"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : 6kl8y66k1rb');
      logInfo(`request>succeed>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 6kl8y66k1rb');
      logInfo(`request>succeed>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0046
     * @tc.name      RequestAddForm_FormRequestStateFlow_0046
     * @tc.desc      FormRequestState call flow succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0046 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('DtSFoqMuV');
      logInfo(`step1 succeed("DtSFoqMuV"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : DtSFoqMuV');
      const step2: string = subject.fail('wATCoH');
      logInfo(`step2 fail("wATCoH"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : wATCoH');
      logInfo(`succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : wATCoH');
      logInfo(`succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0047
     * @tc.name      RequestAddForm_FormRequestStateFlow_0047
     * @tc.desc      FormRequestState call flow fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0047 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('v8KM5');
      logInfo(`step1 fail("v8KM5"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : v8KM5');
      const step2: string = subject.succeed('y');
      logInfo(`step2 succeed("y"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : y');
      const step3: string = subject.fail('HelloHello');
      logInfo(`step3 fail("HelloHello"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0048
     * @tc.name      RequestAddForm_FormRequestStateFlow_0048
     * @tc.desc      FormRequestState call flow request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0048 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('HelloHello');
      logInfo(`step2 fail("HelloHello"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0049
     * @tc.name      RequestAddForm_FormRequestStateFlow_0049
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0049 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('GdvcMW');
      logInfo(`step1 fail("GdvcMW"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : GdvcMW');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : GdvcMW');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0050
     * @tc.name      RequestAddForm_FormRequestStateFlow_0050
     * @tc.desc      FormRequestState call flow fail > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0050 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`step1 fail(" ?? "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`fail>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0051
     * @tc.name      RequestAddForm_FormRequestStateFlow_0051
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0051 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('5VVgVT');
      logInfo(`step1 succeed("5VVgVT"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 5VVgVT');
      const step2: string = subject.succeed('8o4Hy99Yie');
      logInfo(`step2 succeed("8o4Hy99Yie"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0052
     * @tc.name      RequestAddForm_FormRequestStateFlow_0052
     * @tc.desc      FormRequestState call flow request > fail > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0052 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('abcabc');
      logInfo(`step2 fail("abcabc"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : abcabc');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail(' Sample Title 123 ');
      logInfo(`step4 fail(" Sample Title 123 "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed :  Sample Title 123 ');
      logInfo(`request>fail>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  Sample Title 123 ');
      logInfo(`request>fail>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0053
     * @tc.name      RequestAddForm_FormRequestStateFlow_0053
     * @tc.desc      FormRequestState call flow request > fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0053 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('Sample Title 123Sample Title 123');
      logInfo(`step2 fail("Sample Title 123Sample Title ...: step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Sample Title 123Sample Title 123');
      const step3: string = subject.succeed('rq3');
      logInfo(`step3 succeed("rq3"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : rq3');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request>fail>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : rq3');
      logInfo(`request>fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0054
     * @tc.name      RequestAddForm_FormRequestStateFlow_0054
     * @tc.desc      FormRequestState call flow succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0054 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('kVYu9');
      logInfo(`step1 succeed("kVYu9"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : kVYu9');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : kVYu9');
      logInfo(`succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0055
     * @tc.name      RequestAddForm_FormRequestStateFlow_0055
     * @tc.desc      FormRequestState call flow succeed > fail > succeed > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0055 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('12om5Kfkxn');
      logInfo(`step1 succeed("12om5Kfkxn"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 12om5Kfkxn');
      const step2: string = subject.fail('pUpeNHII1');
      logInfo(`step2 fail("pUpeNHII1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : pUpeNHII1');
      const step3: string = subject.succeed('f');
      logInfo(`step3 succeed("f"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : f');
      const step4: string = subject.fail('\u4e2d\u6587_1');
      logInfo(`step4 fail("??_1"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>fail>succeed>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>fail>succeed>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>fail>succeed>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      logInfo(`succeed>fail>succeed>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>succeed>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0056
     * @tc.name      RequestAddForm_FormRequestStateFlow_0056
     * @tc.desc      FormRequestState call flow fail > request > succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0056 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('jcLFGS');
      logInfo(`step1 fail("jcLFGS"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : jcLFGS');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('MQm');
      logInfo(`step3 succeed("MQm"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : MQm');
      const step4: string = subject.fail('0Re');
      logInfo(`step4 fail("0Re"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : 0Re');
      const step5: string = subject.succeed('MKUexK7W5');
      logInfo(`step5 succeed("MKUexK7W5"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : MKUexK7W5');
      logInfo(`fail>request>succeed>fail>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>succeed>fail>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MKUexK7W5');
      logInfo(`fail>request>succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>request>succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0057
     * @tc.name      RequestAddForm_FormRequestStateFlow_0057
     * @tc.desc      FormRequestState call flow request > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0057 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('Ce3pzpg');
      logInfo(`step2 succeed("Ce3pzpg"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : Ce3pzpg');
      const step3: string = subject.fail('9U3Z');
      logInfo(`step3 fail("9U3Z"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 9U3Z');
      logInfo(`request>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 9U3Z');
      logInfo(`request>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0058
     * @tc.name      RequestAddForm_FormRequestStateFlow_0058
     * @tc.desc      FormRequestState call flow request > request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0058 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('oUTpjMECU8Z');
      logInfo(`step3 succeed("oUTpjMECU8Z"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      const step4: string = subject.succeed('Cb6QsK');
      logInfo(`step4 succeed("Cb6QsK"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : Cb6QsK');
      logInfo(`request>request>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Cb6QsK');
      logInfo(`request>request>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0059
     * @tc.name      RequestAddForm_FormRequestStateFlow_0059
     * @tc.desc      FormRequestState call flow request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0059 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('c');
      logInfo(`step2 succeed("c"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : c');
      logInfo(`request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : c');
      logInfo(`request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0060
     * @tc.name      RequestAddForm_FormRequestStateFlow_0060
     * @tc.desc      FormRequestState call flow request > fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0060 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail(' hello world ');
      logInfo(`step2 fail(" hello world "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  hello world ');
      const step3: string = subject.fail('5c3al4PNTk');
      logInfo(`step3 fail("5c3al4PNTk"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 5c3al4PNTk');
      const step4: string = subject.succeed('F5sj');
      logInfo(`step4 succeed("F5sj"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : F5sj');
      logInfo(`request>fail>fail>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>fail>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : F5sj');
      logInfo(`request>fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0061
     * @tc.name      RequestAddForm_FormRequestStateFlow_0061
     * @tc.desc      FormRequestState call flow succeed > succeed > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0061 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed(' ');
      logInfo(`step1 succeed(" "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success :  ');
      const step2: string = subject.succeed('Y8AN4');
      logInfo(`step2 succeed("Y8AN4"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : Y8AN4');
      const step3: string = subject.succeed('XG4zaQg86uk');
      logInfo(`step3 succeed("XG4zaQg86uk"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : XG4zaQg86uk');
      const step4: string = subject.succeed('ZUX');
      logInfo(`step4 succeed("ZUX"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ZUX');
      logInfo(`succeed>succeed>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ZUX');
      logInfo(`succeed>succeed>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(4);
      logInfo(`${BUNDLE}FormRequestStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0062
     * @tc.name      RequestAddForm_FormRequestStateFlow_0062
     * @tc.desc      FormRequestState call flow request > fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0062 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('hCCpq');
      logInfo(`step2 fail("hCCpq"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : hCCpq');
      const step3: string = subject.fail('k');
      logInfo(`step3 fail("k"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : k');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request>fail>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : k');
      logInfo(`request>fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0063
     * @tc.name      RequestAddForm_FormRequestStateFlow_0063
     * @tc.desc      FormRequestState call flow succeed > fail > succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0063 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Ec1OlBl');
      logInfo(`step1 succeed("Ec1OlBl"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Ec1OlBl');
      const step2: string = subject.fail('N');
      logInfo(`step2 fail("N"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : N');
      const step3: string = subject.succeed('8o4Hy99Yie');
      logInfo(`step3 succeed("8o4Hy99Yie"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      const step4: string = subject.fail('lryGn5oK85X');
      logInfo(`step4 fail("lryGn5oK85X"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : lryGn5oK85X');
      const step5: string = subject.succeed('ZKhoamZt3Itz');
      logInfo(`step5 succeed("ZKhoamZt3Itz"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : ZKhoamZt3Itz');
      logInfo(`succeed>fail>succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ZKhoamZt3Itz');
      logInfo(`succeed>fail>succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`succeed>fail>succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0064
     * @tc.name      RequestAddForm_FormRequestStateFlow_0064
     * @tc.desc      FormRequestState call flow request > request > request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0064 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.fail('LTJuRROZ5tI');
      logInfo(`step5 fail("LTJuRROZ5tI"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : LTJuRROZ5tI');
      logInfo(`request>request>request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(4);
      logInfo(`request>request>request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : LTJuRROZ5tI');
      logInfo(`request>request>request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0065
     * @tc.name      RequestAddForm_FormRequestStateFlow_0065
     * @tc.desc      FormRequestState call flow fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0065 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xSample Title 123');
      logInfo(`step1 fail("xSample Title 123"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xSample Title 123');
      const step2: string = subject.succeed('lEh');
      logInfo(`step2 succeed("lEh"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : lEh');
      const step3: string = subject.succeed('R');
      logInfo(`step3 succeed("R"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : R');
      logInfo(`fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : R');
      logInfo(`fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0066
     * @tc.name      RequestAddForm_FormRequestStateFlow_0066
     * @tc.desc      FormRequestState call flow request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0066 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('GTk4mr0');
      logInfo(`step3 fail("GTk4mr0"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : GTk4mr0');
      logInfo(`request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : GTk4mr0');
      logInfo(`request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0067
     * @tc.name      RequestAddForm_FormRequestStateFlow_0067
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0067 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xHello World');
      logInfo(`step1 fail("xHello World"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xHello World');
      const step2: string = subject.succeed('ZpIiJ5');
      logInfo(`step2 succeed("ZpIiJ5"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : ZpIiJ5');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ZpIiJ5');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0068
     * @tc.name      RequestAddForm_FormRequestStateFlow_0068
     * @tc.desc      FormRequestState call flow succeed > request > request > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0068 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('a_1');
      logInfo(`step1 succeed("a_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : a_1');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('ekp0NPrmkix');
      logInfo(`step4 succeed("ekp0NPrmkix"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>request>request>succeed>request f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`succeed>request>request>succeed>request f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>request>succeed>request f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      logInfo(`succeed>request>request>succeed>request f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0069
     * @tc.name      RequestAddForm_FormRequestStateFlow_0069
     * @tc.desc      FormRequestState call flow fail > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0069 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('BOYeDo3kYd');
      logInfo(`step1 fail("BOYeDo3kYd"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : BOYeDo3kYd');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('6lcdhjnkcDZ');
      logInfo(`step3 fail("6lcdhjnkcDZ"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`fail>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`fail>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0070
     * @tc.name      RequestAddForm_FormRequestStateFlow_0070
     * @tc.desc      FormRequestState call flow request > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0070 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('xSample Title 123');
      logInfo(`step2 fail("xSample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : xSample Title 123');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xSample Title 123');
      logInfo(`request>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0071
     * @tc.name      RequestAddForm_FormRequestStateFlow_0071
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0071 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('gLFA6kilKLS');
      logInfo(`step1 fail("gLFA6kilKLS"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : gLFA6kilKLS');
      const step2: string = subject.succeed('MU1zu63tq7');
      logInfo(`step2 succeed("MU1zu63tq7"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : MU1zu63tq7');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MU1zu63tq7');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0072
     * @tc.name      RequestAddForm_FormRequestStateFlow_0072
     * @tc.desc      FormRequestState call flow succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0072 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('OJ1');
      logInfo(`step1 succeed("OJ1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : OJ1');
      const step2: string = subject.fail('yElGZy217');
      logInfo(`step2 fail("yElGZy217"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : yElGZy217');
      const step3: string = subject.fail(' ');
      logInfo(`step3 fail(" "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  ');
      logInfo(`succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  ');
      logInfo(`succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0073
     * @tc.name      RequestAddForm_FormRequestStateFlow_0073
     * @tc.desc      FormRequestState call flow request > request > succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0073 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('b2pgrnrbRlCw');
      logInfo(`step3 succeed("b2pgrnrbRlCw"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : b2pgrnrbRlCw');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('Id4FjurEe1');
      logInfo(`step5 succeed("Id4FjurEe1"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : Id4FjurEe1');
      logInfo(`request>request>succeed>request>succeed f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>succeed>request>succeed f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>succeed>request>succeed f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Id4FjurEe1');
      logInfo(`request>request>succeed>request>succeed f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0074
     * @tc.name      RequestAddForm_FormRequestStateFlow_0074
     * @tc.desc      FormRequestState call flow fail > fail > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0074 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('Fn9ncPZjxyUs');
      logInfo(`step1 fail("Fn9ncPZjxyUs"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : Fn9ncPZjxyUs');
      const step2: string = subject.fail('ij');
      logInfo(`step2 fail("ij"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : ij');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('b2pgrnrbRlCw');
      logInfo(`step4 succeed("b2pgrnrbRlCw"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : b2pgrnrbRlCw');
      logInfo(`fail>fail>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>fail>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>fail>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : b2pgrnrbRlCw');
      logInfo(`fail>fail>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0075
     * @tc.name      RequestAddForm_FormRequestStateFlow_0075
     * @tc.desc      FormRequestState call flow succeed > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0075 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('8');
      logInfo(`step1 succeed("8"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 8');
      const step2: string = subject.succeed('IFn2LmlG');
      logInfo(`step2 succeed("IFn2LmlG"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : IFn2LmlG');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : IFn2LmlG');
      logInfo(`succeed>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0076
     * @tc.name      RequestAddForm_FormRequestStateFlow_0076
     * @tc.desc      FormRequestState call flow succeed > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0076 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('YLVStOQ87i');
      logInfo(`step1 succeed("YLVStOQ87i"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : YLVStOQ87i');
      const step2: string = subject.succeed('BYIy');
      logInfo(`step2 succeed("BYIy"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : BYIy');
      const step3: string = subject.fail('HhG');
      logInfo(`step3 fail("HhG"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`succeed>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`succeed>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0077
     * @tc.name      RequestAddForm_FormRequestStateFlow_0077
     * @tc.desc      FormRequestState call flow request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0077 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('Pf5Bcy0cd1MQ');
      logInfo(`step2 fail("Pf5Bcy0cd1MQ"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Pf5Bcy0cd1MQ');
      logInfo(`request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Pf5Bcy0cd1MQ');
      logInfo(`request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0078
     * @tc.name      RequestAddForm_FormRequestStateFlow_0078
     * @tc.desc      FormRequestState call flow request > succeed > request > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0078 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('abc');
      logInfo(`step2 succeed("abc"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : abc');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('ucASXurgn');
      logInfo(`step4 succeed("ucASXurgn"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ucASXurgn');
      const step5: string = subject.fail('BQxhNq');
      logInfo(`step5 fail("BQxhNq"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : BQxhNq');
      logInfo(`request>succeed>request>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>succeed>request>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>request>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : BQxhNq');
      logInfo(`request>succeed>request>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>succeed>request>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0079
     * @tc.name      RequestAddForm_FormRequestStateFlow_0079
     * @tc.desc      FormRequestState call flow succeed > fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0079 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('bm');
      logInfo(`step1 succeed("bm"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : bm');
      const step2: string = subject.fail('');
      logInfo(`step2 fail(""): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : ');
      const step3: string = subject.fail('HelloHello');
      logInfo(`step3 fail("HelloHello"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : HelloHello');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>fail>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>fail>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>fail>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`succeed>fail>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0080
     * @tc.name      RequestAddForm_FormRequestStateFlow_0080
     * @tc.desc      FormRequestState call flow fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0080 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail(' Hello World ');
      logInfo(`step1 fail(" Hello World "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed :  Hello World ');
      const step2: string = subject.fail('ZE7OH3t67pk');
      logInfo(`step2 fail("ZE7OH3t67pk"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : ZE7OH3t67pk');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ZE7OH3t67pk');
      logInfo(`fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0081
     * @tc.name      RequestAddForm_FormRequestStateFlow_0081
     * @tc.desc      FormRequestState call flow succeed > request > fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0081 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('xi4');
      logInfo(`step1 succeed("xi4"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : xi4');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('m9HcmF3a');
      logInfo(`step3 fail("m9HcmF3a"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : m9HcmF3a');
      const step4: string = subject.succeed('ekp0NPrmkix');
      logInfo(`step4 succeed("ekp0NPrmkix"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      const step5: string = subject.fail('8Hei');
      logInfo(`step5 fail("8Hei"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : 8Hei');
      logInfo(`succeed>request>fail>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 8Hei');
      logInfo(`succeed>request>fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>request>fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0082
     * @tc.name      RequestAddForm_FormRequestStateFlow_0082
     * @tc.desc      FormRequestState call flow request > succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0082 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('xabc');
      logInfo(`step2 succeed("xabc"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : xabc');
      const step3: string = subject.fail(' Hello ');
      logInfo(`step3 fail(" Hello "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  Hello ');
      const step4: string = subject.fail('ZfGq');
      logInfo(`step4 fail("ZfGq"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : ZfGq');
      logInfo(`request>succeed>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ZfGq');
      logInfo(`request>succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0083
     * @tc.name      RequestAddForm_FormRequestStateFlow_0083
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0083 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('uGr7a2su');
      logInfo(`step1 fail("uGr7a2su"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : uGr7a2su');
      const step2: string = subject.succeed('3NI');
      logInfo(`step2 succeed("3NI"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 3NI');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3NI');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0084
     * @tc.name      RequestAddForm_FormRequestStateFlow_0084
     * @tc.desc      FormRequestState call flow succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0084 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('5Pi');
      logInfo(`step1 succeed("5Pi"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 5Pi');
      const step2: string = subject.fail('bnS2SIBm1PUb');
      logInfo(`step2 fail("bnS2SIBm1PUb"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : bnS2SIBm1PUb');
      const step3: string = subject.succeed('csIBdZM8wgF');
      logInfo(`step3 succeed("csIBdZM8wgF"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : csIBdZM8wgF');
      logInfo(`succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : csIBdZM8wgF');
      logInfo(`succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0084 end`);
    });
  });
}
