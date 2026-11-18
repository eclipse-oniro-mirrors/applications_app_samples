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
import { TOPIC_LAYOUT_ROW, TOPIC_NODE_TREE } from '../core/TopicTypes';

const LAYOUT_OPTIONS: string[] = ['row', 'column'];
const REMOVE_OPTIONS: string[] = ['last child', 'first child', 'all children'];

// 专题 20：节点树操作。参数顺序与 TopicEngine.nodeTree 的取值下标严格一致。
export const TOPIC_NODE_TREE_GROUP: GroupSpec = createGroup(TOPIC_NODE_TREE, 'topic-node-tree',
  $r('app.string.topic_node_tree_group_title'),
  $r('app.string.topic_node_tree_group_desc'), [
    scene(0, $r('app.string.topic_node_tree_s00_title'), $r('app.string.topic_node_tree_s00_desc'), [
      rangeParam('count', '', 4, 1, 8, 1),
      rangeParam('gap', 'vp', 8, 0, 24, 1)
    ]),
    scene(1, $r('app.string.topic_node_tree_s01_title'), $r('app.string.topic_node_tree_s01_desc'), [
      rangeParam('count', '', 3, 1, 7, 1),
      rangeParam('after', '', 1, -1, 7, 1),
      rangeParam('gap', 'vp', 8, 0, 24, 1)
    ]),
    scene(2, $r('app.string.topic_node_tree_s02_title'), $r('app.string.topic_node_tree_s02_desc'), [
      rangeParam('count', '', 6, 1, 8, 1),
      selectParam('mode', 0, REMOVE_OPTIONS)
    ]),
    scene(3, $r('app.string.topic_node_tree_s03_title'), $r('app.string.topic_node_tree_s03_desc'), [
      rangeParam('count', '', 4, 1, 8, 1),
      selectParam('layout', TOPIC_LAYOUT_ROW, LAYOUT_OPTIONS),
      rangeParam('gap', 'vp', 10, 0, 24, 1)
    ])
  ]);
