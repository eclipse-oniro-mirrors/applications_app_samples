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

/** Logic checks for FormRequestState flow (40 cases). */
export default function formRequestStateFlow4Test(): void {
  describe('FormRequestStateFlow4Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0127
     * @tc.name      RequestAddForm_FormRequestStateFlow_0127
     * @tc.desc      FormRequestState call flow succeed > request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0127 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('UJGxw2FFw');
      logInfo(`step1 succeed("UJGxw2FFw"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : UJGxw2FFw');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('Hello_1');
      logInfo(`step3 fail("Hello_1"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Hello_1');
      const step4: string = subject.fail('123');
      logInfo(`step4 fail("123"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : 123');
      logInfo(`succeed>request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 123');
      logInfo(`succeed>request>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0128
     * @tc.name      RequestAddForm_FormRequestStateFlow_0128
     * @tc.desc      FormRequestState call flow succeed > succeed > succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0128 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('hht5M');
      logInfo(`step1 succeed("hht5M"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : hht5M');
      const step2: string = subject.succeed('X');
      logInfo(`step2 succeed("X"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : X');
      const step3: string = subject.succeed('MQm');
      logInfo(`step3 succeed("MQm"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : MQm');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>succeed>request>request f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>succeed>succeed>request>request f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>succeed>request>request f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MQm');
      logInfo(`succeed>succeed>succeed>request>request f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0129
     * @tc.name      RequestAddForm_FormRequestStateFlow_0129
     * @tc.desc      FormRequestState call flow request > fail > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0129 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('4');
      logInfo(`step2 fail("4"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 4');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('\u4e2d\u6587_1');
      logInfo(`step4 fail("??_1"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      logInfo(`request>fail>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      logInfo(`request>fail>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0130
     * @tc.name      RequestAddForm_FormRequestStateFlow_0130
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0130 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Ce3pzpg');
      logInfo(`step1 succeed("Ce3pzpg"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Ce3pzpg');
      const step2: string = subject.succeed('S');
      logInfo(`step2 succeed("S"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : S');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : S');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0131
     * @tc.name      RequestAddForm_FormRequestStateFlow_0131
     * @tc.desc      FormRequestState call flow fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0131 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xTSuiz9l');
      logInfo(`step1 fail("xTSuiz9l"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xTSuiz9l');
      const step2: string = subject.succeed('HnHlcedci');
      logInfo(`step2 succeed("HnHlcedci"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : HnHlcedci');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : HnHlcedci');
      logInfo(`fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0132
     * @tc.name      RequestAddForm_FormRequestStateFlow_0132
     * @tc.desc      FormRequestState call flow succeed > succeed > request > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0132 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('XG4zaQg86uk');
      logInfo(`step1 succeed("XG4zaQg86uk"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : XG4zaQg86uk');
      const step2: string = subject.succeed('tYzRY3u3xO0');
      logInfo(`step2 succeed("tYzRY3u3xO0"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : tYzRY3u3xO0');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('NtEWY8iB');
      logInfo(`step4 fail("NtEWY8iB"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : NtEWY8iB');
      const step5: string = subject.succeed('eCt9f');
      logInfo(`step5 succeed("eCt9f"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : eCt9f');
      logInfo(`succeed>succeed>request>fail>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>request>fail>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>request>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : eCt9f');
      logInfo(`succeed>succeed>request>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`succeed>succeed>request>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0133
     * @tc.name      RequestAddForm_FormRequestStateFlow_0133
     * @tc.desc      FormRequestState call flow succeed > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0133 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('K80cZObUF');
      logInfo(`step1 succeed("K80cZObUF"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : K80cZObUF');
      const step2: string = subject.fail('x ');
      logInfo(`step2 fail("x "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : x ');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : x ');
      logInfo(`succeed>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0134
     * @tc.name      RequestAddForm_FormRequestStateFlow_0134
     * @tc.desc      FormRequestState call flow succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0134 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed(' _1');
      logInfo(`step1 succeed(" _1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success :  _1');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  _1');
      logInfo(`succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0135
     * @tc.name      RequestAddForm_FormRequestStateFlow_0135
     * @tc.desc      FormRequestState call flow fail > request > request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0135 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('123_1');
      logInfo(`step1 fail("123_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 123_1');
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
      const step4: string = subject.succeed('wM');
      logInfo(`step4 succeed("wM"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : wM');
      const step5: string = subject.succeed(' ');
      logInfo(`step5 succeed(" "): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success :  ');
      logInfo(`fail>request>request>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>request>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>request>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  ');
      logInfo(`fail>request>request>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>request>request>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0136
     * @tc.name      RequestAddForm_FormRequestStateFlow_0136
     * @tc.desc      FormRequestState call flow request > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0136 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('h4vpu9II');
      logInfo(`step2 fail("h4vpu9II"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : h4vpu9II');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : h4vpu9II');
      logInfo(`request>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0137
     * @tc.name      RequestAddForm_FormRequestStateFlow_0137
     * @tc.desc      FormRequestState call flow request > request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0137 begin`);
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
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail(' _1');
      logInfo(`step4 fail(" _1"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed :  _1');
      logInfo(`request>request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  _1');
      logInfo(`request>request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0138
     * @tc.name      RequestAddForm_FormRequestStateFlow_0138
     * @tc.desc      FormRequestState call flow request > request > request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0138 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
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
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.fail('h4vpu9II');
      logInfo(`step5 fail("h4vpu9II"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : h4vpu9II');
      logInfo(`request>request>request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(4);
      logInfo(`request>request>request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : h4vpu9II');
      logInfo(`request>request>request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0139
     * @tc.name      RequestAddForm_FormRequestStateFlow_0139
     * @tc.desc      FormRequestState call flow fail > request > succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0139 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('93pFbAIaso06');
      logInfo(`step1 fail("93pFbAIaso06"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 93pFbAIaso06');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('Lp0flCj');
      logInfo(`step3 succeed("Lp0flCj"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : Lp0flCj');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('XZptyQzyBNV3');
      logInfo(`step5 succeed("XZptyQzyBNV3"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : XZptyQzyBNV3');
      logInfo(`fail>request>succeed>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>succeed>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>succeed>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : XZptyQzyBNV3');
      logInfo(`fail>request>succeed>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>request>succeed>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0140
     * @tc.name      RequestAddForm_FormRequestStateFlow_0140
     * @tc.desc      FormRequestState call flow succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0140 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('XZptyQzyBNV3');
      logInfo(`step1 succeed("XZptyQzyBNV3"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : XZptyQzyBNV3');
      const step2: string = subject.fail('l6');
      logInfo(`step2 fail("l6"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : l6');
      const step3: string = subject.succeed('a');
      logInfo(`step3 succeed("a"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : a');
      logInfo(`succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : a');
      logInfo(`succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0141
     * @tc.name      RequestAddForm_FormRequestStateFlow_0141
     * @tc.desc      FormRequestState call flow succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0141 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Ec1OlBl');
      logInfo(`step1 succeed("Ec1OlBl"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Ec1OlBl');
      const step2: string = subject.fail('zNyj70GL');
      logInfo(`step2 fail("zNyj70GL"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : zNyj70GL');
      logInfo(`succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : zNyj70GL');
      logInfo(`succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0142
     * @tc.name      RequestAddForm_FormRequestStateFlow_0142
     * @tc.desc      FormRequestState call flow request > fail > fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0142 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('mhPL');
      logInfo(`step2 fail("mhPL"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : mhPL');
      const step3: string = subject.fail('xHello');
      logInfo(`step3 fail("xHello"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xHello');
      const step4: string = subject.succeed('');
      logInfo(`step4 succeed(""): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ');
      const step5: string = subject.fail('62jwo8fhw');
      logInfo(`step5 fail("62jwo8fhw"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : 62jwo8fhw');
      logInfo(`request>fail>fail>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>fail>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 62jwo8fhw');
      logInfo(`request>fail>fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>fail>fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0143
     * @tc.name      RequestAddForm_FormRequestStateFlow_0143
     * @tc.desc      FormRequestState call flow request > fail > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0143 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('IS');
      logInfo(`step2 fail("IS"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : IS');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('2');
      logInfo(`step4 succeed("2"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : 2');
      logInfo(`request>fail>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 2');
      logInfo(`request>fail>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>fail>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0144
     * @tc.name      RequestAddForm_FormRequestStateFlow_0144
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0144 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('8X0b0DnCfbSl');
      logInfo(`step1 fail("8X0b0DnCfbSl"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 8X0b0DnCfbSl');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 8X0b0DnCfbSl');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0145
     * @tc.name      RequestAddForm_FormRequestStateFlow_0145
     * @tc.desc      FormRequestState call flow request > request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0145 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
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
      const step4: string = subject.fail('kCl5jCtN');
      logInfo(`step4 fail("kCl5jCtN"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : kCl5jCtN');
      logInfo(`request>request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : kCl5jCtN');
      logInfo(`request>request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0146
     * @tc.name      RequestAddForm_FormRequestStateFlow_0146
     * @tc.desc      FormRequestState call flow succeed > fail > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0146 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('xi4');
      logInfo(`step1 succeed("xi4"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : xi4');
      const step2: string = subject.fail('GdvcMW');
      logInfo(`step2 fail("GdvcMW"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : GdvcMW');
      const step3: string = subject.fail('SeD6');
      logInfo(`step3 fail("SeD6"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : SeD6');
      const step4: string = subject.fail('g3hwOV');
      logInfo(`step4 fail("g3hwOV"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : g3hwOV');
      logInfo(`succeed>fail>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : g3hwOV');
      logInfo(`succeed>fail>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0147
     * @tc.name      RequestAddForm_FormRequestStateFlow_0147
     * @tc.desc      FormRequestState call flow succeed > fail > succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0147 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Hh');
      logInfo(`step1 succeed("Hh"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Hh');
      const step2: string = subject.fail('N');
      logInfo(`step2 fail("N"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : N');
      const step3: string = subject.succeed('Ec1OlBl');
      logInfo(`step3 succeed("Ec1OlBl"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : Ec1OlBl');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.fail('HhG');
      logInfo(`step5 fail("HhG"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`succeed>fail>succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>fail>succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>fail>succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`succeed>fail>succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0148
     * @tc.name      RequestAddForm_FormRequestStateFlow_0148
     * @tc.desc      FormRequestState call flow succeed > succeed > fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0148 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('i2qDo6fDXj');
      logInfo(`step1 succeed("i2qDo6fDXj"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : i2qDo6fDXj');
      const step2: string = subject.succeed('Hs64');
      logInfo(`step2 succeed("Hs64"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : Hs64');
      const step3: string = subject.fail(' ');
      logInfo(`step3 fail(" "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  ');
      const step4: string = subject.fail('iJx');
      logInfo(`step4 fail("iJx"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : iJx');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>fail>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>fail>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>fail>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : iJx');
      logInfo(`succeed>succeed>fail>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0149
     * @tc.name      RequestAddForm_FormRequestStateFlow_0149
     * @tc.desc      FormRequestState call flow succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0149 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('csIBdZM8wgF');
      logInfo(`step1 succeed("csIBdZM8wgF"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : csIBdZM8wgF');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('kyyM8');
      logInfo(`step3 fail("kyyM8"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : kyyM8');
      logInfo(`succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : kyyM8');
      logInfo(`succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0150
     * @tc.name      RequestAddForm_FormRequestStateFlow_0150
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0150 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xA');
      logInfo(`step1 fail("xA"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xA');
      const step2: string = subject.succeed('OluWJ7PNpjU');
      logInfo(`step2 succeed("OluWJ7PNpjU"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : OluWJ7PNpjU');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : OluWJ7PNpjU');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0151
     * @tc.name      RequestAddForm_FormRequestStateFlow_0151
     * @tc.desc      FormRequestState call flow request > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0151 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('fVP9EV3');
      logInfo(`step2 fail("fVP9EV3"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : fVP9EV3');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : fVP9EV3');
      logInfo(`request>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0152
     * @tc.name      RequestAddForm_FormRequestStateFlow_0152
     * @tc.desc      FormRequestState call flow request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0152 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('oUTpjMECU8Z');
      logInfo(`step2 succeed("oUTpjMECU8Z"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      logInfo(`request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      logInfo(`request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0153
     * @tc.name      RequestAddForm_FormRequestStateFlow_0153
     * @tc.desc      FormRequestState call flow succeed > request > fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0153 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('dnnltodAK');
      logInfo(`step1 succeed("dnnltodAK"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : dnnltodAK');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('HelloHello');
      logInfo(`step3 fail("HelloHello"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : HelloHello');
      const step4: string = subject.succeed('UJGxw2FFw');
      logInfo(`step4 succeed("UJGxw2FFw"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : UJGxw2FFw');
      const step5: string = subject.fail('FnEe5CTm');
      logInfo(`step5 fail("FnEe5CTm"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : FnEe5CTm');
      logInfo(`succeed>request>fail>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : FnEe5CTm');
      logInfo(`succeed>request>fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>request>fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0154
     * @tc.name      RequestAddForm_FormRequestStateFlow_0154
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0154 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('KjRvj7zZP');
      logInfo(`step1 fail("KjRvj7zZP"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : KjRvj7zZP');
      const step2: string = subject.succeed('MgvrY1');
      logInfo(`step2 succeed("MgvrY1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : MgvrY1');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MgvrY1');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0155
     * @tc.name      RequestAddForm_FormRequestStateFlow_0155
     * @tc.desc      FormRequestState call flow request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0155 begin`);
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
      logInfo(`request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`${BUNDLE}FormRequestStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0156
     * @tc.name      RequestAddForm_FormRequestStateFlow_0156
     * @tc.desc      FormRequestState call flow fail > succeed > request > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0156 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('jLhLPiS6nU');
      logInfo(`step1 fail("jLhLPiS6nU"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : jLhLPiS6nU');
      const step2: string = subject.succeed(' a ');
      logInfo(`step2 succeed(" a "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success :  a ');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('xi4');
      logInfo(`step5 succeed("xi4"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : xi4');
      logInfo(`fail>succeed>request>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>succeed>request>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>succeed>request>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xi4');
      logInfo(`fail>succeed>request>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>request>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0157
     * @tc.name      RequestAddForm_FormRequestStateFlow_0157
     * @tc.desc      FormRequestState call flow succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0157 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('lmdG2u5cjoTs');
      logInfo(`step1 succeed("lmdG2u5cjoTs"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0158
     * @tc.name      RequestAddForm_FormRequestStateFlow_0158
     * @tc.desc      FormRequestState call flow succeed > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0158 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('23AfCZgGj5O');
      logInfo(`step1 succeed("23AfCZgGj5O"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 23AfCZgGj5O');
      const step2: string = subject.succeed('mPzaFnTQ3PNw');
      logInfo(`step2 succeed("mPzaFnTQ3PNw"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : mPzaFnTQ3PNw');
      const step3: string = subject.fail('xabc');
      logInfo(`step3 fail("xabc"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`succeed>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`succeed>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0159
     * @tc.name      RequestAddForm_FormRequestStateFlow_0159
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0159 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('3NI');
      logInfo(`step1 succeed("3NI"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 3NI');
      const step2: string = subject.succeed('DPaWgyRHMtW');
      logInfo(`step2 succeed("DPaWgyRHMtW"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : DPaWgyRHMtW');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : DPaWgyRHMtW');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0160
     * @tc.name      RequestAddForm_FormRequestStateFlow_0160
     * @tc.desc      FormRequestState call flow fail > succeed > succeed > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0160 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('iLZC9mFaV');
      logInfo(`step1 fail("iLZC9mFaV"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : iLZC9mFaV');
      const step2: string = subject.succeed('abcabc');
      logInfo(`step2 succeed("abcabc"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : abcabc');
      const step3: string = subject.succeed('fyakCI');
      logInfo(`step3 succeed("fyakCI"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : fyakCI');
      const step4: string = subject.succeed('NBB61CReUUOF');
      logInfo(`step4 succeed("NBB61CReUUOF"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : NBB61CReUUOF');
      const step5: string = subject.succeed('MgvrY1');
      logInfo(`step5 succeed("MgvrY1"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : MgvrY1');
      logInfo(`fail>succeed>succeed>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MgvrY1');
      logInfo(`fail>succeed>succeed>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(4);
      logInfo(`fail>succeed>succeed>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0161
     * @tc.name      RequestAddForm_FormRequestStateFlow_0161
     * @tc.desc      FormRequestState call flow succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0161 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('wI');
      logInfo(`step1 succeed("wI"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : wI');
      const step2: string = subject.fail('XwartGyB');
      logInfo(`step2 fail("XwartGyB"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : XwartGyB');
      const step3: string = subject.fail('rwInt');
      logInfo(`step3 fail("rwInt"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : rwInt');
      logInfo(`succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : rwInt');
      logInfo(`succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0162
     * @tc.name      RequestAddForm_FormRequestStateFlow_0162
     * @tc.desc      FormRequestState call flow request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0162 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('dykCMLqvC');
      logInfo(`step2 succeed("dykCMLqvC"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : dykCMLqvC');
      logInfo(`request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : dykCMLqvC');
      logInfo(`request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0163
     * @tc.name      RequestAddForm_FormRequestStateFlow_0163
     * @tc.desc      FormRequestState call flow fail > request > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0163 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('\u4e2d\u6587_1');
      logInfo(`step1 fail("??_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
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
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>request>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`fail>request>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      logInfo(`fail>request>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0164
     * @tc.name      RequestAddForm_FormRequestStateFlow_0164
     * @tc.desc      FormRequestState call flow succeed > succeed > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0164 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('fyakCI');
      logInfo(`step1 succeed("fyakCI"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : fyakCI');
      const step2: string = subject.succeed('Hello World');
      logInfo(`step2 succeed("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : Hello World');
      const step3: string = subject.fail('Qf1BZP21av');
      logInfo(`step3 fail("Qf1BZP21av"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Qf1BZP21av');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>succeed>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Qf1BZP21av');
      logInfo(`succeed>succeed>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0165
     * @tc.name      RequestAddForm_FormRequestStateFlow_0165
     * @tc.desc      FormRequestState call flow succeed > request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0165 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('fhKSMs');
      logInfo(`step1 succeed("fhKSMs"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : fhKSMs');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('Vni2');
      logInfo(`step3 succeed("Vni2"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : Vni2');
      const step4: string = subject.succeed('FhCpaChfS');
      logInfo(`step4 succeed("FhCpaChfS"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : FhCpaChfS');
      logInfo(`succeed>request>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : FhCpaChfS');
      logInfo(`succeed>request>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0166
     * @tc.name      RequestAddForm_FormRequestStateFlow_0166
     * @tc.desc      FormRequestState call flow request > request > request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0166 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
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
      const step4: string = subject.succeed('xabc');
      logInfo(`step4 succeed("xabc"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : xabc');
      const step5: string = subject.succeed('Ec1OlBl');
      logInfo(`step5 succeed("Ec1OlBl"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : Ec1OlBl');
      logInfo(`request>request>request>succeed>succeed f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>request>succeed>succeed f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>request>succeed>succeed f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ec1OlBl');
      logInfo(`request>request>request>succeed>succeed f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0166 end`);
    });
  });
}
