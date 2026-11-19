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
import { modalMessageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for modalMessageOf (83 cases). */
export default function modalMessageOfTest(): void {
  describe('ModalMessageOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0001
     * @tc.name      UIExtensionSamples_ModalMessageOf_0001
     * @tc.desc      modalMessageOf(code=0, message="requestModalUIExtension succeed.") returns "requestModalUIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ModalMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0001 begin`);
      const actual: string = modalMessageOf(0, 'requestModalUIExtension succeed.');
      logInfo(`modalMessageOf(code=0, message="requestMo...: actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension succeed.');
      logInfo(`${BUNDLE}ModalMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0002
     * @tc.name      UIExtensionSamples_ModalMessageOf_0002
     * @tc.desc      modalMessageOf(code=200, message="requestModalUIExtension succeed.") returns "requestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ModalMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0002 begin`);
      const actual: string = modalMessageOf(200, 'requestModalUIExtension succeed.');
      logInfo(`modalMessageOf(code=200, message="request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('requestModalUIExtension succeed.');
      logInfo(`${BUNDLE}ModalMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0003
     * @tc.name      UIExtensionSamples_ModalMessageOf_0003
     * @tc.desc      modalMessageOf(code=200, message="REQUESTMODALUIEXTENSION SUCCEED.") returns "REQUESTMODALUIEXTE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0003 begin`);
      const actual: string = modalMessageOf(200, 'REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`modalMessageOf(code=200, message="REQUEST...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=200, message="REQUEST...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="REQUEST...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`${BUNDLE}ModalMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0004
     * @tc.name      UIExtensionSamples_ModalMessageOf_0004
     * @tc.desc      modalMessageOf(code=200, message="requestModalUIExtension succeed") returns " requestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0004 begin`);
      const actual: string = modalMessageOf(200, 'requestModalUIExtension succeed');
      logInfo(`modalMessageOf(code=200, message="request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual(' requestModalUIExtension succeed');
      logInfo(`${BUNDLE}ModalMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0005
     * @tc.name      UIExtensionSamples_ModalMessageOf_0005
     * @tc.desc      modalMessageOf(code=200, message="requestModalUIExtension succeed.x") returns "equestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0005 begin`);
      const actual: string = modalMessageOf(200, 'requestModalUIExtension succeed.x');
      logInfo(`modalMessageOf(code=200, message="request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('equestModalUIExtension succeed.x');
      logInfo(`${BUNDLE}ModalMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0006
     * @tc.name      UIExtensionSamples_ModalMessageOf_0006
     * @tc.desc      modalMessageOf(code=200, message="Hello") returns "requestModalUIExtension failed, code is 200, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0006 begin`);
      const actual: string = modalMessageOf(200, 'Hello');
      logInfo(`modalMessageOf(code=200, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0007
     * @tc.name      UIExtensionSamples_ModalMessageOf_0007
     * @tc.desc      modalMessageOf(code=200, message="hello world") returns "e is 200, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0007 begin`);
      const actual: string = modalMessageOf(200, 'hello world');
      logInfo(`modalMessageOf(code=200, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=200, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 200, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0008
     * @tc.name      UIExtensionSamples_ModalMessageOf_0008
     * @tc.desc      modalMessageOf(code=200, message="") returns "requestModalUIExtension failed, code is 200, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0008 begin`);
      const actual: string = modalMessageOf(200, '');
      logInfo(`modalMessageOf(code=200, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0009
     * @tc.name      UIExtensionSamples_ModalMessageOf_0009
     * @tc.desc      modalMessageOf(code=200, message=" ") returns "requestModalUIExtension failed, code is 200, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0009 begin`);
      const actual: string = modalMessageOf(200, ' ');
      logInfo(`modalMessageOf(code=200, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0010
     * @tc.name      UIExtensionSamples_ModalMessageOf_0010
     * @tc.desc      modalMessageOf(code=200, message="A") returns "requestModalUIExtension failed, code is 200, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0010 begin`);
      const actual: string = modalMessageOf(200, 'A');
      logInfo(`modalMessageOf(code=200, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0011
     * @tc.name      UIExtensionSamples_ModalMessageOf_0011
     * @tc.desc      modalMessageOf(code=200, message="Sample Title 123") returns "200, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0011 begin`);
      const actual: string = modalMessageOf(200, 'Sample Title 123');
      logInfo(`modalMessageOf(code=200, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=200, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('200, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0012
     * @tc.name      UIExtensionSamples_ModalMessageOf_0012
     * @tc.desc      modalMessageOf(code=200, message="??") returns ", code is 200, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0012 begin`);
      const actual: string = modalMessageOf(200, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=200, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=200, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 200, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0013
     * @tc.name      UIExtensionSamples_ModalMessageOf_0013
     * @tc.desc      modalMessageOf(code=200, message="a") returns "requestModalUIExtension failed, code is 200, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0013 begin`);
      const actual: string = modalMessageOf(200, 'a');
      logInfo(`modalMessageOf(code=200, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0014
     * @tc.name      UIExtensionSamples_ModalMessageOf_0014
     * @tc.desc      modalMessageOf(code=200, message="abc") returns "requestModalUIExtension failed, code is 200, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0014 begin`);
      const actual: string = modalMessageOf(200, 'abc');
      logInfo(`modalMessageOf(code=200, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0015
     * @tc.name      UIExtensionSamples_ModalMessageOf_0015
     * @tc.desc      modalMessageOf(code=200, message="Hello World") returns "e is 200, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0015 begin`);
      const actual: string = modalMessageOf(200, 'Hello World');
      logInfo(`modalMessageOf(code=200, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=200, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 200, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0016
     * @tc.name      UIExtensionSamples_ModalMessageOf_0016
     * @tc.desc      modalMessageOf(code=200, message="123") returns "requestModalUIExtension failed, code is 200, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0016 begin`);
      const actual: string = modalMessageOf(200, '123');
      logInfo(`modalMessageOf(code=200, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 200, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0017
     * @tc.name      UIExtensionSamples_ModalMessageOf_0017
     * @tc.desc      modalMessageOf(code=200, message=" requestModalUIExtension succeed. ") returns "equestModalUIExt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0017 begin`);
      const actual: string = modalMessageOf(200, ' requestModalUIExtension succeed. ');
      logInfo(`modalMessageOf(code=200, message=" reques...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`modalMessageOf(code=200, message=" reques...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message=" reques...: actual.substring(58)=${actual.substring(58)}`);
      expect(actual.substring(58)).assertEqual('equestModalUIExtension succeed. ');
      logInfo(`${BUNDLE}ModalMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0018
     * @tc.name      UIExtensionSamples_ModalMessageOf_0018
     * @tc.desc      modalMessageOf(code=200, message="requestModalUIExtension succeed._1") returns "questModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0018 begin`);
      const actual: string = modalMessageOf(200, 'requestModalUIExtension succeed._1');
      logInfo(`modalMessageOf(code=200, message="request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(58)=${actual.substring(58)}`);
      expect(actual.substring(58)).assertEqual('questModalUIExtension succeed._1');
      logInfo(`${BUNDLE}ModalMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0019
     * @tc.name      UIExtensionSamples_ModalMessageOf_0019
     * @tc.desc      modalMessageOf(code=200, message="xrequestModalUIExtension succeed.") returns "requestModalUIExt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0019 begin`);
      const actual: string = modalMessageOf(200, 'xrequestModalUIExtension succeed.');
      logInfo(`modalMessageOf(code=200, message="xreques...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=200, message="xreques...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="xreques...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('requestModalUIExtension succeed.');
      logInfo(`${BUNDLE}ModalMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0020
     * @tc.name      UIExtensionSamples_ModalMessageOf_0020
     * @tc.desc      modalMessageOf(code=200, message=" REQUESTMODALUIEXTENSION SUCCEED. ") returns "EQUESTMODALUIEXT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0020 begin`);
      const actual: string = modalMessageOf(200, ' REQUESTMODALUIEXTENSION SUCCEED. ');
      logInfo(`modalMessageOf(code=200, message=" REQUES...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`modalMessageOf(code=200, message=" REQUES...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message=" REQUES...: actual.substring(58)=${actual.substring(58)}`);
      expect(actual.substring(58)).assertEqual('EQUESTMODALUIEXTENSION SUCCEED. ');
      logInfo(`${BUNDLE}ModalMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0021
     * @tc.name      UIExtensionSamples_ModalMessageOf_0021
     * @tc.desc      modalMessageOf(code=200, message="REQUESTMODALUIEXTENSION SUCCEED._1") returns "QUESTMODALUIEXTE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0021 begin`);
      const actual: string = modalMessageOf(200, 'REQUESTMODALUIEXTENSION SUCCEED._1');
      logInfo(`modalMessageOf(code=200, message="REQUEST...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`modalMessageOf(code=200, message="REQUEST...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="REQUEST...: actual.substring(58)=${actual.substring(58)}`);
      expect(actual.substring(58)).assertEqual('QUESTMODALUIEXTENSION SUCCEED._1');
      logInfo(`${BUNDLE}ModalMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0022
     * @tc.name      UIExtensionSamples_ModalMessageOf_0022
     * @tc.desc      modalMessageOf(code=200, message="xREQUESTMODALUIEXTENSION SUCCEED.") returns "REQUESTMODALUIEXT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0022 begin`);
      const actual: string = modalMessageOf(200, 'xREQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`modalMessageOf(code=200, message="xREQUES...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=200, message="xREQUES...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="xREQUES...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`${BUNDLE}ModalMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0023
     * @tc.name      UIExtensionSamples_ModalMessageOf_0023
     * @tc.desc      modalMessageOf(code=200, message=" requestModalUIExtension succeed ") returns "requestModalUIExt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0023 begin`);
      const actual: string = modalMessageOf(200, ' requestModalUIExtension succeed ');
      logInfo(`modalMessageOf(code=200, message=" reques...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=200, message=" reques...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message=" reques...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('requestModalUIExtension succeed ');
      logInfo(`${BUNDLE}ModalMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0024
     * @tc.name      UIExtensionSamples_ModalMessageOf_0024
     * @tc.desc      modalMessageOf(code=200, message="requestModalUIExtension succeed_1") returns "equestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0024 begin`);
      const actual: string = modalMessageOf(200, 'requestModalUIExtension succeed_1');
      logInfo(`modalMessageOf(code=200, message="request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="request...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('equestModalUIExtension succeed_1');
      logInfo(`${BUNDLE}ModalMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0025
     * @tc.name      UIExtensionSamples_ModalMessageOf_0025
     * @tc.desc      modalMessageOf(code=200, message="xrequestModalUIExtension succeed") returns "xrequestModalUIExt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0025 begin`);
      const actual: string = modalMessageOf(200, 'xrequestModalUIExtension succeed');
      logInfo(`modalMessageOf(code=200, message="xreques...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=200, message="xreques...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=200, message="xreques...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('xrequestModalUIExtension succeed');
      logInfo(`${BUNDLE}ModalMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0026
     * @tc.name      UIExtensionSamples_ModalMessageOf_0026
     * @tc.desc      modalMessageOf(code=-1, message="requestModalUIExtension succeed.") returns "requestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0026 begin`);
      const actual: string = modalMessageOf(-1, 'requestModalUIExtension succeed.');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual('requestModalUIExtension succeed.');
      logInfo(`${BUNDLE}ModalMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0027
     * @tc.name      UIExtensionSamples_ModalMessageOf_0027
     * @tc.desc      modalMessageOf(code=-1, message="REQUESTMODALUIEXTENSION SUCCEED.") returns "REQUESTMODALUIEXTEN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0027 begin`);
      const actual: string = modalMessageOf(-1, 'REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`modalMessageOf(code=-1, message="REQUESTM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=-1, message="REQUESTM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="REQUESTM...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual('REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`${BUNDLE}ModalMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0028
     * @tc.name      UIExtensionSamples_ModalMessageOf_0028
     * @tc.desc      modalMessageOf(code=-1, message="requestModalUIExtension succeed") returns " requestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0028 begin`);
      const actual: string = modalMessageOf(-1, 'requestModalUIExtension succeed');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual(' requestModalUIExtension succeed');
      logInfo(`${BUNDLE}ModalMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0029
     * @tc.name      UIExtensionSamples_ModalMessageOf_0029
     * @tc.desc      modalMessageOf(code=-1, message="requestModalUIExtension succeed.x") returns "equestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0029 begin`);
      const actual: string = modalMessageOf(-1, 'requestModalUIExtension succeed.x');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('equestModalUIExtension succeed.x');
      logInfo(`${BUNDLE}ModalMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0030
     * @tc.name      UIExtensionSamples_ModalMessageOf_0030
     * @tc.desc      modalMessageOf(code=-1, message="Hello") returns "requestModalUIExtension failed, code is -1, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0030 begin`);
      const actual: string = modalMessageOf(-1, 'Hello');
      logInfo(`modalMessageOf(code=-1, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0031
     * @tc.name      UIExtensionSamples_ModalMessageOf_0031
     * @tc.desc      modalMessageOf(code=-1, message="hello world") returns "de is -1, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0031 begin`);
      const actual: string = modalMessageOf(-1, 'hello world');
      logInfo(`modalMessageOf(code=-1, message="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=-1, message="hello wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="hello wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is -1, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0032
     * @tc.name      UIExtensionSamples_ModalMessageOf_0032
     * @tc.desc      modalMessageOf(code=-1, message="") returns "requestModalUIExtension failed, code is -1, message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0032 begin`);
      const actual: string = modalMessageOf(-1, '');
      logInfo(`modalMessageOf(code=-1, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0033
     * @tc.name      UIExtensionSamples_ModalMessageOf_0033
     * @tc.desc      modalMessageOf(code=-1, message=" ") returns "requestModalUIExtension failed, code is -1, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0033 begin`);
      const actual: string = modalMessageOf(-1, ' ');
      logInfo(`modalMessageOf(code=-1, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0034
     * @tc.name      UIExtensionSamples_ModalMessageOf_0034
     * @tc.desc      modalMessageOf(code=-1, message="A") returns "requestModalUIExtension failed, code is -1, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0034 begin`);
      const actual: string = modalMessageOf(-1, 'A');
      logInfo(`modalMessageOf(code=-1, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0035
     * @tc.name      UIExtensionSamples_ModalMessageOf_0035
     * @tc.desc      modalMessageOf(code=-1, message="Sample Title 123") returns " -1, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0035 begin`);
      const actual: string = modalMessageOf(-1, 'Sample Title 123');
      logInfo(`modalMessageOf(code=-1, message="Sample T...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`modalMessageOf(code=-1, message="Sample T...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="Sample T...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' -1, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0036
     * @tc.name      UIExtensionSamples_ModalMessageOf_0036
     * @tc.desc      modalMessageOf(code=-1, message="??") returns "d, code is -1, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0036 begin`);
      const actual: string = modalMessageOf(-1, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=-1, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(57);
      logInfo(`modalMessageOf(code=-1, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="??"): actual.substring(29)=${actual.substring(29)}`);
      expect(actual.substring(29)).assertEqual('d, code is -1, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0037
     * @tc.name      UIExtensionSamples_ModalMessageOf_0037
     * @tc.desc      modalMessageOf(code=-1, message="a") returns "requestModalUIExtension failed, code is -1, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0037 begin`);
      const actual: string = modalMessageOf(-1, 'a');
      logInfo(`modalMessageOf(code=-1, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0038
     * @tc.name      UIExtensionSamples_ModalMessageOf_0038
     * @tc.desc      modalMessageOf(code=-1, message="abc") returns "requestModalUIExtension failed, code is -1, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0038 begin`);
      const actual: string = modalMessageOf(-1, 'abc');
      logInfo(`modalMessageOf(code=-1, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0039
     * @tc.name      UIExtensionSamples_ModalMessageOf_0039
     * @tc.desc      modalMessageOf(code=-1, message="Hello World") returns "de is -1, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0039 begin`);
      const actual: string = modalMessageOf(-1, 'Hello World');
      logInfo(`modalMessageOf(code=-1, message="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=-1, message="Hello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="Hello Wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is -1, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0040
     * @tc.name      UIExtensionSamples_ModalMessageOf_0040
     * @tc.desc      modalMessageOf(code=-1, message="123") returns "requestModalUIExtension failed, code is -1, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0040 begin`);
      const actual: string = modalMessageOf(-1, '123');
      logInfo(`modalMessageOf(code=-1, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is -1, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0041
     * @tc.name      UIExtensionSamples_ModalMessageOf_0041
     * @tc.desc      modalMessageOf(code=-1, message=" requestModalUIExtension succeed. ") returns "equestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0041 begin`);
      const actual: string = modalMessageOf(-1, ' requestModalUIExtension succeed. ');
      logInfo(`modalMessageOf(code=-1, message=" request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=-1, message=" request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message=" request...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('equestModalUIExtension succeed. ');
      logInfo(`${BUNDLE}ModalMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0042
     * @tc.name      UIExtensionSamples_ModalMessageOf_0042
     * @tc.desc      modalMessageOf(code=-1, message="requestModalUIExtension succeed._1") returns "questModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0042 begin`);
      const actual: string = modalMessageOf(-1, 'requestModalUIExtension succeed._1');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('questModalUIExtension succeed._1');
      logInfo(`${BUNDLE}ModalMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0043
     * @tc.name      UIExtensionSamples_ModalMessageOf_0043
     * @tc.desc      modalMessageOf(code=-1, message=" REQUESTMODALUIEXTENSION SUCCEED. ") returns "EQUESTMODALUIEXTE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0043 begin`);
      const actual: string = modalMessageOf(-1, ' REQUESTMODALUIEXTENSION SUCCEED. ');
      logInfo(`modalMessageOf(code=-1, message=" REQUEST...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=-1, message=" REQUEST...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message=" REQUEST...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('EQUESTMODALUIEXTENSION SUCCEED. ');
      logInfo(`${BUNDLE}ModalMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0044
     * @tc.name      UIExtensionSamples_ModalMessageOf_0044
     * @tc.desc      modalMessageOf(code=-1, message="REQUESTMODALUIEXTENSION SUCCEED._1") returns "QUESTMODALUIEXTEN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0044 begin`);
      const actual: string = modalMessageOf(-1, 'REQUESTMODALUIEXTENSION SUCCEED._1');
      logInfo(`modalMessageOf(code=-1, message="REQUESTM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`modalMessageOf(code=-1, message="REQUESTM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="REQUESTM...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('QUESTMODALUIEXTENSION SUCCEED._1');
      logInfo(`${BUNDLE}ModalMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0045
     * @tc.name      UIExtensionSamples_ModalMessageOf_0045
     * @tc.desc      modalMessageOf(code=-1, message=" requestModalUIExtension succeed ") returns "requestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0045 begin`);
      const actual: string = modalMessageOf(-1, ' requestModalUIExtension succeed ');
      logInfo(`modalMessageOf(code=-1, message=" request...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=-1, message=" request...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message=" request...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('requestModalUIExtension succeed ');
      logInfo(`${BUNDLE}ModalMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0046
     * @tc.name      UIExtensionSamples_ModalMessageOf_0046
     * @tc.desc      modalMessageOf(code=-1, message="requestModalUIExtension succeed_1") returns "equestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0046 begin`);
      const actual: string = modalMessageOf(-1, 'requestModalUIExtension succeed_1');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="requestM...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('equestModalUIExtension succeed_1');
      logInfo(`${BUNDLE}ModalMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0047
     * @tc.name      UIExtensionSamples_ModalMessageOf_0047
     * @tc.desc      modalMessageOf(code=-1, message="xrequestModalUIExtension succeed") returns "xrequestModalUIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0047 begin`);
      const actual: string = modalMessageOf(-1, 'xrequestModalUIExtension succeed');
      logInfo(`modalMessageOf(code=-1, message="xrequest...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=-1, message="xrequest...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=-1, message="xrequest...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual('xrequestModalUIExtension succeed');
      logInfo(`${BUNDLE}ModalMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0048
     * @tc.name      UIExtensionSamples_ModalMessageOf_0048
     * @tc.desc      modalMessageOf(code=1, message="requestModalUIExtension succeed.") returns "requestModalUIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0048 begin`);
      const actual: string = modalMessageOf(1, 'requestModalUIExtension succeed.');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual('requestModalUIExtension succeed.');
      logInfo(`${BUNDLE}ModalMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0049
     * @tc.name      UIExtensionSamples_ModalMessageOf_0049
     * @tc.desc      modalMessageOf(code=1, message="REQUESTMODALUIEXTENSION SUCCEED.") returns "REQUESTMODALUIEXTENS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0049 begin`);
      const actual: string = modalMessageOf(1, 'REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`modalMessageOf(code=1, message="REQUESTMO...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`modalMessageOf(code=1, message="REQUESTMO...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="REQUESTMO...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual('REQUESTMODALUIEXTENSION SUCCEED.');
      logInfo(`${BUNDLE}ModalMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0050
     * @tc.name      UIExtensionSamples_ModalMessageOf_0050
     * @tc.desc      modalMessageOf(code=1, message="requestModalUIExtension succeed") returns " requestModalUIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0050 begin`);
      const actual: string = modalMessageOf(1, 'requestModalUIExtension succeed');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual(' requestModalUIExtension succeed');
      logInfo(`${BUNDLE}ModalMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0051
     * @tc.name      UIExtensionSamples_ModalMessageOf_0051
     * @tc.desc      modalMessageOf(code=1, message="requestModalUIExtension succeed.x") returns "equestModalUIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0051 begin`);
      const actual: string = modalMessageOf(1, 'requestModalUIExtension succeed.x');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual('equestModalUIExtension succeed.x');
      logInfo(`${BUNDLE}ModalMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0052
     * @tc.name      UIExtensionSamples_ModalMessageOf_0052
     * @tc.desc      modalMessageOf(code=1, message="Hello") returns "requestModalUIExtension failed, code is 1, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0052 begin`);
      const actual: string = modalMessageOf(1, 'Hello');
      logInfo(`modalMessageOf(code=1, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0053
     * @tc.name      UIExtensionSamples_ModalMessageOf_0053
     * @tc.desc      modalMessageOf(code=1, message="hello world") returns "ode is 1, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0053 begin`);
      const actual: string = modalMessageOf(1, 'hello world');
      logInfo(`modalMessageOf(code=1, message="hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`modalMessageOf(code=1, message="hello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="hello wor...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ode is 1, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0054
     * @tc.name      UIExtensionSamples_ModalMessageOf_0054
     * @tc.desc      modalMessageOf(code=1, message="") returns "requestModalUIExtension failed, code is 1, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0054 begin`);
      const actual: string = modalMessageOf(1, '');
      logInfo(`modalMessageOf(code=1, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0055
     * @tc.name      UIExtensionSamples_ModalMessageOf_0055
     * @tc.desc      modalMessageOf(code=1, message=" ") returns "requestModalUIExtension failed, code is 1, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0055 begin`);
      const actual: string = modalMessageOf(1, ' ');
      logInfo(`modalMessageOf(code=1, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0056
     * @tc.name      UIExtensionSamples_ModalMessageOf_0056
     * @tc.desc      modalMessageOf(code=1, message="A") returns "requestModalUIExtension failed, code is 1, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0056 begin`);
      const actual: string = modalMessageOf(1, 'A');
      logInfo(`modalMessageOf(code=1, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0057
     * @tc.name      UIExtensionSamples_ModalMessageOf_0057
     * @tc.desc      modalMessageOf(code=1, message="Sample Title 123") returns "s 1, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0057 begin`);
      const actual: string = modalMessageOf(1, 'Sample Title 123');
      logInfo(`modalMessageOf(code=1, message="Sample Ti...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`modalMessageOf(code=1, message="Sample Ti...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="Sample Ti...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('s 1, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0058
     * @tc.name      UIExtensionSamples_ModalMessageOf_0058
     * @tc.desc      modalMessageOf(code=1, message="??") returns "ed, code is 1, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0058 begin`);
      const actual: string = modalMessageOf(1, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=1, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`modalMessageOf(code=1, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="??"): actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('ed, code is 1, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0059
     * @tc.name      UIExtensionSamples_ModalMessageOf_0059
     * @tc.desc      modalMessageOf(code=1, message="a") returns "requestModalUIExtension failed, code is 1, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0059 begin`);
      const actual: string = modalMessageOf(1, 'a');
      logInfo(`modalMessageOf(code=1, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0060
     * @tc.name      UIExtensionSamples_ModalMessageOf_0060
     * @tc.desc      modalMessageOf(code=1, message="abc") returns "requestModalUIExtension failed, code is 1, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0060 begin`);
      const actual: string = modalMessageOf(1, 'abc');
      logInfo(`modalMessageOf(code=1, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0061
     * @tc.name      UIExtensionSamples_ModalMessageOf_0061
     * @tc.desc      modalMessageOf(code=1, message="Hello World") returns "ode is 1, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0061 begin`);
      const actual: string = modalMessageOf(1, 'Hello World');
      logInfo(`modalMessageOf(code=1, message="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`modalMessageOf(code=1, message="Hello Wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="Hello Wor...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ode is 1, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0062
     * @tc.name      UIExtensionSamples_ModalMessageOf_0062
     * @tc.desc      modalMessageOf(code=1, message="123") returns "requestModalUIExtension failed, code is 1, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0062 begin`);
      const actual: string = modalMessageOf(1, '123');
      logInfo(`modalMessageOf(code=1, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 1, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0063
     * @tc.name      UIExtensionSamples_ModalMessageOf_0063
     * @tc.desc      modalMessageOf(code=1, message=" requestModalUIExtension succeed. ") returns "equestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0063 begin`);
      const actual: string = modalMessageOf(1, ' requestModalUIExtension succeed. ');
      logInfo(`modalMessageOf(code=1, message=" requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=1, message=" requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message=" requestM...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('equestModalUIExtension succeed. ');
      logInfo(`${BUNDLE}ModalMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0064
     * @tc.name      UIExtensionSamples_ModalMessageOf_0064
     * @tc.desc      modalMessageOf(code=1, message="requestModalUIExtension succeed._1") returns "questModalUIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0064 begin`);
      const actual: string = modalMessageOf(1, 'requestModalUIExtension succeed._1');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('questModalUIExtension succeed._1');
      logInfo(`${BUNDLE}ModalMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0065
     * @tc.name      UIExtensionSamples_ModalMessageOf_0065
     * @tc.desc      modalMessageOf(code=1, message=" REQUESTMODALUIEXTENSION SUCCEED. ") returns "EQUESTMODALUIEXTEN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0065 begin`);
      const actual: string = modalMessageOf(1, ' REQUESTMODALUIEXTENSION SUCCEED. ');
      logInfo(`modalMessageOf(code=1, message=" REQUESTM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=1, message=" REQUESTM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message=" REQUESTM...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('EQUESTMODALUIEXTENSION SUCCEED. ');
      logInfo(`${BUNDLE}ModalMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0066
     * @tc.name      UIExtensionSamples_ModalMessageOf_0066
     * @tc.desc      modalMessageOf(code=1, message="REQUESTMODALUIEXTENSION SUCCEED._1") returns "QUESTMODALUIEXTENS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0066 begin`);
      const actual: string = modalMessageOf(1, 'REQUESTMODALUIEXTENSION SUCCEED._1');
      logInfo(`modalMessageOf(code=1, message="REQUESTMO...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`modalMessageOf(code=1, message="REQUESTMO...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="REQUESTMO...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('QUESTMODALUIEXTENSION SUCCEED._1');
      logInfo(`${BUNDLE}ModalMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0067
     * @tc.name      UIExtensionSamples_ModalMessageOf_0067
     * @tc.desc      modalMessageOf(code=1, message=" requestModalUIExtension succeed ") returns "requestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0067 begin`);
      const actual: string = modalMessageOf(1, ' requestModalUIExtension succeed ');
      logInfo(`modalMessageOf(code=1, message=" requestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=1, message=" requestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message=" requestM...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual('requestModalUIExtension succeed ');
      logInfo(`${BUNDLE}ModalMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0068
     * @tc.name      UIExtensionSamples_ModalMessageOf_0068
     * @tc.desc      modalMessageOf(code=1, message="requestModalUIExtension succeed_1") returns "equestModalUIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ModalMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0068 begin`);
      const actual: string = modalMessageOf(1, 'requestModalUIExtension succeed_1');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="requestMo...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual('equestModalUIExtension succeed_1');
      logInfo(`${BUNDLE}ModalMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0069
     * @tc.name      UIExtensionSamples_ModalMessageOf_0069
     * @tc.desc      modalMessageOf(code=1, message="xrequestModalUIExtension succeed") returns "xrequestModalUIExten...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0069 begin`);
      const actual: string = modalMessageOf(1, 'xrequestModalUIExtension succeed');
      logInfo(`modalMessageOf(code=1, message="xrequestM...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`modalMessageOf(code=1, message="xrequestM...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=1, message="xrequestM...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual('xrequestModalUIExtension succeed');
      logInfo(`${BUNDLE}ModalMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0070
     * @tc.name      UIExtensionSamples_ModalMessageOf_0070
     * @tc.desc      modalMessageOf(code=401, message="Hello") returns "requestModalUIExtension failed, code is 401, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0070 begin`);
      const actual: string = modalMessageOf(401, 'Hello');
      logInfo(`modalMessageOf(code=401, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0071
     * @tc.name      UIExtensionSamples_ModalMessageOf_0071
     * @tc.desc      modalMessageOf(code=401, message="hello world") returns "e is 401, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0071 begin`);
      const actual: string = modalMessageOf(401, 'hello world');
      logInfo(`modalMessageOf(code=401, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=401, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=401, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 401, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0072
     * @tc.name      UIExtensionSamples_ModalMessageOf_0072
     * @tc.desc      modalMessageOf(code=401, message="") returns "requestModalUIExtension failed, code is 401, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0072 begin`);
      const actual: string = modalMessageOf(401, '');
      logInfo(`modalMessageOf(code=401, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0073
     * @tc.name      UIExtensionSamples_ModalMessageOf_0073
     * @tc.desc      modalMessageOf(code=401, message=" ") returns "requestModalUIExtension failed, code is 401, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0073 begin`);
      const actual: string = modalMessageOf(401, ' ');
      logInfo(`modalMessageOf(code=401, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0074
     * @tc.name      UIExtensionSamples_ModalMessageOf_0074
     * @tc.desc      modalMessageOf(code=401, message="A") returns "requestModalUIExtension failed, code is 401, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0074 begin`);
      const actual: string = modalMessageOf(401, 'A');
      logInfo(`modalMessageOf(code=401, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0075
     * @tc.name      UIExtensionSamples_ModalMessageOf_0075
     * @tc.desc      modalMessageOf(code=401, message="Sample Title 123") returns "401, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0075 begin`);
      const actual: string = modalMessageOf(401, 'Sample Title 123');
      logInfo(`modalMessageOf(code=401, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=401, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=401, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('401, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0076
     * @tc.name      UIExtensionSamples_ModalMessageOf_0076
     * @tc.desc      modalMessageOf(code=401, message="??") returns ", code is 401, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0076 begin`);
      const actual: string = modalMessageOf(401, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=401, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=401, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=401, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 401, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0077
     * @tc.name      UIExtensionSamples_ModalMessageOf_0077
     * @tc.desc      modalMessageOf(code=401, message="a") returns "requestModalUIExtension failed, code is 401, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0077 begin`);
      const actual: string = modalMessageOf(401, 'a');
      logInfo(`modalMessageOf(code=401, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0078
     * @tc.name      UIExtensionSamples_ModalMessageOf_0078
     * @tc.desc      modalMessageOf(code=401, message="abc") returns "requestModalUIExtension failed, code is 401, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0078 begin`);
      const actual: string = modalMessageOf(401, 'abc');
      logInfo(`modalMessageOf(code=401, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0079
     * @tc.name      UIExtensionSamples_ModalMessageOf_0079
     * @tc.desc      modalMessageOf(code=401, message="Hello World") returns "e is 401, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0079 begin`);
      const actual: string = modalMessageOf(401, 'Hello World');
      logInfo(`modalMessageOf(code=401, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=401, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=401, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 401, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0080
     * @tc.name      UIExtensionSamples_ModalMessageOf_0080
     * @tc.desc      modalMessageOf(code=401, message="123") returns "requestModalUIExtension failed, code is 401, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0080 begin`);
      const actual: string = modalMessageOf(401, '123');
      logInfo(`modalMessageOf(code=401, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 401, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0081
     * @tc.name      UIExtensionSamples_ModalMessageOf_0081
     * @tc.desc      modalMessageOf(code=404, message="Hello") returns "requestModalUIExtension failed, code is 404, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0081 begin`);
      const actual: string = modalMessageOf(404, 'Hello');
      logInfo(`modalMessageOf(code=404, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0082
     * @tc.name      UIExtensionSamples_ModalMessageOf_0082
     * @tc.desc      modalMessageOf(code=404, message="hello world") returns "e is 404, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0082 begin`);
      const actual: string = modalMessageOf(404, 'hello world');
      logInfo(`modalMessageOf(code=404, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=404, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=404, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 404, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0083
     * @tc.name      UIExtensionSamples_ModalMessageOf_0083
     * @tc.desc      modalMessageOf(code=404, message="") returns "requestModalUIExtension failed, code is 404, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0083 begin`);
      const actual: string = modalMessageOf(404, '');
      logInfo(`modalMessageOf(code=404, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0083 end`);
    });
  });
}
