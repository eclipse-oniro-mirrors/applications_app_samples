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

/** Logic checks for FormRequestState flow (39 cases). */
export default function formRequestStateFlow6Test(): void {
  describe('FormRequestStateFlow6Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0210
     * @tc.name      RequestAddForm_FormRequestStateFlow_0210
     * @tc.desc      FormRequestState call flow fail > succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0210 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('uGr7a2su');
      logInfo(`step1 fail("uGr7a2su"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : uGr7a2su');
      const step2: string = subject.succeed(' _1');
      logInfo(`step2 succeed(" _1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success :  _1');
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
      logInfo(`fail>succeed>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>succeed>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>succeed>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  _1');
      logInfo(`fail>succeed>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0211
     * @tc.name      RequestAddForm_FormRequestStateFlow_0211
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0211 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('jhyNJsA57');
      logInfo(`step1 fail("jhyNJsA57"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : jhyNJsA57');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : jhyNJsA57');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0212
     * @tc.name      RequestAddForm_FormRequestStateFlow_0212
     * @tc.desc      FormRequestState call flow fail > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0212 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('6tLCzfX6H');
      logInfo(`step1 fail("6tLCzfX6H"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 6tLCzfX6H');
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
      logInfo(`fail>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 6tLCzfX6H');
      logInfo(`fail>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0213
     * @tc.name      RequestAddForm_FormRequestStateFlow_0213
     * @tc.desc      FormRequestState call flow succeed > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0213 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Hello WorldHello World');
      logInfo(`step1 succeed("Hello WorldHello World"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Hello WorldHello World');
      const step2: string = subject.fail(' 123 ');
      logInfo(`step2 fail(" 123 "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  123 ');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  123 ');
      logInfo(`succeed>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0214
     * @tc.name      RequestAddForm_FormRequestStateFlow_0214
     * @tc.desc      FormRequestState call flow request > request > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0214 begin`);
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
      const step3: string = subject.succeed('jLtYq');
      logInfo(`step3 succeed("jLtYq"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : jLtYq');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request>request>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : jLtYq');
      logInfo(`request>request>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0215
     * @tc.name      RequestAddForm_FormRequestStateFlow_0215
     * @tc.desc      FormRequestState call flow succeed > succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0215 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('  ');
      logInfo(`step1 succeed("  "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success :   ');
      const step2: string = subject.succeed('OJ1');
      logInfo(`step2 succeed("OJ1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : OJ1');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>succeed>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>succeed>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : OJ1');
      logInfo(`succeed>succeed>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0216
     * @tc.name      RequestAddForm_FormRequestStateFlow_0216
     * @tc.desc      FormRequestState call flow succeed > succeed > fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0216 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('123123');
      logInfo(`step1 succeed("123123"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 123123');
      const step2: string = subject.succeed('IVgEZ9CBFeCm');
      logInfo(`step2 succeed("IVgEZ9CBFeCm"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : IVgEZ9CBFeCm');
      const step3: string = subject.fail('Sample Title 123');
      logInfo(`step3 fail("Sample Title 123"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Sample Title 123');
      const step4: string = subject.succeed('a_1');
      logInfo(`step4 succeed("a_1"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : a_1');
      const step5: string = subject.fail('5OFlyQm');
      logInfo(`step5 fail("5OFlyQm"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : 5OFlyQm');
      logInfo(`succeed>succeed>fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 5OFlyQm');
      logInfo(`succeed>succeed>fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`succeed>succeed>fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0217
     * @tc.name      RequestAddForm_FormRequestStateFlow_0217
     * @tc.desc      FormRequestState call flow request > succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0217 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('xi4');
      logInfo(`step2 succeed("xi4"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : xi4');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('  ');
      logInfo(`step4 fail("  "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed :   ');
      logInfo(`request>succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :   ');
      logInfo(`request>succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0218
     * @tc.name      RequestAddForm_FormRequestStateFlow_0218
     * @tc.desc      FormRequestState call flow succeed > fail > request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0218 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('qWxr');
      logInfo(`step1 succeed("qWxr"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : qWxr');
      const step2: string = subject.fail('6lcdhjnkcDZ');
      logInfo(`step2 fail("6lcdhjnkcDZ"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('xHello World');
      logInfo(`step4 fail("xHello World"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : xHello World');
      const step5: string = subject.fail('xTSuiz9l');
      logInfo(`step5 fail("xTSuiz9l"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : xTSuiz9l');
      logInfo(`succeed>fail>request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>fail>request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>fail>request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xTSuiz9l');
      logInfo(`succeed>fail>request>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0219
     * @tc.name      RequestAddForm_FormRequestStateFlow_0219
     * @tc.desc      FormRequestState call flow succeed > request > request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0219 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('VDSQhcZbb6MQ');
      logInfo(`step1 succeed("VDSQhcZbb6MQ"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : VDSQhcZbb6MQ');
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
      const step4: string = subject.succeed(' _1');
      logInfo(`step4 succeed(" _1"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success :  _1');
      const step5: string = subject.succeed('oUTpjMECU8Z');
      logInfo(`step5 succeed("oUTpjMECU8Z"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      logInfo(`succeed>request>request>succeed>succeed f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>request>request>succeed>succeed f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>request>succeed>succeed f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      logInfo(`succeed>request>request>succeed>succeed f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0220
     * @tc.name      RequestAddForm_FormRequestStateFlow_0220
     * @tc.desc      FormRequestState call flow fail > fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0220 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('PzHRQIJiT');
      logInfo(`step1 fail("PzHRQIJiT"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : PzHRQIJiT');
      const step2: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`step2 fail(" ?? "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      const step3: string = subject.fail('xhello world');
      logInfo(`step3 fail("xhello world"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xhello world');
      const step4: string = subject.succeed('  ');
      logInfo(`step4 succeed("  "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success :   ');
      logInfo(`fail>fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :   ');
      logInfo(`fail>fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0221
     * @tc.name      RequestAddForm_FormRequestStateFlow_0221
     * @tc.desc      FormRequestState call flow request > request > fail > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0221 begin`);
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
      const step3: string = subject.fail('76');
      logInfo(`step3 fail("76"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 76');
      const step4: string = subject.fail('FnEe5CTm');
      logInfo(`step4 fail("FnEe5CTm"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : FnEe5CTm');
      const step5: string = subject.fail('Az0l');
      logInfo(`step5 fail("Az0l"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : Az0l');
      logInfo(`request>request>fail>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>fail>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Az0l');
      logInfo(`request>request>fail>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0222
     * @tc.name      RequestAddForm_FormRequestStateFlow_0222
     * @tc.desc      FormRequestState call flow succeed > succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0222 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('mrpmKRU');
      logInfo(`step1 succeed("mrpmKRU"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : mrpmKRU');
      const step2: string = subject.succeed('dykCMLqvC');
      logInfo(`step2 succeed("dykCMLqvC"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : dykCMLqvC');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>succeed>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>succeed>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : dykCMLqvC');
      logInfo(`succeed>succeed>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0223
     * @tc.name      RequestAddForm_FormRequestStateFlow_0223
     * @tc.desc      FormRequestState call flow request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0223 begin`);
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
      const step3: string = subject.fail('hVZdQ');
      logInfo(`step3 fail("hVZdQ"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : hVZdQ');
      logInfo(`request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hVZdQ');
      logInfo(`request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0224
     * @tc.name      RequestAddForm_FormRequestStateFlow_0224
     * @tc.desc      FormRequestState call flow fail > fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0224 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('8Hei');
      logInfo(`step1 fail("8Hei"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 8Hei');
      const step2: string = subject.fail('N');
      logInfo(`step2 fail("N"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : N');
      const step3: string = subject.fail('Fo');
      logInfo(`step3 fail("Fo"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Fo');
      const step4: string = subject.succeed(' ');
      logInfo(`step4 succeed(" "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success :  ');
      logInfo(`fail>fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  ');
      logInfo(`fail>fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0225
     * @tc.name      RequestAddForm_FormRequestStateFlow_0225
     * @tc.desc      FormRequestState call flow fail > succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0225 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('d');
      logInfo(`step1 fail("d"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : d');
      const step2: string = subject.succeed('');
      logInfo(`step2 succeed(""): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : ');
      const step3: string = subject.fail('Sample Title 123');
      logInfo(`step3 fail("Sample Title 123"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Sample Title 123');
      const step4: string = subject.fail('Az0l');
      logInfo(`step4 fail("Az0l"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : Az0l');
      logInfo(`fail>succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Az0l');
      logInfo(`fail>succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0226
     * @tc.name      RequestAddForm_FormRequestStateFlow_0226
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0226 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('IS');
      logInfo(`step1 fail("IS"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : IS');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : IS');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0227
     * @tc.name      RequestAddForm_FormRequestStateFlow_0227
     * @tc.desc      FormRequestState call flow succeed > fail > succeed > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0227 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('FhCpaChfS');
      logInfo(`step1 succeed("FhCpaChfS"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : FhCpaChfS');
      const step2: string = subject.fail('1IX5dqEwOPoI');
      logInfo(`step2 fail("1IX5dqEwOPoI"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 1IX5dqEwOPoI');
      const step3: string = subject.succeed('HaqlmHtC4oU');
      logInfo(`step3 succeed("HaqlmHtC4oU"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : HaqlmHtC4oU');
      const step4: string = subject.succeed('trhY');
      logInfo(`step4 succeed("trhY"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : trhY');
      const step5: string = subject.succeed('lEh');
      logInfo(`step5 succeed("lEh"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : lEh');
      logInfo(`succeed>fail>succeed>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lEh');
      logInfo(`succeed>fail>succeed>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(4);
      logInfo(`succeed>fail>succeed>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0228
     * @tc.name      RequestAddForm_FormRequestStateFlow_0228
     * @tc.desc      FormRequestState call flow fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0228 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('0Re');
      logInfo(`step1 fail("0Re"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 0Re');
      const step2: string = subject.succeed('9lNp2Z');
      logInfo(`step2 succeed("9lNp2Z"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 9lNp2Z');
      const step3: string = subject.succeed('FhCpaChfS');
      logInfo(`step3 succeed("FhCpaChfS"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : FhCpaChfS');
      logInfo(`fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : FhCpaChfS');
      logInfo(`fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0229
     * @tc.name      RequestAddForm_FormRequestStateFlow_0229
     * @tc.desc      FormRequestState call flow request > fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0229 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('Hello_1');
      logInfo(`step2 fail("Hello_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Hello_1');
      const step3: string = subject.succeed('bm');
      logInfo(`step3 succeed("bm"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : bm');
      const step4: string = subject.succeed('H7dK');
      logInfo(`step4 succeed("H7dK"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : H7dK');
      logInfo(`request>fail>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : H7dK');
      logInfo(`request>fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0230
     * @tc.name      RequestAddForm_FormRequestStateFlow_0230
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0230 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('T6CYEWMl');
      logInfo(`step1 fail("T6CYEWMl"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : T6CYEWMl');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : T6CYEWMl');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0231
     * @tc.name      RequestAddForm_FormRequestStateFlow_0231
     * @tc.desc      FormRequestState call flow succeed > fail > request > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0231 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('IFn2LmlG');
      logInfo(`step1 succeed("IFn2LmlG"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : IFn2LmlG');
      const step2: string = subject.fail('4');
      logInfo(`step2 fail("4"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 4');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('EvkwW');
      logInfo(`step4 succeed("EvkwW"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : EvkwW');
      const step5: string = subject.request(true);
      logInfo(`step5 request(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(174);
      logInfo(`step5 request(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(true): step5.substring(142)=${step5.substring(142)}`);
      expect(step5.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>fail>request>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>fail>request>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>fail>request>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : EvkwW');
      logInfo(`succeed>fail>request>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>request>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0232
     * @tc.name      RequestAddForm_FormRequestStateFlow_0232
     * @tc.desc      FormRequestState call flow request > request > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0232 begin`);
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
      const step3: string = subject.succeed('9tOhPNx');
      logInfo(`step3 succeed("9tOhPNx"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 9tOhPNx');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request>request>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 9tOhPNx');
      logInfo(`request>request>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0233
     * @tc.name      RequestAddForm_FormRequestStateFlow_0233
     * @tc.desc      FormRequestState call flow request > request > fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0233 begin`);
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
      const step3: string = subject.fail('xHello');
      logInfo(`step3 fail("xHello"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xHello');
      const step4: string = subject.succeed('ekp0NPrmkix');
      logInfo(`step4 succeed("ekp0NPrmkix"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      const step5: string = subject.succeed('C5X5iM3O9ZH');
      logInfo(`step5 succeed("C5X5iM3O9ZH"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : C5X5iM3O9ZH');
      logInfo(`request>request>fail>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : C5X5iM3O9ZH');
      logInfo(`request>request>fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>request>fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0234
     * @tc.name      RequestAddForm_FormRequestStateFlow_0234
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0234 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('zNyj70GL');
      logInfo(`step1 fail("zNyj70GL"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : zNyj70GL');
      const step2: string = subject.succeed('1zcq9fW6t');
      logInfo(`step2 succeed("1zcq9fW6t"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 1zcq9fW6t');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 1zcq9fW6t');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0235
     * @tc.name      RequestAddForm_FormRequestStateFlow_0235
     * @tc.desc      FormRequestState call flow fail > succeed > succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0235 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('A_1');
      logInfo(`step1 fail("A_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : A_1');
      const step2: string = subject.succeed('Hello World');
      logInfo(`step2 succeed("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : Hello World');
      const step3: string = subject.succeed('S');
      logInfo(`step3 succeed("S"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : S');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('tt');
      logInfo(`step5 succeed("tt"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : tt');
      logInfo(`fail>succeed>succeed>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>succeed>succeed>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>succeed>succeed>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : tt');
      logInfo(`fail>succeed>succeed>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`fail>succeed>succeed>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0236
     * @tc.name      RequestAddForm_FormRequestStateFlow_0236
     * @tc.desc      FormRequestState call flow succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0236 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('lC0a');
      logInfo(`step1 succeed("lC0a"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : lC0a');
      const step2: string = subject.fail('62jwo8fhw');
      logInfo(`step2 fail("62jwo8fhw"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 62jwo8fhw');
      logInfo(`succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 62jwo8fhw');
      logInfo(`succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0237
     * @tc.name      RequestAddForm_FormRequestStateFlow_0237
     * @tc.desc      FormRequestState call flow succeed > succeed > succeed > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0237 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('TC');
      logInfo(`step1 succeed("TC"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : TC');
      const step2: string = subject.succeed('csIBdZM8wgF');
      logInfo(`step2 succeed("csIBdZM8wgF"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : csIBdZM8wgF');
      const step3: string = subject.succeed('zPR6Z5g5v');
      logInfo(`step3 succeed("zPR6Z5g5v"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : zPR6Z5g5v');
      const step4: string = subject.fail('jLhLPiS6nU');
      logInfo(`step4 fail("jLhLPiS6nU"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : jLhLPiS6nU');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>succeed>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>succeed>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>succeed>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : jLhLPiS6nU');
      logInfo(`succeed>succeed>succeed>fail>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`succeed>succeed>succeed>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0238
     * @tc.name      RequestAddForm_FormRequestStateFlow_0238
     * @tc.desc      FormRequestState call flow succeed > request > request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0238 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('scHdaM');
      logInfo(`step1 succeed("scHdaM"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : scHdaM');
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
      const step4: string = subject.fail('Fo');
      logInfo(`step4 fail("Fo"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : Fo');
      const step5: string = subject.fail('yDtsHsIX');
      logInfo(`step5 fail("yDtsHsIX"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : yDtsHsIX');
      logInfo(`succeed>request>request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>request>request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : yDtsHsIX');
      logInfo(`succeed>request>request>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>request>request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0239
     * @tc.name      RequestAddForm_FormRequestStateFlow_0239
     * @tc.desc      FormRequestState call flow succeed > request > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0239 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('xJGUvtBLeN');
      logInfo(`step1 succeed("xJGUvtBLeN"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : xJGUvtBLeN');
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
      logInfo(`succeed>request>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`succeed>request>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xJGUvtBLeN');
      logInfo(`succeed>request>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0240
     * @tc.name      RequestAddForm_FormRequestStateFlow_0240
     * @tc.desc      FormRequestState call flow succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0240 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('S');
      logInfo(`step1 succeed("S"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : S');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('N4oSx');
      logInfo(`step3 fail("N4oSx"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : N4oSx');
      logInfo(`succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : N4oSx');
      logInfo(`succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0241
     * @tc.name      RequestAddForm_FormRequestStateFlow_0241
     * @tc.desc      FormRequestState call flow request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0241 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('spGgQa');
      logInfo(`step2 fail("spGgQa"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : spGgQa');
      const step3: string = subject.fail(' A ');
      logInfo(`step3 fail(" A "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  A ');
      logInfo(`request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  A ');
      logInfo(`request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0242
     * @tc.name      RequestAddForm_FormRequestStateFlow_0242
     * @tc.desc      FormRequestState call flow fail > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0242 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('rxEk64Yr');
      logInfo(`step1 fail("rxEk64Yr"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : rxEk64Yr');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : rxEk64Yr');
      logInfo(`fail>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0243
     * @tc.name      RequestAddForm_FormRequestStateFlow_0243
     * @tc.desc      FormRequestState call flow request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0243 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('pCYH');
      logInfo(`step2 succeed("pCYH"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : pCYH');
      const step3: string = subject.succeed('fhKSMs');
      logInfo(`step3 succeed("fhKSMs"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : fhKSMs');
      logInfo(`request>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : fhKSMs');
      logInfo(`request>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0244
     * @tc.name      RequestAddForm_FormRequestStateFlow_0244
     * @tc.desc      FormRequestState call flow succeed > succeed > request > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0244 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('5Pi');
      logInfo(`step1 succeed("5Pi"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 5Pi');
      const step2: string = subject.succeed('7UNA9Kx4R6Ug');
      logInfo(`step2 succeed("7UNA9Kx4R6Ug"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 7UNA9Kx4R6Ug');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('a');
      logInfo(`step4 succeed("a"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : a');
      const step5: string = subject.request(true);
      logInfo(`step5 request(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(174);
      logInfo(`step5 request(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(true): step5.substring(142)=${step5.substring(142)}`);
      expect(step5.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>request>succeed>request f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>succeed>request>succeed>request f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>succeed>request>succeed>request f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : a');
      logInfo(`succeed>succeed>request>succeed>request f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0245
     * @tc.name      RequestAddForm_FormRequestStateFlow_0245
     * @tc.desc      FormRequestState call flow fail > succeed > fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0245 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xSample Title 123');
      logInfo(`step1 fail("xSample Title 123"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xSample Title 123');
      const step2: string = subject.succeed('3ja2BB');
      logInfo(`step2 succeed("3ja2BB"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 3ja2BB');
      const step3: string = subject.fail('d');
      logInfo(`step3 fail("d"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : d');
      const step4: string = subject.succeed('Ce3pzpg');
      logInfo(`step4 succeed("Ce3pzpg"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : Ce3pzpg');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>succeed>fail>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>succeed>fail>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>succeed>fail>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`fail>succeed>fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0246
     * @tc.name      RequestAddForm_FormRequestStateFlow_0246
     * @tc.desc      FormRequestState call flow succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0246 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('xHello World');
      logInfo(`step1 succeed("xHello World"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : xHello World');
      const step2: string = subject.fail('123_1');
      logInfo(`step2 fail("123_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 123_1');
      logInfo(`succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 123_1');
      logInfo(`succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0247
     * @tc.name      RequestAddForm_FormRequestStateFlow_0247
     * @tc.desc      FormRequestState call flow fail > request > fail > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0247 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('1IX5dqEwOPoI');
      logInfo(`step1 fail("1IX5dqEwOPoI"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 1IX5dqEwOPoI');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('xA');
      logInfo(`step3 fail("xA"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xA');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('8');
      logInfo(`step5 succeed("8"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : 8');
      logInfo(`fail>request>fail>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>fail>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>fail>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 8');
      logInfo(`fail>request>fail>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>request>fail>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0248
     * @tc.name      RequestAddForm_FormRequestStateFlow_0248
     * @tc.desc      FormRequestState call flow succeed > succeed > fail > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0248 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('abcabc');
      logInfo(`step1 succeed("abcabc"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : abcabc');
      const step2: string = subject.succeed('i2qDo6fDXj');
      logInfo(`step2 succeed("i2qDo6fDXj"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : i2qDo6fDXj');
      const step3: string = subject.fail('xabc');
      logInfo(`step3 fail("xabc"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xabc');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.fail('6lcdhjnkcDZ');
      logInfo(`step5 fail("6lcdhjnkcDZ"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`succeed>succeed>fail>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>fail>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>fail>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`succeed>succeed>fail>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>succeed>fail>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0248 end`);
    });
  });
}
