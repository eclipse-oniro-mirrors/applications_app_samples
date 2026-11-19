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
import { TOPIC_RENDER_PROP } from '../core/TopicTypes';

// 专题 21：渲染属性。参数顺序与 TopicEngine.renderProp 的取值下标严格一致。
export const TOPIC_RENDER_PROP_GROUP: GroupSpec = createGroup(TOPIC_RENDER_PROP, 'topic-render-prop',
  $r('app.string.topic_render_prop_group_title'),
  $r('app.string.topic_render_prop_group_desc'), [
    scene(0, $r('app.string.topic_render_prop_s00_title'), $r('app.string.topic_render_prop_s00_desc'), [
      rangeParam('opacity', '', 1, 0.1, 1, 0.05),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(1, $r('app.string.topic_render_prop_s01_title'), $r('app.string.topic_render_prop_s01_desc'), [
      rangeParam('scale', '', 1, 0.4, 1.8, 0.05),
      rangeParam('rotation', 'deg', 0, -180, 180, 15),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(2, $r('app.string.topic_render_prop_s02_title'), $r('app.string.topic_render_prop_s02_desc'), [
      rangeParam('dx', 'vp', 0, -60, 60, 2),
      rangeParam('dy', 'vp', 0, -60, 60, 2),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_render_prop_s03_title'), $r('app.string.topic_render_prop_s03_desc'), [
      rangeParam('blur', 'vp', 12, 0, 32, 2),
      rangeParam('alpha', '', 0.4, 0, 1, 0.05),
      rangeParam('radius', 'vp', 10, 0, 24, 2),
      rangeParam('width', 'vp', 0, 0, 6, 0.5),
      rangeParam('count', '', 3, 1, 8, 1)
    ])
  ]);
