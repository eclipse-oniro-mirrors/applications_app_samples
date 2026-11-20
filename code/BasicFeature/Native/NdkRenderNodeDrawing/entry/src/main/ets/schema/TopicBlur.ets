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

import { createGroup, GroupSpec, rangeParam, scene, selectParam } from '../core/SchemaTypes';
import { TOPIC_BLUR } from '../core/TopicTypes';

const BLUR_OPTIONS: string[] = ['off', 'background', 'content', 'foreground'];

// 专题 22：模糊层。参数顺序与 TopicEngine.blur 的取值下标严格一致。
export const TOPIC_BLUR_GROUP: GroupSpec = createGroup(TOPIC_BLUR, 'topic-blur',
  $r('app.string.topic_blur_group_title'),
  $r('app.string.topic_blur_group_desc'), [
    scene(0, $r('app.string.topic_blur_s00_title'), $r('app.string.topic_blur_s00_desc'), [
      selectParam('mode', 1, BLUR_OPTIONS),
      rangeParam('radius', 'vp', 12, 0, 40, 2),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(1, $r('app.string.topic_blur_s01_title'), $r('app.string.topic_blur_s01_desc'), [
      rangeParam('radius', 'vp', 20, 0, 40, 2),
      rangeParam('count', '', 5, 1, 8, 1)
    ]),
    scene(2, $r('app.string.topic_blur_s02_title'), $r('app.string.topic_blur_s02_desc'), [
      rangeParam('radius', 'vp', 8, 0, 40, 2),
      rangeParam('count', '', 5, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_blur_s03_title'), $r('app.string.topic_blur_s03_desc'), [
      rangeParam('radius', 'vp', 16, 0, 40, 2),
      rangeParam('count', '', 5, 1, 8, 1)
    ])
  ]);
