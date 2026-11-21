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

import Ability from './Ability.test';
import ControllerGuardSequence from './ControllerGuardSequence.test';
import NavClearSequence from './NavClearSequence.test';
import NavDuplicateSequence from './NavDuplicateSequence.test';
import NavIsolationSequence from './NavIsolationSequence.test';
import NavMoveIndexSequence from './NavMoveIndexSequence.test';
import NavMoveNameSequence from './NavMoveNameSequence.test';
import NavPopIndexSequence from './NavPopIndexSequence.test';
import NavPopNameSequence from './NavPopNameSequence.test';
import NavPopSequence from './NavPopSequence.test';
import NavPushSequence from './NavPushSequence.test';
import NavRemoveIndexMatrix from './NavRemoveIndexMatrix.test';
import NavRemoveNameMatrix from './NavRemoveNameMatrix.test';
import NavReplaceSequence from './NavReplaceSequence.test';
import RouteRegistrationMatrix from './RouteRegistrationMatrix.test';

export default function testsuite(): void {
  Ability();
  ControllerGuardSequence();
  NavClearSequence();
  NavDuplicateSequence();
  NavIsolationSequence();
  NavMoveIndexSequence();
  NavMoveNameSequence();
  NavPopIndexSequence();
  NavPopNameSequence();
  NavPopSequence();
  NavPushSequence();
  NavRemoveIndexMatrix();
  NavRemoveNameMatrix();
  NavReplaceSequence();
  RouteRegistrationMatrix();
}
