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

import { createGroup, GroupSpec, rangeParam, scene, selectParam, toggleParam } from '../core/SchemaTypes';
import { TOPIC_LIFECYCLE } from '../core/TopicTypes';

const LABEL_OPTIONS: string[] = ['topic', 'canvas', 'none'];

// 专题 28：生命周期。参数顺序与 TopicEngine.lifecycle 的取值下标严格一致。
export const TOPIC_LIFECYCLE_GROUP: GroupSpec = createGroup(TOPIC_LIFECYCLE, 'topic-lifecycle',
  $r('app.string.topic_lifecycle_group_title'),
  $r('app.string.topic_lifecycle_group_desc'), [
    scene(0, $r('app.string.topic_lifecycle_s00_title'), $r('app.string.topic_lifecycle_s00_desc'), [
      toggleParam('rebuild', false),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(1, $r('app.string.topic_lifecycle_s01_title'), $r('app.string.topic_lifecycle_s01_desc'), [
      toggleParam('dispose', false),
      rangeParam('count', '', 3, 1, 8, 1)
    ]),
    scene(2, $r('app.string.topic_lifecycle_s02_title'), $r('app.string.topic_lifecycle_s02_desc'), [
      toggleParam('reset', true),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_lifecycle_s03_title'), $r('app.string.topic_lifecycle_s03_desc'), [
      selectParam('label', 0, LABEL_OPTIONS),
      rangeParam('count', '', 4, 1, 8, 1)
    ])
  ]);
