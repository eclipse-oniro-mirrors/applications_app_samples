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
import abilityTest from './Ability.test';

import midiKeyLayoutCoreTest from './MidiKeyLayoutCore.test';
import midiMessageCoreTest from './MidiMessageCore.test';
import midiBufferCapacityCoreTest from './MidiBufferCapacityCore.test';
import midiDeviceStateCoreTest from './MidiDeviceStateCore.test';

import midiMessageCodecCoreTest from './MidiMessageCodecCore.test';
import midiBleAddressCoreTest from './MidiBleAddressCore.test';
import midiPianoGeometryCoreTest from './MidiPianoGeometryCore.test';
import midiPortStateCoreTest from './MidiPortStateCore.test';
import midiUiContractCoreTest from './MidiUiContractCore.test';

import midiBleRecentCoreTest from './MidiBleRecentCore.test';
import midiUmpParserCoreTest from './MidiUmpParserCore.test';
import midiNoteFrequencyCoreTest from './MidiNoteFrequencyCore.test';
import midiPortTransitionCoreTest from './MidiPortTransitionCore.test';
import midiBufferUiCoreTest from './MidiBufferUiCore.test';

import midiBleScanFilterCoreTest from './MidiBleScanFilterCore.test';
import midiDataByteBoundaryCoreTest from './MidiDataByteBoundaryCore.test';
import midiPianoMultiTouchCoreTest from './MidiPianoMultiTouchCore.test';
import midiReconnectFlowCoreTest from './MidiReconnectFlowCore.test';
import midiDeviceHotplugCoreTest from './MidiDeviceHotplugCore.test';
import midiKeyHitTestCoreTest from './MidiKeyHitTestCore.test';
import midiChannelRoutingCoreTest from './MidiChannelRoutingCore.test';
import midiVelocityCurveCoreTest from './MidiVelocityCurveCore.test';

export default function testsuite(): void {
  abilityTest();
  midiKeyLayoutCoreTest();
  midiMessageCoreTest();
  midiBufferCapacityCoreTest();
  midiDeviceStateCoreTest();
  midiMessageCodecCoreTest();
  midiBleAddressCoreTest();
  midiPianoGeometryCoreTest();
  midiPortStateCoreTest();
  midiUiContractCoreTest();
  midiBleRecentCoreTest();
  midiUmpParserCoreTest();
  midiNoteFrequencyCoreTest();
  midiPortTransitionCoreTest();
  midiBufferUiCoreTest();
  midiBleScanFilterCoreTest();
  midiDataByteBoundaryCoreTest();
  midiPianoMultiTouchCoreTest();
  midiReconnectFlowCoreTest();
  midiDeviceHotplugCoreTest();
  midiChannelRoutingCoreTest();
  midiVelocityCurveCoreTest();
  midiKeyHitTestCoreTest();
}
