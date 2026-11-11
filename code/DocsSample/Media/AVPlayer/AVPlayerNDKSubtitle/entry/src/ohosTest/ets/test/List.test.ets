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

import abilityTest from './Ability.test';

import subtitleTimeExpandedTest from './SubtitleTimeExpanded.test';
import subtitleCueExpandedTest from './SubtitleCueExpanded.test';
import subtitleSrtExpandedTest from './SubtitleSrtExpanded.test';
import subtitleEncodingExpandedTest from './SubtitleEncodingExpanded.test';
import timeConvertExpandedTest from './TimeConvertExpanded.test';
import playbackSpeedExpandedTest from './PlaybackSpeedExpanded.test';
import sliderProgressExpandedTest from './SliderProgressExpanded.test';
import nativeApiContractExpandedTest from './NativeApiContractExpanded.test';
import nativeFdContractExpandedTest from './NativeFdContractExpanded.test';
import nativeSeekContractExpandedTest from './NativeSeekContractExpanded.test';
import playerControlStateExpandedTest from './PlayerControlStateExpanded.test';
import subtitleDisplayExpandedTest from './SubtitleDisplayExpanded.test';
import mediaFileContractExpandedTest from './MediaFileContractExpanded.test';
import projectConstantsExpandedTest from './ProjectConstantsExpanded.test';

import subtitleRobustnessExpandedTest from './SubtitleRobustnessExpanded.test';
import subtitleOverlapExpandedTest from './SubtitleOverlapExpanded.test';
import subtitleWrapExpandedTest from './SubtitleWrapExpanded.test';
import seekBoundaryExpandedTest from './SeekBoundaryExpanded.test';
import speedCycleExpandedTest from './SpeedCycleExpanded.test';
import playerStateMatrixExpandedCoreTest from './PlayerStateMatrixExpandedCore.test';
import playerStateMatrixExpandedTailTest from './PlayerStateMatrixExpandedTail.test';
import nativeErrorContractExpandedTest from './NativeErrorContractExpanded.test';
import mediaMetadataExpandedTest from './MediaMetadataExpanded.test';
import playbackLimitsExpandedTest from './PlaybackLimitsExpanded.test';


import subtitleCueTimelineExpandedTest from './SubtitleCueTimelineExpanded.test';

import subtitleFileBehaviorExpandedCoreTest from './SubtitleFileBehaviorExpandedCore.test';
import subtitleFileBehaviorExpandedTailTest from './SubtitleFileBehaviorExpandedTail.test';
import mediaResourceBehaviorExpandedTest from './MediaResourceBehaviorExpanded.test';


import fileDescriptorTruncateBehaviorTest from './FileDescriptorTruncateBehavior.test';

import subtitlePipeline8wTest from './SubtitlePipeline8W.test';
import playerTimeline8wTest from './PlayerTimeline8W.test';
import nativeArgument8wTest from './NativeArgument8W.test';
import mediaMetadata8wTest from './MediaMetadata8W.test';
import fileDescriptor8wTest from './FileDescriptor8W.test';
import syncState8wTest from './SyncState8W.test';
import resourceIntegrity8wTest from './ResourceIntegrity8W.test';

import subtitleSafeParseCoreTest from './SubtitleSafeParseCore.test';
import subtitleSafeParseTailTest from './SubtitleSafeParseTail.test';
import subtitleSafeStateCoreTest from './SubtitleSafeStateCore.test';
import subtitleSafeStateTailTest from './SubtitleSafeStateTail.test';
import subtitleSafeBoundaryCoreTest from './SubtitleSafeBoundaryCore.test';
import subtitleSafeBoundaryTailTest from './SubtitleSafeBoundaryTail.test';
import subtitleSafeFileIoCoreFirstTest from './SubtitleSafeFileIoCoreFirst.test';
import subtitleSafeFileIoCoreSecondTest from './SubtitleSafeFileIoCoreSecond.test';
import subtitleSafeFileIoMiddleFirstTest from './SubtitleSafeFileIoMiddleFirst.test';
import subtitleSafeFileIoMiddleSecondTest from './SubtitleSafeFileIoMiddleSecond.test';
import subtitleSafeFileIoTailFirstTest from './SubtitleSafeFileIoTailFirst.test';
import subtitleSafeFileIoTailSecondTest from './SubtitleSafeFileIoTailSecond.test';
import playerContractSafeCoreTest from './PlayerContractSafeCore.test';
import playerContractSafeTailTest from './PlayerContractSafeTail.test';

export default function testsuite() {
  abilityTest();
  subtitleTimeExpandedTest();
  subtitleCueExpandedTest();
  subtitleSrtExpandedTest();
  subtitleEncodingExpandedTest();
  timeConvertExpandedTest();
  playbackSpeedExpandedTest();
  sliderProgressExpandedTest();
  nativeApiContractExpandedTest();
  nativeFdContractExpandedTest();
  nativeSeekContractExpandedTest();
  playerControlStateExpandedTest();
  subtitleDisplayExpandedTest();
  mediaFileContractExpandedTest();
  projectConstantsExpandedTest();
  subtitleRobustnessExpandedTest();
  subtitleOverlapExpandedTest();
  subtitleWrapExpandedTest();
  seekBoundaryExpandedTest();
  speedCycleExpandedTest();
  playerStateMatrixExpandedCoreTest();
  playerStateMatrixExpandedTailTest();
  nativeErrorContractExpandedTest();
  mediaMetadataExpandedTest();
  playbackLimitsExpandedTest();
  subtitleCueTimelineExpandedTest();
  subtitleFileBehaviorExpandedCoreTest();
  subtitleFileBehaviorExpandedTailTest();
  mediaResourceBehaviorExpandedTest();
  fileDescriptorTruncateBehaviorTest();
  subtitlePipeline8wTest();
  playerTimeline8wTest();
  nativeArgument8wTest();
  mediaMetadata8wTest();
  fileDescriptor8wTest();
  syncState8wTest();
  resourceIntegrity8wTest();
  subtitleSafeParseCoreTest();
  subtitleSafeParseTailTest();
  subtitleSafeStateCoreTest();
  subtitleSafeStateTailTest();
  subtitleSafeBoundaryCoreTest();
  subtitleSafeBoundaryTailTest();
  subtitleSafeFileIoCoreFirstTest();
  subtitleSafeFileIoCoreSecondTest();
  subtitleSafeFileIoMiddleFirstTest();
  subtitleSafeFileIoMiddleSecondTest();
  subtitleSafeFileIoTailFirstTest();
  subtitleSafeFileIoTailSecondTest();
  playerContractSafeCoreTest();
  playerContractSafeTailTest();
}