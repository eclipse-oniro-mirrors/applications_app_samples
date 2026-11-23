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

import entrySmokeTest from './EntrySmokeTest.test';
import sppPayloadCodecCoreTest from './SppPayloadCodecCore.test';
import sppBufferOpsCoreTest from './SppBufferOpsCore.test';
import sppUuidToolCoreTest from './SppUuidToolCore.test';
import sppFrameAssemblerCoreTest from './SppFrameAssemblerCore.test';
import sppOptionOfTest from './logic/SppOptionOf.test';
import sppOptionOf2Test from './logic/SppOptionOf2.test';
import isUuidFormatTest from './logic/IsUuidFormat.test';
import utf8BytesOfTest from './logic/Utf8BytesOf.test';
import utf8BytesOf2Test from './logic/Utf8BytesOf2.test';
import writeBytesOfTest from './logic/WriteBytesOf.test';
import writeBytesOf2Test from './logic/WriteBytesOf2.test';
import writtenByteCountOfTest from './logic/WrittenByteCountOf.test';
import droppedBytesOfTest from './logic/DroppedBytesOf.test';
import uint8JsonOfTest from './logic/Uint8JsonOf.test';
import readMessageOfTest from './logic/ReadMessageOf.test';
import callbackErrorOfTest from './logic/CallbackErrorOf.test';
import callbackErrorOf2Test from './logic/CallbackErrorOf2.test';
import callbackErrorOf3Test from './logic/CallbackErrorOf3.test';
import exceptionMessageOfTest from './logic/ExceptionMessageOf.test';
import exceptionMessageOf2Test from './logic/ExceptionMessageOf2.test';
import exceptionMessageOf3Test from './logic/ExceptionMessageOf3.test';
import successMessageOfTest from './logic/SuccessMessageOf.test';
import successMessageOf2Test from './logic/SuccessMessageOf2.test';
import successMessageOf3Test from './logic/SuccessMessageOf3.test';
import sppPageStateCtorTest from './logic/SppPageStateCtor.test';
import sppPageStateInputTest from './logic/SppPageStateInput.test';
import sppPageStateInput2Test from './logic/SppPageStateInput2.test';
import sppPageStateInput3Test from './logic/SppPageStateInput3.test';
import sppPageStateInput4Test from './logic/SppPageStateInput4.test';
import sppPageStateListenTest from './logic/SppPageStateListen.test';
import sppPageStateListen2Test from './logic/SppPageStateListen2.test';
import sppPageStateListen3Test from './logic/SppPageStateListen3.test';
import sppPageStateAcceptTest from './logic/SppPageStateAccept.test';
import sppPageStateAccept2Test from './logic/SppPageStateAccept2.test';
import sppPageStateAccept3Test from './logic/SppPageStateAccept3.test';
import sppPageStateConnectTest from './logic/SppPageStateConnect.test';
import sppPageStateConnect2Test from './logic/SppPageStateConnect2.test';
import sppPageStateConnect3Test from './logic/SppPageStateConnect3.test';
import sppPageStateWriteTest from './logic/SppPageStateWrite.test';
import sppPageStateCloseTest from './logic/SppPageStateClose.test';
import sppPageStateFlowTest from './logic/SppPageStateFlow.test';
import sppPageStateFlow2Test from './logic/SppPageStateFlow2.test';
import sppPageStateFlow3Test from './logic/SppPageStateFlow3.test';
import sppPageStateFlow4Test from './logic/SppPageStateFlow4.test';
import sppPageStateFlow5Test from './logic/SppPageStateFlow5.test';
import sppSerialLogicConstantsTest from './logic/SppSerialLogicConstants.test';

export default function testsuite() {
  entrySmokeTest();
  sppPayloadCodecCoreTest();
  sppBufferOpsCoreTest();
  sppUuidToolCoreTest();
  sppFrameAssemblerCoreTest();
  sppOptionOfTest();
  sppOptionOf2Test();
  isUuidFormatTest();
  utf8BytesOfTest();
  utf8BytesOf2Test();
  writeBytesOfTest();
  writeBytesOf2Test();
  writtenByteCountOfTest();
  droppedBytesOfTest();
  uint8JsonOfTest();
  readMessageOfTest();
  callbackErrorOfTest();
  callbackErrorOf2Test();
  callbackErrorOf3Test();
  exceptionMessageOfTest();
  exceptionMessageOf2Test();
  exceptionMessageOf3Test();
  successMessageOfTest();
  successMessageOf2Test();
  successMessageOf3Test();
  sppPageStateCtorTest();
  sppPageStateInputTest();
  sppPageStateInput2Test();
  sppPageStateInput3Test();
  sppPageStateInput4Test();
  sppPageStateListenTest();
  sppPageStateListen2Test();
  sppPageStateListen3Test();
  sppPageStateAcceptTest();
  sppPageStateAccept2Test();
  sppPageStateAccept3Test();
  sppPageStateConnectTest();
  sppPageStateConnect2Test();
  sppPageStateConnect3Test();
  sppPageStateWriteTest();
  sppPageStateCloseTest();
  sppPageStateFlowTest();
  sppPageStateFlow2Test();
  sppPageStateFlow3Test();
  sppPageStateFlow4Test();
  sppPageStateFlow5Test();
  sppSerialLogicConstantsTest();
}
