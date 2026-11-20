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

/** Logic checks for FormRequestState flow (11 cases). */
export default function formRequestStateFlow7Test(): void {
  describe('FormRequestStateFlow7Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0249
     * @tc.name      RequestAddForm_FormRequestStateFlow_0249
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0249 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('rq3');
      logInfo(`step1 succeed("rq3"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : rq3');
      const step2: string = subject.succeed('MQm');
      logInfo(`step2 succeed("MQm"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : MQm');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MQm');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0250
     * @tc.name      RequestAddForm_FormRequestStateFlow_0250
     * @tc.desc      FormRequestState call flow request > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0250 begin`);
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
      logInfo(`request>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`${BUNDLE}FormRequestStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0251
     * @tc.name      RequestAddForm_FormRequestStateFlow_0251
     * @tc.desc      FormRequestState call flow succeed > fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0251 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('wM');
      logInfo(`step1 succeed("wM"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : wM');
      const step2: string = subject.fail('R');
      logInfo(`step2 fail("R"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : R');
      const step3: string = subject.fail('uklq');
      logInfo(`step3 fail("uklq"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : uklq');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : uklq');
      logInfo(`succeed>fail>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0252
     * @tc.name      RequestAddForm_FormRequestStateFlow_0252
     * @tc.desc      FormRequestState call flow succeed > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0252 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('c');
      logInfo(`step1 succeed("c"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : c');
      const step2: string = subject.succeed('YxJdjzwIhC6o');
      logInfo(`step2 succeed("YxJdjzwIhC6o"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : YxJdjzwIhC6o');
      const step3: string = subject.fail('lG');
      logInfo(`step3 fail("lG"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : lG');
      logInfo(`succeed>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : lG');
      logInfo(`succeed>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0253
     * @tc.name      RequestAddForm_FormRequestStateFlow_0253
     * @tc.desc      FormRequestState call flow request > succeed > fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0253 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('ZpIiJ5');
      logInfo(`step2 succeed("ZpIiJ5"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : ZpIiJ5');
      const step3: string = subject.fail('GTk4mr0');
      logInfo(`step3 fail("GTk4mr0"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : GTk4mr0');
      const step4: string = subject.succeed('HaqlmHtC4oU');
      logInfo(`step4 succeed("HaqlmHtC4oU"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : HaqlmHtC4oU');
      const step5: string = subject.fail('hCCpq');
      logInfo(`step5 fail("hCCpq"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : hCCpq');
      logInfo(`request>succeed>fail>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>fail>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>succeed>fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hCCpq');
      logInfo(`request>succeed>fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>succeed>fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0254
     * @tc.name      RequestAddForm_FormRequestStateFlow_0254
     * @tc.desc      FormRequestState call flow fail > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0254 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('rxEk64Yr');
      logInfo(`step1 fail("rxEk64Yr"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : rxEk64Yr');
      const step2: string = subject.fail('Hello_1');
      logInfo(`step2 fail("Hello_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Hello_1');
      const step3: string = subject.fail('3');
      logInfo(`step3 fail("3"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 3');
      logInfo(`fail>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 3');
      logInfo(`fail>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0255
     * @tc.name      RequestAddForm_FormRequestStateFlow_0255
     * @tc.desc      FormRequestState call flow succeed > succeed > fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0255 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('scHdaM');
      logInfo(`step1 succeed("scHdaM"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : scHdaM');
      const step2: string = subject.succeed('wI');
      logInfo(`step2 succeed("wI"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : wI');
      const step3: string = subject.fail('yElGZy217');
      logInfo(`step3 fail("yElGZy217"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : yElGZy217');
      const step4: string = subject.fail('1IX5dqEwOPoI');
      logInfo(`step4 fail("1IX5dqEwOPoI"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : 1IX5dqEwOPoI');
      const step5: string = subject.request(true);
      logInfo(`step5 request(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(174);
      logInfo(`step5 request(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(true): step5.substring(142)=${step5.substring(142)}`);
      expect(step5.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>fail>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>fail>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>succeed>fail>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 1IX5dqEwOPoI');
      logInfo(`succeed>succeed>fail>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0256
     * @tc.name      RequestAddForm_FormRequestStateFlow_0256
     * @tc.desc      FormRequestState call flow fail > request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0256 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('abc');
      logInfo(`step1 fail("abc"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : abc');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('xSample Title 123');
      logInfo(`step3 fail("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xSample Title 123');
      const step4: string = subject.fail('fUuuMtT');
      logInfo(`step4 fail("fUuuMtT"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : fUuuMtT');
      logInfo(`fail>request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : fUuuMtT');
      logInfo(`fail>request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0257
     * @tc.name      RequestAddForm_FormRequestStateFlow_0257
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0257 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('A_1');
      logInfo(`step1 fail("A_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : A_1');
      const step2: string = subject.succeed('a_1');
      logInfo(`step2 succeed("a_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : a_1');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : a_1');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0258
     * @tc.name      RequestAddForm_FormRequestStateFlow_0258
     * @tc.desc      FormRequestState call flow succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0258 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('xi4');
      logInfo(`step1 succeed("xi4"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : xi4');
      const step2: string = subject.fail('pUpeNHII1');
      logInfo(`step2 fail("pUpeNHII1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : pUpeNHII1');
      logInfo(`succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : pUpeNHII1');
      logInfo(`succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0259
     * @tc.name      RequestAddForm_FormRequestStateFlow_0259
     * @tc.desc      FormRequestState call flow request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0259 begin`);
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
      const step3: string = subject.fail('o9S5dys');
      logInfo(`step3 fail("o9S5dys"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : o9S5dys');
      logInfo(`request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : o9S5dys');
      logInfo(`request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0259 end`);
    });
  });
}
