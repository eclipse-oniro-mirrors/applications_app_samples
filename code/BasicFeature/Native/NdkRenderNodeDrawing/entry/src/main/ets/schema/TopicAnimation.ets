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

import { createGroup, GroupSpec, rangeParam, scene } from '../core/SchemaTypes';
import { TOPIC_ANIMATION } from '../core/TopicTypes';

// 专题 23：定时器驱动的属性动画。参数顺序与 TopicEngine.animation 的取值下标严格一致。
export const TOPIC_ANIMATION_GROUP: GroupSpec = createGroup(TOPIC_ANIMATION, 'topic-animation',
  $r('app.string.topic_animation_group_title'),
  $r('app.string.topic_animation_group_desc'), [
    scene(0, $r('app.string.topic_animation_s00_title'), $r('app.string.topic_animation_s00_desc'), [
      rangeParam('target', '', 1.6, 0.5, 2, 0.1),
      rangeParam('duration', 'ms', 480, 100, 1200, 20),
      rangeParam('loops', '', 2, 1, 8, 1)
    ]),
    scene(1, $r('app.string.topic_animation_s01_title'), $r('app.string.topic_animation_s01_desc'), [
      rangeParam('target', 'deg', 180, -360, 360, 15),
      rangeParam('duration', 'ms', 600, 100, 1200, 20),
      rangeParam('loops', '', 2, 1, 8, 1)
    ]),
    scene(2, $r('app.string.topic_animation_s02_title'), $r('app.string.topic_animation_s02_desc'), [
      rangeParam('target', 'vp', 40, -80, 80, 4),
      rangeParam('duration', 'ms', 400, 100, 1200, 20),
      rangeParam('loops', '', 3, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_animation_s03_title'), $r('app.string.topic_animation_s03_desc'), [
      rangeParam('duration', 'ms', 240, 100, 1200, 20),
      rangeParam('loops', '', 1, 1, 8, 1),
      rangeParam('count', '', 6, 1, 8, 1)
    ])
  ]);
