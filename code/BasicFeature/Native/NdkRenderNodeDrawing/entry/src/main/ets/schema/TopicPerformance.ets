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

import { createGroup, GroupSpec, rangeParam, scene, toggleParam } from '../core/SchemaTypes';
import { TOPIC_PERFORMANCE } from '../core/TopicTypes';

// 专题 25：性能观察。参数顺序与 TopicEngine.performance 的取值下标严格一致。
export const TOPIC_PERFORMANCE_GROUP: GroupSpec = createGroup(TOPIC_PERFORMANCE, 'topic-performance',
  $r('app.string.topic_performance_group_title'),
  $r('app.string.topic_performance_group_desc'), [
    scene(0, $r('app.string.topic_performance_s00_title'), $r('app.string.topic_performance_s00_desc'), [
      rangeParam('times', '', 50, 1, 200, 1),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(1, $r('app.string.topic_performance_s01_title'), $r('app.string.topic_performance_s01_desc'), [
      rangeParam('count', '', 8, 1, 8, 1),
      rangeParam('times', '', 40, 1, 200, 1)
    ]),
    scene(2, $r('app.string.topic_performance_s02_title'), $r('app.string.topic_performance_s02_desc'), [
      rangeParam('interval', 'ms', 32, 16, 200, 8),
      rangeParam('work', '', 2, 1, 8, 1),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_performance_s03_title'), $r('app.string.topic_performance_s03_desc'), [
      toggleParam('stop', true),
      rangeParam('count', '', 4, 1, 8, 1)
    ])
  ]);
