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
import { TOPIC_FRAME_TICK } from '../core/TopicTypes';

// 专题 29：帧回调。参数顺序与 TopicEngine.frameTick 的取值下标严格一致。
export const TOPIC_FRAME_TICK_GROUP: GroupSpec = createGroup(TOPIC_FRAME_TICK, 'topic-frame-tick',
  $r('app.string.topic_frame_tick_group_title'),
  $r('app.string.topic_frame_tick_group_desc'), [
    scene(0, $r('app.string.topic_frame_tick_s00_title'), $r('app.string.topic_frame_tick_s00_desc'), [
      rangeParam('interval', 'ms', 16, 16, 200, 8),
      rangeParam('work', '', 1, 1, 8, 1)
    ]),
    scene(1, $r('app.string.topic_frame_tick_s01_title'), $r('app.string.topic_frame_tick_s01_desc'), [
      rangeParam('interval', 'ms', 32, 16, 200, 8),
      rangeParam('work', '', 2, 1, 8, 1)
    ]),
    scene(2, $r('app.string.topic_frame_tick_s02_title'), $r('app.string.topic_frame_tick_s02_desc'), [
      toggleParam('stop', true),
      rangeParam('interval', 'ms', 32, 16, 200, 8)
    ]),
    scene(3, $r('app.string.topic_frame_tick_s03_title'), $r('app.string.topic_frame_tick_s03_desc'), [
      rangeParam('times', '', 30, 1, 200, 1)
    ])
  ]);
