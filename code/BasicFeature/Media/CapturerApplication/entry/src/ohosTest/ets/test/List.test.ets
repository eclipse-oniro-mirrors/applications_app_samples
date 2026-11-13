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

import audioSourceTypeCoreTest from './AudioSourceTypeCore.test';
import audioSamplingRateCoreTest from './AudioSamplingRateCore.test';
import audioChannelCoreTest from './AudioChannelCore.test';
import audioSampleFormatCoreTest from './AudioSampleFormatCore.test';
import interruptHintTypeCoreTest from './InterruptHintTypeCore.test';
import audioStateCoreTest from './AudioStateCore.test';
import bufferWalkCoreTest from './BufferWalkCore.test';
import recordingMetadataDefaultsCoreTest from './RecordingMetadataDefaultsCore.test';
import recordingMetadataStateCoreTest from './RecordingMetadataStateCore.test';
import samplingRateKeyMapCoreTest from './SamplingRateKeyMapCore.test';
import channelKeyMapCoreTest from './ChannelKeyMapCore.test';
import sourceTypeKeyMapCoreTest from './SourceTypeKeyMapCore.test';
import sampleFormatKeyMapCoreTest from './SampleFormatKeyMapCore.test';
import samplingRateOptionsCoreTest from './SamplingRateOptionsCore.test';
import channelSourceOptionsCoreTest from './ChannelSourceOptionsCore.test';
import sampleFormatOptionsCoreTest from './SampleFormatOptionsCore.test';
import mediaToolsCountdownCoreTest from './MediaToolsCountdownCore.test';
import mediaToolsByteLengthCoreTest from './MediaToolsByteLengthCore.test';
import mediaToolsOffsetCoreTest from './MediaToolsOffsetCore.test';
import selectMapConsistencyCoreTest from './SelectMapConsistencyCore.test';

export default function testsuite() {
  abilityTest();
  audioSourceTypeCoreTest();
  audioSamplingRateCoreTest();
  audioChannelCoreTest();
  audioSampleFormatCoreTest();
  interruptHintTypeCoreTest();
  audioStateCoreTest();
  bufferWalkCoreTest();
  recordingMetadataDefaultsCoreTest();
  recordingMetadataStateCoreTest();
  samplingRateKeyMapCoreTest();
  channelKeyMapCoreTest();
  sourceTypeKeyMapCoreTest();
  sampleFormatKeyMapCoreTest();
  samplingRateOptionsCoreTest();
  channelSourceOptionsCoreTest();
  sampleFormatOptionsCoreTest();
  mediaToolsCountdownCoreTest();
  mediaToolsByteLengthCoreTest();
  mediaToolsOffsetCoreTest();
  selectMapConsistencyCoreTest();
}