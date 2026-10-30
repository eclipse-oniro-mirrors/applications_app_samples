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
import multiNavigationTest from './MultiNavigation.test';
import stackApiTest from './MultiNavigationStack.test';
import layoutTest from './SplitLayout.test';
import foldTest from './FoldSplit.test';
import hspTest from './Hsp.test';
import stabilityTest from './Stability.test';
import edgeTest from './Edge.test';
import logicTest from './Logic.test';

export default function testsuite() {
  abilityTest();
  multiNavigationTest();
  stackApiTest();
  layoutTest();
  foldTest();
  hspTest();
  stabilityTest();
  edgeTest();
  logicTest();
}
