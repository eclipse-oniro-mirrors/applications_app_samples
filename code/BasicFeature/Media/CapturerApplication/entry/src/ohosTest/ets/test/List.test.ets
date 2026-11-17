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
import mediaByteLengthMatrixPart1Test from './MediaByteLengthMatrixPart1.test';
import mediaByteLengthMatrixPart2Test from './MediaByteLengthMatrixPart2.test';
import mediaByteLengthMatrixPart3Test from './MediaByteLengthMatrixPart3.test';
import mediaOffsetMatrixPart1Test from './MediaOffsetMatrixPart1.test';
import mediaOffsetMatrixPart2Test from './MediaOffsetMatrixPart2.test';
import mediaOffsetMatrixPart3Test from './MediaOffsetMatrixPart3.test';
import mediaRoundTripMatrixPart1Test from './MediaRoundTripMatrixPart1.test';
import mediaRoundTripMatrixPart2Test from './MediaRoundTripMatrixPart2.test';
import mediaRoundTripMatrixPart3Test from './MediaRoundTripMatrixPart3.test';
import mediaCountdownMatrixPart1Test from './MediaCountdownMatrixPart1.test';
import mediaCountdownMatrixPart2Test from './MediaCountdownMatrixPart2.test';
import mediaCountdownMatrixPart3Test from './MediaCountdownMatrixPart3.test';
import mediaBoundaryPart1Test from './MediaBoundaryPart1.test';
import mediaBoundaryPart2Test from './MediaBoundaryPart2.test';
import mediaPerfPart1Test from './MediaPerfPart1.test';
import mediaStabilityPart1Test from './MediaStabilityPart1.test';
import mediaIntegrationPart1Test from './MediaIntegrationPart1.test';
import mediaIntegrationPart2Test from './MediaIntegrationPart2.test';
import recordingMetadataMatrixPart1Test from './RecordingMetadataMatrixPart1.test';
import recordingMetadataMatrixPart2Test from './RecordingMetadataMatrixPart2.test';
import recordingMetadataMatrixPart3Test from './RecordingMetadataMatrixPart3.test';
import audioEnumValuesPart1Test from './AudioEnumValuesPart1.test';
import selectOptionContractPart1Test from './SelectOptionContractPart1.test';

export default function testsuite() {
  abilityTest();
  mediaByteLengthMatrixPart1Test();
  mediaByteLengthMatrixPart2Test();
  mediaByteLengthMatrixPart3Test();
  mediaOffsetMatrixPart1Test();
  mediaOffsetMatrixPart2Test();
  mediaOffsetMatrixPart3Test();
  mediaRoundTripMatrixPart1Test();
  mediaRoundTripMatrixPart2Test();
  mediaRoundTripMatrixPart3Test();
  mediaCountdownMatrixPart1Test();
  mediaCountdownMatrixPart2Test();
  mediaCountdownMatrixPart3Test();
  mediaBoundaryPart1Test();
  mediaBoundaryPart2Test();
  mediaPerfPart1Test();
  mediaStabilityPart1Test();
  mediaIntegrationPart1Test();
  mediaIntegrationPart2Test();
  recordingMetadataMatrixPart1Test();
  recordingMetadataMatrixPart2Test();
  recordingMetadataMatrixPart3Test();
  audioEnumValuesPart1Test();
  selectOptionContractPart1Test();
}