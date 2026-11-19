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

/** Logic checks for FormRequestState flow (43 cases). */
export default function formRequestStateFlow5Test(): void {
  describe('FormRequestStateFlow5Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0167
     * @tc.name      RequestAddForm_FormRequestStateFlow_0167
     * @tc.desc      FormRequestState call flow request > fail > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0167 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('Hello World_1');
      logInfo(`step2 fail("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Hello World_1');
      const step3: string = subject.request(true);
      logInfo(`step3 request(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(174);
      logInfo(`step3 request(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(true): step3.substring(142)=${step3.substring(142)}`);
      expect(step3.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('vdsItCe2m');
      logInfo(`step4 succeed("vdsItCe2m"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : vdsItCe2m');
      logInfo(`request>fail>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>fail>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>fail>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : vdsItCe2m');
      logInfo(`request>fail>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>fail>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0168
     * @tc.name      RequestAddForm_FormRequestStateFlow_0168
     * @tc.desc      FormRequestState call flow fail > fail > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0168 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('SeD6');
      logInfo(`step1 fail("SeD6"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : SeD6');
      const step2: string = subject.fail('kCl5jCtN');
      logInfo(`step2 fail("kCl5jCtN"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : kCl5jCtN');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('i4DFl0JfB');
      logInfo(`step4 fail("i4DFl0JfB"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : i4DFl0JfB');
      logInfo(`fail>fail>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>fail>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>fail>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : i4DFl0JfB');
      logInfo(`fail>fail>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0169
     * @tc.name      RequestAddForm_FormRequestStateFlow_0169
     * @tc.desc      FormRequestState call flow request > request > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0169 begin`);
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
      const step3: string = subject.fail('Hello World');
      logInfo(`step3 fail("Hello World"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : Hello World');
      const step4: string = subject.succeed('S');
      logInfo(`step4 succeed("S"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : S');
      logInfo(`request>request>fail>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>request>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : S');
      logInfo(`request>request>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>request>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0170
     * @tc.name      RequestAddForm_FormRequestStateFlow_0170
     * @tc.desc      FormRequestState call flow fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0170 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('6lcdhjnkcDZ');
      logInfo(`step1 fail("6lcdhjnkcDZ"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      const step2: string = subject.fail('HhG');
      logInfo(`step2 fail("HhG"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0171
     * @tc.name      RequestAddForm_FormRequestStateFlow_0171
     * @tc.desc      FormRequestState call flow fail > fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0171 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('JcoNFd');
      logInfo(`step1 fail("JcoNFd"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : JcoNFd');
      const step2: string = subject.fail(' 123 ');
      logInfo(`step2 fail(" 123 "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  123 ');
      const step3: string = subject.succeed('7UNA9Kx4R6Ug');
      logInfo(`step3 succeed("7UNA9Kx4R6Ug"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 7UNA9Kx4R6Ug');
      const step4: string = subject.succeed('Hs64');
      logInfo(`step4 succeed("Hs64"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : Hs64');
      logInfo(`fail>fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hs64');
      logInfo(`fail>fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0172
     * @tc.name      RequestAddForm_FormRequestStateFlow_0172
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0172 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('hh9axShw3oz');
      logInfo(`step1 succeed("hh9axShw3oz"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : hh9axShw3oz');
      const step2: string = subject.succeed('FMklXRrTF2Jp');
      logInfo(`step2 succeed("FMklXRrTF2Jp"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : FMklXRrTF2Jp');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : FMklXRrTF2Jp');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0173
     * @tc.name      RequestAddForm_FormRequestStateFlow_0173
     * @tc.desc      FormRequestState call flow request > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0173 begin`);
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
      const step3: string = subject.fail('4');
      logInfo(`step3 fail("4"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : 4');
      logInfo(`request>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 4');
      logInfo(`request>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0174
     * @tc.name      RequestAddForm_FormRequestStateFlow_0174
     * @tc.desc      FormRequestState call flow fail > succeed > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0174 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('Fn9ncPZjxyUs');
      logInfo(`step1 fail("Fn9ncPZjxyUs"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : Fn9ncPZjxyUs');
      const step2: string = subject.succeed('H7dK');
      logInfo(`step2 succeed("H7dK"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : H7dK');
      const step3: string = subject.fail('wATCoH');
      logInfo(`step3 fail("wATCoH"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : wATCoH');
      const step4: string = subject.succeed('zJqWwM4');
      logInfo(`step4 succeed("zJqWwM4"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : zJqWwM4');
      logInfo(`fail>succeed>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : zJqWwM4');
      logInfo(`fail>succeed>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0175
     * @tc.name      RequestAddForm_FormRequestStateFlow_0175
     * @tc.desc      FormRequestState call flow fail > fail > fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0175 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('N');
      logInfo(`step1 fail("N"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : N');
      const step2: string = subject.fail('1oXfxb6r9s');
      logInfo(`step2 fail("1oXfxb6r9s"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 1oXfxb6r9s');
      const step3: string = subject.fail('a09');
      logInfo(`step3 fail("a09"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : a09');
      const step4: string = subject.succeed('xi4');
      logInfo(`step4 succeed("xi4"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : xi4');
      const step5: string = subject.request(false);
      logInfo(`step5 request(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(176);
      logInfo(`step5 request(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(false): step5.substring(144)=${step5.substring(144)}`);
      expect(step5.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`fail>fail>fail>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>fail>fail>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>fail>fail>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xi4');
      logInfo(`fail>fail>fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0176
     * @tc.name      RequestAddForm_FormRequestStateFlow_0176
     * @tc.desc      FormRequestState call flow fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0176 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('k');
      logInfo(`step1 fail("k"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : k');
      const step2: string = subject.fail('bl8gY');
      logInfo(`step2 fail("bl8gY"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : bl8gY');
      const step3: string = subject.succeed('3');
      logInfo(`step3 succeed("3"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 3');
      logInfo(`fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3');
      logInfo(`fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0177
     * @tc.name      RequestAddForm_FormRequestStateFlow_0177
     * @tc.desc      FormRequestState call flow request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0177 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('uRaGiSN');
      logInfo(`step2 succeed("uRaGiSN"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0178
     * @tc.name      RequestAddForm_FormRequestStateFlow_0178
     * @tc.desc      FormRequestState call flow fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0178 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xSample Title 123');
      logInfo(`step1 fail("xSample Title 123"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xSample Title 123');
      const step2: string = subject.fail('b');
      logInfo(`step2 fail("b"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : b');
      const step3: string = subject.succeed('uRaGiSN');
      logInfo(`step3 succeed("uRaGiSN"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0179
     * @tc.name      RequestAddForm_FormRequestStateFlow_0179
     * @tc.desc      FormRequestState call flow fail > fail > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0179 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('NtEWY8iB');
      logInfo(`step1 fail("NtEWY8iB"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : NtEWY8iB');
      const step2: string = subject.fail(' A ');
      logInfo(`step2 fail(" A "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  A ');
      const step3: string = subject.succeed('Hv');
      logInfo(`step3 succeed("Hv"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : Hv');
      const step4: string = subject.fail('o9S5dys');
      logInfo(`step4 fail("o9S5dys"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : o9S5dys');
      logInfo(`fail>fail>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : o9S5dys');
      logInfo(`fail>fail>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0180
     * @tc.name      RequestAddForm_FormRequestStateFlow_0180
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0180 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('AA');
      logInfo(`step1 fail("AA"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : AA');
      const step2: string = subject.succeed('lcgeja');
      logInfo(`step2 succeed("lcgeja"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : lcgeja');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lcgeja');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0181
     * @tc.name      RequestAddForm_FormRequestStateFlow_0181
     * @tc.desc      FormRequestState call flow succeed > fail > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0181 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('v2a');
      logInfo(`step1 succeed("v2a"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : v2a');
      const step2: string = subject.fail('k');
      logInfo(`step2 fail("k"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : k');
      const step3: string = subject.fail('l6');
      logInfo(`step3 fail("l6"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : l6');
      const step4: string = subject.fail('gCRs');
      logInfo(`step4 fail("gCRs"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : gCRs');
      logInfo(`succeed>fail>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : gCRs');
      logInfo(`succeed>fail>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0182
     * @tc.name      RequestAddForm_FormRequestStateFlow_0182
     * @tc.desc      FormRequestState call flow fail > succeed > request > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0182 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail(' A ');
      logInfo(`step1 fail(" A "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed :  A ');
      const step2: string = subject.succeed('S');
      logInfo(`step2 succeed("S"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : S');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('czEO8MXkfwT');
      logInfo(`step4 succeed("czEO8MXkfwT"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : czEO8MXkfwT');
      const step5: string = subject.succeed('Ce3pzpg');
      logInfo(`step5 succeed("Ce3pzpg"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`fail>succeed>request>succeed>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>succeed>request>succeed>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>succeed>request>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`fail>succeed>request>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`fail>succeed>request>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0183
     * @tc.name      RequestAddForm_FormRequestStateFlow_0183
     * @tc.desc      FormRequestState call flow request > succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0183 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('2');
      logInfo(`step2 succeed("2"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 2');
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
      logInfo(`request>succeed>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>succeed>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>succeed>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 2');
      logInfo(`request>succeed>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0184
     * @tc.name      RequestAddForm_FormRequestStateFlow_0184
     * @tc.desc      FormRequestState call flow succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0184 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('5VVgVT');
      logInfo(`step1 succeed("5VVgVT"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : 5VVgVT');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail('iLZC9mFaV');
      logInfo(`step3 fail("iLZC9mFaV"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : iLZC9mFaV');
      logInfo(`succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : iLZC9mFaV');
      logInfo(`succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0185
     * @tc.name      RequestAddForm_FormRequestStateFlow_0185
     * @tc.desc      FormRequestState call flow request > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0185 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('X837J');
      logInfo(`step2 fail("X837J"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : X837J');
      const step3: string = subject.succeed('tt');
      logInfo(`step3 succeed("tt"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : tt');
      logInfo(`request>fail>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : tt');
      logInfo(`request>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0186
     * @tc.name      RequestAddForm_FormRequestStateFlow_0186
     * @tc.desc      FormRequestState call flow request > request > succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0186 begin`);
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
      const step3: string = subject.succeed('C5X5iM3O9ZH');
      logInfo(`step3 succeed("C5X5iM3O9ZH"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : C5X5iM3O9ZH');
      const step4: string = subject.request(true);
      logInfo(`step4 request(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(174);
      logInfo(`step4 request(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(true): step4.substring(142)=${step4.substring(142)}`);
      expect(step4.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.fail('b');
      logInfo(`step5 fail("b"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : b');
      logInfo(`request>request>succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`request>request>succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`request>request>succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : b');
      logInfo(`request>request>succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>request>succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0187
     * @tc.name      RequestAddForm_FormRequestStateFlow_0187
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0187 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('Hello');
      logInfo(`step1 fail("Hello"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : Hello');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0188
     * @tc.name      RequestAddForm_FormRequestStateFlow_0188
     * @tc.desc      FormRequestState call flow succeed > succeed > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0188 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('x123');
      logInfo(`step1 succeed("x123"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : x123');
      const step2: string = subject.succeed(' ');
      logInfo(`step2 succeed(" "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success :  ');
      const step3: string = subject.succeed('5Pi');
      logInfo(`step3 succeed("5Pi"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 5Pi');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>succeed>succeed>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>succeed>succeed>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>succeed>succeed>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 5Pi');
      logInfo(`succeed>succeed>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0189
     * @tc.name      RequestAddForm_FormRequestStateFlow_0189
     * @tc.desc      FormRequestState call flow fail > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0189 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('lryGn5oK85X');
      logInfo(`step1 fail("lryGn5oK85X"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : lryGn5oK85X');
      const step2: string = subject.request(false);
      logInfo(`step2 request(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(176);
      logInfo(`step2 request(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(false): step2.substring(144)=${step2.substring(144)}`);
      expect(step2.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`step3 fail(" ?? "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`fail>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`fail>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0190
     * @tc.name      RequestAddForm_FormRequestStateFlow_0190
     * @tc.desc      FormRequestState call flow fail > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0190 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('\u4e2d\u6587_1');
      logInfo(`step1 fail("??_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      const step2: string = subject.fail('vvIL9Oy5M');
      logInfo(`step2 fail("vvIL9Oy5M"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : vvIL9Oy5M');
      const step3: string = subject.fail('LTJuRROZ5tI');
      logInfo(`step3 fail("LTJuRROZ5tI"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : LTJuRROZ5tI');
      logInfo(`fail>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : LTJuRROZ5tI');
      logInfo(`fail>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0191
     * @tc.name      RequestAddForm_FormRequestStateFlow_0191
     * @tc.desc      FormRequestState call flow request > succeed > request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0191 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('dNkgb5s8');
      logInfo(`step2 succeed("dNkgb5s8"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : dNkgb5s8');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.fail('Hello World_1');
      logInfo(`step4 fail("Hello World_1"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : Hello World_1');
      logInfo(`request>succeed>request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>succeed>request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>succeed>request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello World_1');
      logInfo(`request>succeed>request>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`request>succeed>request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0192
     * @tc.name      RequestAddForm_FormRequestStateFlow_0192
     * @tc.desc      FormRequestState call flow fail > succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0192 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('w');
      logInfo(`step1 fail("w"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : w');
      const step2: string = subject.succeed('X');
      logInfo(`step2 succeed("X"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : X');
      const step3: string = subject.succeed('qWxr');
      logInfo(`step3 succeed("qWxr"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : qWxr');
      logInfo(`fail>succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : qWxr');
      logInfo(`fail>succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0193
     * @tc.name      RequestAddForm_FormRequestStateFlow_0193
     * @tc.desc      FormRequestState call flow fail > succeed > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0193 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('bnS2SIBm1PUb');
      logInfo(`step1 fail("bnS2SIBm1PUb"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : bnS2SIBm1PUb');
      const step2: string = subject.succeed('5VVgVT');
      logInfo(`step2 succeed("5VVgVT"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : 5VVgVT');
      const step3: string = subject.fail('htP6uojaY');
      logInfo(`step3 fail("htP6uojaY"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : htP6uojaY');
      const step4: string = subject.fail('aa');
      logInfo(`step4 fail("aa"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : aa');
      logInfo(`fail>succeed>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : aa');
      logInfo(`fail>succeed>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0194
     * @tc.name      RequestAddForm_FormRequestStateFlow_0194
     * @tc.desc      FormRequestState call flow fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0194 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('XwartGyB');
      logInfo(`step1 fail("XwartGyB"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : XwartGyB');
      const step2: string = subject.fail(' a ');
      logInfo(`step2 fail(" a "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed :  a ');
      logInfo(`fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  a ');
      logInfo(`fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0195
     * @tc.name      RequestAddForm_FormRequestStateFlow_0195
     * @tc.desc      FormRequestState call flow fail > fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0195 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('abc');
      logInfo(`step1 fail("abc"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : abc');
      const step2: string = subject.fail('PQt5CuQOl');
      logInfo(`step2 fail("PQt5CuQOl"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : PQt5CuQOl');
      const step3: string = subject.succeed('X');
      logInfo(`step3 succeed("X"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : X');
      logInfo(`fail>fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : X');
      logInfo(`fail>fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0196
     * @tc.name      RequestAddForm_FormRequestStateFlow_0196
     * @tc.desc      FormRequestState call flow succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0196 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('SKmtxyC');
      logInfo(`step1 succeed("SKmtxyC"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : SKmtxyC');
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
      logInfo(`succeed>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`succeed>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : SKmtxyC');
      logInfo(`succeed>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0197
     * @tc.name      RequestAddForm_FormRequestStateFlow_0197
     * @tc.desc      FormRequestState call flow fail > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0197 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('yDtsHsIX');
      logInfo(`step1 fail("yDtsHsIX"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : yDtsHsIX');
      const step2: string = subject.succeed(' a ');
      logInfo(`step2 succeed(" a "): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success :  a ');
      logInfo(`fail>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  a ');
      logInfo(`fail>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0198
     * @tc.name      RequestAddForm_FormRequestStateFlow_0198
     * @tc.desc      FormRequestState call flow fail > succeed > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0198 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('etO');
      logInfo(`step1 fail("etO"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : etO');
      const step2: string = subject.succeed('SVSfErFh5');
      logInfo(`step2 succeed("SVSfErFh5"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : SVSfErFh5');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm success : SVSfErFh5');
      logInfo(`fail>succeed>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>succeed>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0199
     * @tc.name      RequestAddForm_FormRequestStateFlow_0199
     * @tc.desc      FormRequestState call flow succeed > fail > succeed > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0199 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('c94Np');
      logInfo(`step1 succeed("c94Np"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : c94Np');
      const step2: string = subject.fail('Hello World_1');
      logInfo(`step2 fail("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : Hello World_1');
      const step3: string = subject.succeed('7rqsK');
      logInfo(`step3 succeed("7rqsK"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : 7rqsK');
      const step4: string = subject.request(false);
      logInfo(`step4 request(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(176);
      logInfo(`step4 request(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step4 request(false): step4.substring(144)=${step4.substring(144)}`);
      expect(step4.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step5: string = subject.request(true);
      logInfo(`step5 request(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(174);
      logInfo(`step5 request(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step5 request(true): step5.substring(142)=${step5.substring(142)}`);
      expect(step5.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`succeed>fail>succeed>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`succeed>fail>succeed>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>fail>succeed>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 7rqsK');
      logInfo(`succeed>fail>succeed>request>request final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`succeed>fail>succeed>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0200
     * @tc.name      RequestAddForm_FormRequestStateFlow_0200
     * @tc.desc      FormRequestState call flow request > succeed > request > succeed > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0200 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(true);
      logInfo(`step1 request(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(174);
      logInfo(`step1 request(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(true): step1.substring(142)=${step1.substring(142)}`);
      expect(step1.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.succeed('CuW6');
      logInfo(`step2 succeed("CuW6"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : CuW6');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('TC');
      logInfo(`step4 succeed("TC"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : TC');
      const step5: string = subject.fail('NqImHRIp');
      logInfo(`step5 fail("NqImHRIp"): step5=${step5}`);
      expect(step5).assertEqual('RequestPublishForm failed : NqImHRIp');
      logInfo(`request>succeed>request>succeed>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`request>succeed>request>succeed>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>succeed>request>succeed>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : NqImHRIp');
      logInfo(`request>succeed>request>succeed>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`request>succeed>request>succeed>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0201
     * @tc.name      RequestAddForm_FormRequestStateFlow_0201
     * @tc.desc      FormRequestState call flow succeed > request > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0201 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('wxir');
      logInfo(`step1 succeed("wxir"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : wxir');
      const step2: string = subject.request(true);
      logInfo(`step2 request(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(174);
      logInfo(`step2 request(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step2 request(true): step2.substring(142)=${step2.substring(142)}`);
      expect(step2.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      const step3: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`step3 fail(" ?? "): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      const step4: string = subject.fail('76');
      logInfo(`step4 fail("76"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : 76');
      logInfo(`succeed>request>fail>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`succeed>request>fail>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`succeed>request>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 76');
      logInfo(`succeed>request>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>request>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0202
     * @tc.name      RequestAddForm_FormRequestStateFlow_0202
     * @tc.desc      FormRequestState call flow fail > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0202 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('xabc');
      logInfo(`step1 fail("xabc"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : xabc');
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
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`fail>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0203
     * @tc.name      RequestAddForm_FormRequestStateFlow_0203
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0203 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('Hello World_1');
      logInfo(`step1 succeed("Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : Hello World_1');
      const step2: string = subject.succeed('lC0a');
      logInfo(`step2 succeed("lC0a"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : lC0a');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lC0a');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0204
     * @tc.name      RequestAddForm_FormRequestStateFlow_0204
     * @tc.desc      FormRequestState call flow fail > succeed > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0204 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('dM5z71ef');
      logInfo(`step1 fail("dM5z71ef"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : dM5z71ef');
      const step2: string = subject.succeed('i0rw7FVk');
      logInfo(`step2 succeed("i0rw7FVk"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : i0rw7FVk');
      const step3: string = subject.request(false);
      logInfo(`step3 request(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(176);
      logInfo(`step3 request(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step3 request(false): step3.substring(144)=${step3.substring(144)}`);
      expect(step3.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step4: string = subject.succeed('lC0a');
      logInfo(`step4 succeed("lC0a"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm success : lC0a');
      logInfo(`fail>succeed>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>succeed>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>succeed>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lC0a');
      logInfo(`fail>succeed>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`fail>succeed>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0205
     * @tc.name      RequestAddForm_FormRequestStateFlow_0205
     * @tc.desc      FormRequestState call flow fail > request > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0205 begin`);
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
      const step3: string = subject.succeed('lmdG2u5cjoTs');
      logInfo(`step3 succeed("lmdG2u5cjoTs"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`fail>request>succeed final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`fail>request>succeed final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`fail>request>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`fail>request>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`fail>request>succeed final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0206
     * @tc.name      RequestAddForm_FormRequestStateFlow_0206
     * @tc.desc      FormRequestState call flow succeed > fail > fail > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0206 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed('hht5M');
      logInfo(`step1 succeed("hht5M"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success : hht5M');
      const step2: string = subject.fail('VC3F8Kfju7');
      logInfo(`step2 fail("VC3F8Kfju7"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : VC3F8Kfju7');
      const step3: string = subject.fail('fVP9EV3');
      logInfo(`step3 fail("fVP9EV3"): step3=${step3}`);
      expect(step3).assertEqual('RequestPublishForm failed : fVP9EV3');
      const step4: string = subject.fail('gCRs');
      logInfo(`step4 fail("gCRs"): step4=${step4}`);
      expect(step4).assertEqual('RequestPublishForm failed : gCRs');
      logInfo(`succeed>fail>fail>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : gCRs');
      logInfo(`succeed>fail>fail>fail final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`succeed>fail>fail>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(3);
      logInfo(`${BUNDLE}FormRequestStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0207
     * @tc.name      RequestAddForm_FormRequestStateFlow_0207
     * @tc.desc      FormRequestState call flow request > fail keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0207 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.request(false);
      logInfo(`step1 request(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(176);
      logInfo(`step1 request(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`step1 request(false): step1.substring(144)=${step1.substring(144)}`);
      expect(step1.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      const step2: string = subject.fail('MrYPQo');
      logInfo(`step2 fail("MrYPQo"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : MrYPQo');
      logInfo(`request>fail final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request>fail final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`request>fail final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : MrYPQo');
      logInfo(`request>fail final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0208
     * @tc.name      RequestAddForm_FormRequestStateFlow_0208
     * @tc.desc      FormRequestState call flow succeed > succeed keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0208 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.succeed(' ');
      logInfo(`step1 succeed(" "): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm success :  ');
      const step2: string = subject.succeed('Ce3pzpg');
      logInfo(`step2 succeed("Ce3pzpg"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`succeed>succeed final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`succeed>succeed final: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FLOW_0209
     * @tc.name      RequestAddForm_FormRequestStateFlow_0209
     * @tc.desc      FormRequestState call flow fail > fail > request > request keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFlow_0209 begin`);
      const subject: FormRequestState = new FormRequestState();
      const step1: string = subject.fail('kCl5jCtN');
      logInfo(`step1 fail("kCl5jCtN"): step1=${step1}`);
      expect(step1).assertEqual('RequestPublishForm failed : kCl5jCtN');
      const step2: string = subject.fail('123_1');
      logInfo(`step2 fail("123_1"): step2=${step2}`);
      expect(step2).assertEqual('RequestPublishForm failed : 123_1');
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
      logInfo(`fail>fail>request>request final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`fail>fail>request>request final: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`fail>fail>request>request final: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 123_1');
      logInfo(`fail>fail>request>request final: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(2);
      logInfo(`${BUNDLE}FormRequestStateFlow_0209 end`);
    });
  });
}
