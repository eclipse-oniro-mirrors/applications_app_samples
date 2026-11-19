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

import { beforeEachIt } from '@ohos/hypium';
import abilityTest from './Ability.test';
import uiExtensionSamplesTest from './UIExtensionSamplesCore.test';
import routeOfTest from './RouteOf.test';
import titleResourceOfTest from './TitleResourceOf.test';
import listKeyOfTest from './ListKeyOf.test';
import isListedPageTest from './IsListedPage.test';
import modalWantOfTest from './ModalWantOf.test';
import terminateResultOfTest from './TerminateResultOf.test';
import modalMessageOfTest from './ModalMessageOf.test';
import modalMessageOf2Test from './ModalMessageOf2.test';
import modalMessageOf3Test from './ModalMessageOf3.test';
import reportDrawnMessageOfTest from './ReportDrawnMessageOf.test';
import reportDrawnMessageOf2Test from './ReportDrawnMessageOf2.test';
import reportDrawnMessageOf3Test from './ReportDrawnMessageOf3.test';
import privacyModeMessageOfTest from './PrivacyModeMessageOf.test';
import windowProxyMessageOfTest from './WindowProxyMessageOf.test';
import windowProxyMessageOf2Test from './WindowProxyMessageOf2.test';
import startErrorMessageOfTest from './StartErrorMessageOf.test';
import startErrorMessageOf2Test from './StartErrorMessageOf2.test';
import startErrorMessageOf3Test from './StartErrorMessageOf3.test';
import startResultLogOfTest from './StartResultLogOf.test';
import startResultLogOf2Test from './StartResultLogOf2.test';
import startResultLogOf3Test from './StartResultLogOf3.test';
import openLinkLogOfTest from './OpenLinkLogOf.test';
import openLinkLogOf2Test from './OpenLinkLogOf2.test';
import openLinkLogOf3Test from './OpenLinkLogOf3.test';
import allowsBrowserFallbackTest from './AllowsBrowserFallback.test';
import sessionCreateLogOfTest from './SessionCreateLogOf.test';
import sessionCreateLogOf2Test from './SessionCreateLogOf2.test';
import sessionCreateLogOf3Test from './SessionCreateLogOf3.test';
import contentPageOfTest from './ContentPageOf.test';
import uiExtensionPageStateCtorTest from './UiExtensionPageStateCtor.test';
import uiExtensionPageStateOpenTest from './UiExtensionPageStateOpen.test';
import uiExtensionPageStateRequestModalTest from './UiExtensionPageStateRequestModal.test';
import uiExtensionPageStateRequestModal2Test from './UiExtensionPageStateRequestModal2.test';
import uiExtensionPageStateTerminateWithResultTest from './UiExtensionPageStateTerminateWithResult.test';
import uiExtensionPageStateSetPrivacyModeTest from './UiExtensionPageStateSetPrivacyMode.test';
import uiExtensionPageStateReportDrawnTest from './UiExtensionPageStateReportDrawn.test';
import uiExtensionPageStateReportDrawn2Test from './UiExtensionPageStateReportDrawn2.test';
import uiExtensionPageStateReportDrawn3Test from './UiExtensionPageStateReportDrawn3.test';
import uiExtensionPageStateFlowTest from './UiExtensionPageStateFlow.test';
import uiExtensionPageStateFlow2Test from './UiExtensionPageStateFlow2.test';
import uiExtensionPageStateFlow3Test from './UiExtensionPageStateFlow3.test';
import uiExtensionPageStateFlow4Test from './UiExtensionPageStateFlow4.test';
import uiExtensionPageStateFlow5Test from './UiExtensionPageStateFlow5.test';
import uiExtensionPageStateFlow6Test from './UiExtensionPageStateFlow6.test';
import uiExtensionPageStateFlow7Test from './UiExtensionPageStateFlow7.test';
import uiExtensionLogicConstantsTest from './UiExtensionLogicConstants.test';

function registerThreadYieldHook(): void {
  // 用例间用 1ms 定时器让出主线程，使 watchdog 检测任务得以调度，避免 THREAD_BLOCK_6S
  beforeEachIt(async (): Promise<void> => {
    await new Promise<void>((resolve: () => void) => {
      setTimeout(() => {
        resolve();
      }, 1);
    });
  });
}

export default function testsuite() {
  registerThreadYieldHook();
  abilityTest();
  uiExtensionSamplesTest();
  routeOfTest();
  titleResourceOfTest();
  listKeyOfTest();
  isListedPageTest();
  modalWantOfTest();
  terminateResultOfTest();
  modalMessageOfTest();
  modalMessageOf2Test();
  modalMessageOf3Test();
  reportDrawnMessageOfTest();
  reportDrawnMessageOf2Test();
  reportDrawnMessageOf3Test();
  privacyModeMessageOfTest();
  windowProxyMessageOfTest();
  windowProxyMessageOf2Test();
  startErrorMessageOfTest();
  startErrorMessageOf2Test();
  startErrorMessageOf3Test();
  startResultLogOfTest();
  startResultLogOf2Test();
  startResultLogOf3Test();
  openLinkLogOfTest();
  openLinkLogOf2Test();
  openLinkLogOf3Test();
  allowsBrowserFallbackTest();
  sessionCreateLogOfTest();
  sessionCreateLogOf2Test();
  sessionCreateLogOf3Test();
  contentPageOfTest();
  uiExtensionPageStateCtorTest();
  uiExtensionPageStateOpenTest();
  uiExtensionPageStateRequestModalTest();
  uiExtensionPageStateRequestModal2Test();
  uiExtensionPageStateTerminateWithResultTest();
  uiExtensionPageStateSetPrivacyModeTest();
  uiExtensionPageStateReportDrawnTest();
  uiExtensionPageStateReportDrawn2Test();
  uiExtensionPageStateReportDrawn3Test();
  uiExtensionPageStateFlowTest();
  uiExtensionPageStateFlow2Test();
  uiExtensionPageStateFlow3Test();
  uiExtensionPageStateFlow4Test();
  uiExtensionPageStateFlow5Test();
  uiExtensionPageStateFlow6Test();
  uiExtensionPageStateFlow7Test();
  uiExtensionLogicConstantsTest();
}
