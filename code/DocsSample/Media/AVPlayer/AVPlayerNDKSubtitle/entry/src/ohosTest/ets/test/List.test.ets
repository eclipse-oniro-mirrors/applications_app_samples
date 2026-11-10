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
import timeConvertExpandedTest from './TimeConvertExpanded.test';
import nativeErrorContractExpandedTest from './NativeErrorContractExpanded.test';
import mediaResourceBehaviorExpandedTest from './MediaResourceBehaviorExpanded.test';
import mediaMetadata8wTest from './MediaMetadata8W.test';
import subtitleSafeParseCoreTest from './SubtitleSafeParseCore.test';
import subtitleSafeParseTailTest from './SubtitleSafeParseTail.test';
import subtitleSafeStateCoreTest from './SubtitleSafeStateCore.test';
import subtitleSafeStateTailTest from './SubtitleSafeStateTail.test';
import subtitleSafeBoundaryCoreTest from './SubtitleSafeBoundaryCore.test';
import subtitleSafeBoundaryTailTest from './SubtitleSafeBoundaryTail.test';
import SubtitleSafeFileIoCoreFirstTest from './SubtitleSafeFileIoCoreFirst.test';
import SubtitleSafeFileIoMiddleFirstTest from './SubtitleSafeFileIoMiddleFirst.test';
import SubtitleSafeFileIoTailFirstTest from './SubtitleSafeFileIoTailFirst.test';
import playerContractSafeCoreTest from './PlayerContractSafeCore.test';
import playerContractSafeTailTest from './PlayerContractSafeTail.test';
import uiSmokeSafeTest from './UiSmokeSafe.test';

export default function testsuite() {
  abilityTest();
  timeConvertExpandedTest();
  nativeErrorContractExpandedTest();
  mediaResourceBehaviorExpandedTest();
  mediaMetadata8wTest();
  subtitleSafeParseCoreTest();
  subtitleSafeParseTailTest();
  subtitleSafeStateCoreTest();
  subtitleSafeStateTailTest();
  subtitleSafeBoundaryCoreTest();
  subtitleSafeBoundaryTailTest();
  SubtitleSafeFileIoCoreFirstTest();
  SubtitleSafeFileIoMiddleFirstTest();
  SubtitleSafeFileIoTailFirstTest();
  playerContractSafeCoreTest();
  playerContractSafeTailTest();
  uiSmokeSafeTest();
}
