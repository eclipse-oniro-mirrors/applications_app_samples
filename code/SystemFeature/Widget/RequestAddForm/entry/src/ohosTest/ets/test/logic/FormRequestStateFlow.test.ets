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
export default function formRequestStateFlowTest(): void {
  describe('FormRequestStateFlowTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0001
     * @tc.name      RequestAddForm_FormRequestStateFlow_0001
     * @tc.desc      FormRequestState call flow request > fail > fail > fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0001 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('bl8gY');
      logInfo(`step2 fail("bl8gY"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : bl8gY');
      const step3: string = subject.fail(' _1');
      logInfo(`step3 fail(" _1"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  _1');
      const step4: string = subject.fail('b');
      logInfo(`step4 fail("b"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : b');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request>fail>fail>fail>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>fail>fail>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>fail>fail>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : b');
      logInfo(`request>fail>fail>fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0002
     * @tc.name      RequestAddForm_FormRequestStateFlow_0002
     * @tc.desc      FormRequestState call flow fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0002 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('gX6');
      logInfo(`step1 fail("gX6"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : gX6');
      const step2: string = subject.fail('acr');
      logInfo(`step2 fail("acr"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : acr');
      logInfo(`fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : acr');
      logInfo(`fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0003
     * @tc.name      RequestAddForm_FormRequestStateFlow_0003
     * @tc.desc      FormRequestState call flow fail > request > succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0003 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('w');
      logInfo(`step1 fail("w"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : w');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('PT9kqqj');
      logInfo(`step3 succeed("PT9kqqj"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : PT9kqqj');
      const step4: string = subject.fail('V2Q');
      logInfo(`step4 fail("V2Q"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : V2Q');
      const step5: string = subject.fail('NtEWY8iB');
      logInfo(`step5 fail("NtEWY8iB"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : NtEWY8iB');
      logInfo(`fail>request>succeed>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>succeed>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : NtEWY8iB');
      logInfo(`fail>request>succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>request>succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0004
     * @tc.name      RequestAddForm_FormRequestStateFlow_0004
     * @tc.desc      FormRequestState call flow request > succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0004 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('DPaWgyRHMtW');
      logInfo(`step2 succeed("DPaWgyRHMtW"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : DPaWgyRHMtW');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('o4kmvU');
      logInfo(`step4 fail("o4kmvU"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : o4kmvU');
      logInfo(`request>succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : o4kmvU');
      logInfo(`request>succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0005
     * @tc.name      RequestAddForm_FormRequestStateFlow_0005
     * @tc.desc      FormRequestState call flow request > succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0005 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
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
      const step4: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`step4 fail(" ?? "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`request>succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`request>succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0006
     * @tc.name      RequestAddForm_FormRequestStateFlow_0006
     * @tc.desc      FormRequestState call flow fail > request > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0006 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('AA');
      logInfo(`step1 fail("AA"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : AA');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('HnHlcedci');
      logInfo(`step3 succeed("HnHlcedci"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : HnHlcedci');
      const step4: string = subject.fail('xabc');
      logInfo(`step4 fail("xabc"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`fail>request>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`fail>request>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>request>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0007
     * @tc.name      RequestAddForm_FormRequestStateFlow_0007
     * @tc.desc      FormRequestState call flow request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0007 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('6lcdhjnkcDZ');
      logInfo(`step2 fail("6lcdhjnkcDZ"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0008
     * @tc.name      RequestAddForm_FormRequestStateFlow_0008
     * @tc.desc      FormRequestState call flow request > fail > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0008 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('aa');
      logInfo(`step2 fail("aa"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : aa');
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
      logInfo(`request>fail>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>fail>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : aa');
      logInfo(`request>fail>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0009
     * @tc.name      RequestAddForm_FormRequestStateFlow_0009
     * @tc.desc      FormRequestState call flow request > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0009 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('3ja2BB');
      logInfo(`step2 succeed("3ja2BB"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 3ja2BB');
      const step3: string = subject.fail('5vtP');
      logInfo(`step3 fail("5vtP"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 5vtP');
      logInfo(`request>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 5vtP');
      logInfo(`request>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0010
     * @tc.name      RequestAddForm_FormRequestStateFlow_0010
     * @tc.desc      FormRequestState call flow request > succeed > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0010 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('');
      logInfo(`step2 succeed(""): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : ');
      const step3: string = subject.succeed('AlNzoasZntZO');
      logInfo(`step3 succeed("AlNzoasZntZO"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : AlNzoasZntZO');
      const step4: string = subject.succeed('ekp0NPrmkix');
      logInfo(`step4 succeed("ekp0NPrmkix"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      logInfo(`request>succeed>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      logInfo(`request>succeed>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0011
     * @tc.name      RequestAddForm_FormRequestStateFlow_0011
     * @tc.desc      FormRequestState call flow succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0011 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('9lNp2Z');
      logInfo(`step1 succeed("9lNp2Z"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 9lNp2Z');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 9lNp2Z');
      logInfo(`succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0012
     * @tc.name      RequestAddForm_FormRequestStateFlow_0012
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0012 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('tYzRY3u3xO0');
      logInfo(`step1 succeed("tYzRY3u3xO0"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : tYzRY3u3xO0');
      const step2: string = subject.succeed('8o4Hy99Yie');
      logInfo(`step2 succeed("8o4Hy99Yie"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0013
     * @tc.name      RequestAddForm_FormRequestStateFlow_0013
     * @tc.desc      FormRequestState call flow request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0013 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('i4DFl0JfB');
      logInfo(`step2 fail("i4DFl0JfB"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : i4DFl0JfB');
      logInfo(`request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : i4DFl0JfB');
      logInfo(`request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0014
     * @tc.name      RequestAddForm_FormRequestStateFlow_0014
     * @tc.desc      FormRequestState call flow fail > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0014 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('a');
      logInfo(`step1 fail("a"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : a');
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
      logInfo(`fail>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : a');
      logInfo(`fail>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0015
     * @tc.name      RequestAddForm_FormRequestStateFlow_0015
     * @tc.desc      FormRequestState call flow request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0015 begin`);
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
      const step3: string = subject.fail('Hello');
      logInfo(`step3 fail("Hello"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Hello');
      logInfo(`request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello');
      logInfo(`request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0016
     * @tc.name      RequestAddForm_FormRequestStateFlow_0016
     * @tc.desc      FormRequestState call flow fail > succeed > succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0016 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('twL7fp8GL75Z');
      logInfo(`step1 fail("twL7fp8GL75Z"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : twL7fp8GL75Z');
      const step2: string = subject.succeed('FhCpaChfS');
      logInfo(`step2 succeed("FhCpaChfS"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : FhCpaChfS');
      const step3: string = subject.succeed('wM');
      logInfo(`step3 succeed("wM"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : wM');
      const step4: string = subject.fail(' a ');
      logInfo(`step4 fail(" a "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed :  a ');
      const step5: string = subject.succeed('YLVStOQ87i');
      logInfo(`step5 succeed("YLVStOQ87i"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : YLVStOQ87i');
      logInfo(`fail>succeed>succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : YLVStOQ87i');
      logInfo(`fail>succeed>succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`fail>succeed>succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0017
     * @tc.name      RequestAddForm_FormRequestStateFlow_0017
     * @tc.desc      FormRequestState call flow request > fail > fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0017 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail(' A ');
      logInfo(`step2 fail(" A "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  A ');
      const step3: string = subject.fail('X837J');
      logInfo(`step3 fail("X837J"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : X837J');
      const step4: string = subject.succeed('AlNzoasZntZO');
      logInfo(`step4 succeed("AlNzoasZntZO"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : AlNzoasZntZO');
      const step5: string = subject.succeed('a_1');
      logInfo(`step5 succeed("a_1"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : a_1');
      logInfo(`request>fail>fail>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>fail>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : a_1');
      logInfo(`request>fail>fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>fail>fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0018
     * @tc.name      RequestAddForm_FormRequestStateFlow_0018
     * @tc.desc      FormRequestState call flow request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0018 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('ZE7OH3t67pk');
      logInfo(`step2 fail("ZE7OH3t67pk"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : ZE7OH3t67pk');
      logInfo(`request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ZE7OH3t67pk');
      logInfo(`request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0019
     * @tc.name      RequestAddForm_FormRequestStateFlow_0019
     * @tc.desc      FormRequestState call flow request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0019 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('bm');
      logInfo(`step2 succeed("bm"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : bm');
      logInfo(`request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : bm');
      logInfo(`request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0020
     * @tc.name      RequestAddForm_FormRequestStateFlow_0020
     * @tc.desc      FormRequestState call flow request > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0020 begin`);
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
      const step3: string = subject.succeed('lmdG2u5cjoTs');
      logInfo(`step3 succeed("lmdG2u5cjoTs"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`request>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`request>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0021
     * @tc.name      RequestAddForm_FormRequestStateFlow_0021
     * @tc.desc      FormRequestState call flow succeed > succeed > succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0021 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('9hlv');
      logInfo(`step1 succeed("9hlv"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 9hlv');
      const step2: string = subject.succeed('rIhMBDRVa9v0');
      logInfo(`step2 succeed("rIhMBDRVa9v0"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : rIhMBDRVa9v0');
      const step3: string = subject.succeed('soK3RCMXa9');
      logInfo(`step3 succeed("soK3RCMXa9"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : soK3RCMXa9');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('96d00eDs');
      logInfo(`step5 succeed("96d00eDs"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : 96d00eDs');
      logInfo(`succeed>succeed>succeed>request>succeed f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>succeed>request>succeed f...: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>succeed>succeed>request>succeed f...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 96d00eDs');
      logInfo(`succeed>succeed>succeed>request>succeed f...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(4);
      logInfo(`${BUNDLE}FormRequestStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0022
     * @tc.name      RequestAddForm_FormRequestStateFlow_0022
     * @tc.desc      FormRequestState call flow succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0022 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('scHdaM');
      logInfo(`step1 succeed("scHdaM"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : scHdaM');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed(' a ');
      logInfo(`step3 succeed(" a "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success :  a ');
      logInfo(`succeed>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  a ');
      logInfo(`succeed>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0023
     * @tc.name      RequestAddForm_FormRequestStateFlow_0023
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0023 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('5vtP');
      logInfo(`step1 fail("5vtP"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 5vtP');
      const step2: string = subject.succeed('lEh');
      logInfo(`step2 succeed("lEh"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : lEh');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lEh');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0024
     * @tc.name      RequestAddForm_FormRequestStateFlow_0024
     * @tc.desc      FormRequestState call flow request > fail > fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0024 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('VC3F8Kfju7');
      logInfo(`step2 fail("VC3F8Kfju7"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : VC3F8Kfju7');
      const step3: string = subject.fail('Hello_1');
      logInfo(`step3 fail("Hello_1"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Hello_1');
      const step4: string = subject.succeed('1zcq9fW6t');
      logInfo(`step4 succeed("1zcq9fW6t"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : 1zcq9fW6t');
      const step5: string = subject.succeed('Y0MWVUaV');
      logInfo(`step5 succeed("Y0MWVUaV"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : Y0MWVUaV');
      logInfo(`request>fail>fail>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>fail>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Y0MWVUaV');
      logInfo(`request>fail>fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>fail>fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0025
     * @tc.name      RequestAddForm_FormRequestStateFlow_0025
     * @tc.desc      FormRequestState call flow fail > succeed > fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0025 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('V2Q');
      logInfo(`step1 fail("V2Q"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : V2Q');
      const step2: string = subject.succeed('6kl8y66k1rb');
      logInfo(`step2 succeed("6kl8y66k1rb"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 6kl8y66k1rb');
      const step3: string = subject.fail('76');
      logInfo(`step3 fail("76"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 76');
      const step4: string = subject.succeed('8o4Hy99Yie');
      logInfo(`step4 succeed("8o4Hy99Yie"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      const step5: string = subject.succeed('rRBS7Sz');
      logInfo(`step5 succeed("rRBS7Sz"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : rRBS7Sz');
      logInfo(`fail>succeed>fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : rRBS7Sz');
      logInfo(`fail>succeed>fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`fail>succeed>fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0026
     * @tc.name      RequestAddForm_FormRequestStateFlow_0026
     * @tc.desc      FormRequestState call flow succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0026 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Y0MWVUaV');
      logInfo(`step1 succeed("Y0MWVUaV"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Y0MWVUaV');
      const step2: string = subject.fail('Sample Title 123');
      logInfo(`step2 fail("Sample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Sample Title 123');
      logInfo(`succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Sample Title 123');
      logInfo(`succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0027
     * @tc.name      RequestAddForm_FormRequestStateFlow_0027
     * @tc.desc      FormRequestState call flow succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0027 begin`);
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
      logInfo(`succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : fhKSMs');
      logInfo(`succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0028
     * @tc.name      RequestAddForm_FormRequestStateFlow_0028
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0028 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('lWAylOlWjP');
      logInfo(`step1 succeed("lWAylOlWjP"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : lWAylOlWjP');
      const step2: string = subject.succeed('BYIy');
      logInfo(`step2 succeed("BYIy"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : BYIy');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : BYIy');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0029
     * @tc.name      RequestAddForm_FormRequestStateFlow_0029
     * @tc.desc      FormRequestState call flow succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0029 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Hh');
      logInfo(`step1 succeed("Hh"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Hh');
      const step2: string = subject.fail('iJx');
      logInfo(`step2 fail("iJx"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : iJx');
      const step3: string = subject.fail('xSample Title 123');
      logInfo(`step3 fail("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : xSample Title 123');
      logInfo(`succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xSample Title 123');
      logInfo(`succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0030
     * @tc.name      RequestAddForm_FormRequestStateFlow_0030
     * @tc.desc      FormRequestState call flow fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0030 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail(' Hello World ');
      logInfo(`step1 fail(" Hello World "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed :  Hello World ');
      const step2: string = subject.fail('NtEWY8iB');
      logInfo(`step2 fail("NtEWY8iB"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : NtEWY8iB');
      const step3: string = subject.succeed('Hh');
      logInfo(`step3 succeed("Hh"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : Hh');
      logInfo(`fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hh');
      logInfo(`fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0031
     * @tc.name      RequestAddForm_FormRequestStateFlow_0031
     * @tc.desc      FormRequestState call flow succeed > request > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0031 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('HaqlmHtC4oU');
      logInfo(`step1 succeed("HaqlmHtC4oU"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : HaqlmHtC4oU');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('123');
      logInfo(`step3 succeed("123"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 123');
      const step4: string = subject.fail('9oBhbLIJzW');
      logInfo(`step4 fail("9oBhbLIJzW"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : 9oBhbLIJzW');
      logInfo(`succeed>request>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 9oBhbLIJzW');
      logInfo(`succeed>request>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>request>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0032
     * @tc.name      RequestAddForm_FormRequestStateFlow_0032
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0032 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('f6p');
      logInfo(`step1 fail("f6p"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : f6p');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : f6p');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0033
     * @tc.name      RequestAddForm_FormRequestStateFlow_0033
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0033 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xa');
      logInfo(`step1 fail("xa"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xa');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xa');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0034
     * @tc.name      RequestAddForm_FormRequestStateFlow_0034
     * @tc.desc      FormRequestState call flow request > succeed > succeed > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0034 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('K80cZObUF');
      logInfo(`step2 succeed("K80cZObUF"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : K80cZObUF');
      const step3: string = subject.succeed('lmdG2u5cjoTs');
      logInfo(`step3 succeed("lmdG2u5cjoTs"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      const step4: string = subject.succeed('1zcq9fW6t');
      logInfo(`step4 succeed("1zcq9fW6t"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : 1zcq9fW6t');
      const step5: string = subject.fail('v8KM5');
      logInfo(`step5 fail("v8KM5"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : v8KM5');
      logInfo(`request>succeed>succeed>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed>succeed>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>succeed>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : v8KM5');
      logInfo(`request>succeed>succeed>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`request>succeed>succeed>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0035
     * @tc.name      RequestAddForm_FormRequestStateFlow_0035
     * @tc.desc      FormRequestState call flow fail > fail > succeed > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0035 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('uOfyzg89xRFw');
      logInfo(`step1 fail("uOfyzg89xRFw"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : uOfyzg89xRFw');
      const step2: string = subject.fail('Qf1BZP21av');
      logInfo(`step2 fail("Qf1BZP21av"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Qf1BZP21av');
      const step3: string = subject.succeed('rIhMBDRVa9v0');
      logInfo(`step3 succeed("rIhMBDRVa9v0"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : rIhMBDRVa9v0');
      const step4: string = subject.succeed(' a ');
      logInfo(`step4 succeed(" a "): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success :  a ');
      const step5: string = subject.fail('A');
      logInfo(`step5 fail("A"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : A');
      logInfo(`fail>fail>succeed>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : A');
      logInfo(`fail>fail>succeed>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>fail>succeed>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0036
     * @tc.name      RequestAddForm_FormRequestStateFlow_0036
     * @tc.desc      FormRequestState call flow fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0036 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('cBOz');
      logInfo(`step1 fail("cBOz"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : cBOz');
      const step2: string = subject.succeed('xHello World');
      logInfo(`step2 succeed("xHello World"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : xHello World');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xHello World');
      logInfo(`fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0037
     * @tc.name      RequestAddForm_FormRequestStateFlow_0037
     * @tc.desc      FormRequestState call flow request > request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0037 begin`);
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
      const step3: string = subject.fail('PQt5CuQOl');
      logInfo(`step3 fail("PQt5CuQOl"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : PQt5CuQOl');
      const step4: string = subject.fail('PQt5CuQOl');
      logInfo(`step4 fail("PQt5CuQOl"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : PQt5CuQOl');
      logInfo(`request>request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : PQt5CuQOl');
      logInfo(`request>request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0038
     * @tc.name      RequestAddForm_FormRequestStateFlow_0038
     * @tc.desc      FormRequestState call flow fail > request > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0038 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('V2Q');
      logInfo(`step1 fail("V2Q"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : V2Q');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.succeed('R');
      logInfo(`step3 succeed("R"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : R');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>request>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>request>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>request>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : R');
      logInfo(`fail>request>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>request>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0039
     * @tc.name      RequestAddForm_FormRequestStateFlow_0039
     * @tc.desc      FormRequestState call flow fail > fail > succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0039 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step1 fail("????"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : \u4e2d\u6587\u4e2d\u6587');
      const step2: string = subject.fail('wATCoH');
      logInfo(`step2 fail("wATCoH"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : wATCoH');
      const step3: string = subject.succeed('123_1');
      logInfo(`step3 succeed("123_1"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 123_1');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.succeed('MKUexK7W5');
      logInfo(`step5 succeed("MKUexK7W5"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : MKUexK7W5');
      logInfo(`fail>fail>succeed>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>fail>succeed>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>fail>succeed>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MKUexK7W5');
      logInfo(`fail>fail>succeed>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>fail>succeed>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0040
     * @tc.name      RequestAddForm_FormRequestStateFlow_0040
     * @tc.desc      FormRequestState call flow succeed > succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0040 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('lC0a');
      logInfo(`step1 succeed("lC0a"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : lC0a');
      const step2: string = subject.succeed('pCYH');
      logInfo(`step2 succeed("pCYH"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : pCYH');
      const step3: string = subject.fail('a');
      logInfo(`step3 fail("a"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : a');
      const step4: string = subject.succeed('uRaGiSN');
      logInfo(`step4 succeed("uRaGiSN"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`succeed>succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`succeed>succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`succeed>succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0041
     * @tc.name      RequestAddForm_FormRequestStateFlow_0041
     * @tc.desc      FormRequestState call flow fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0041 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`step1 fail(" ?? "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      const step2: string = subject.fail('xSample Title 123');
      logInfo(`step2 fail("xSample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : xSample Title 123');
      const step3: string = subject.succeed('3NI');
      logInfo(`step3 succeed("3NI"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 3NI');
      logInfo(`fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3NI');
      logInfo(`fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0042
     * @tc.name      RequestAddForm_FormRequestStateFlow_0042
     * @tc.desc      FormRequestState call flow succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0042 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('3M');
      logInfo(`step1 succeed("3M"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 3M');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3M');
      logInfo(`succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0042 end`);
    });
  });
}
