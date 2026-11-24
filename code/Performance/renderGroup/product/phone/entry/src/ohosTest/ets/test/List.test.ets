/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import renderGroupInteractionTest from './Interaction/RenderGroupInteraction.test';
import renderGroupGridTest from './Interaction/RenderGroupGrid.test';
import renderGroupSceneLifecycleTest from './LifecycleState/RenderGroupSceneLifecycle.test';
import renderGroupStabilityTest from './PerformanceStability/RenderGroupStability.test';
import renderGroupResourcesTest from './Validation/RenderGroupResources.test';
import renderGroupDriverQueueTest from './Shared/RenderGroupDriverQueue.test';
import renderGroupRouteWorkflowTest from './Integration/RenderGroupRouteWorkflow.test';
import renderGroupGesturesTest from './Interaction/RenderGroupGestures.test';
import renderGroupMatrix01 from './Generated/RenderGroupMatrix01.test';
import renderGroupMatrix02 from './Generated/RenderGroupMatrix02.test';
import renderGroupPaintTest from './Validation/RenderGroupPaint.test';
import renderGroupNumbersTest from './Validation/RenderGroupNumbers.test';

export default function testsuite(): void {
  abilityTest();
  renderGroupInteractionTest();
  renderGroupGridTest();
  renderGroupSceneLifecycleTest();
  renderGroupStabilityTest();
  renderGroupResourcesTest();
  renderGroupDriverQueueTest();
  renderGroupRouteWorkflowTest();
  renderGroupGesturesTest();
  renderGroupMatrix01();
  renderGroupMatrix02();
  renderGroupPaintTest();
  renderGroupNumbersTest();
}
