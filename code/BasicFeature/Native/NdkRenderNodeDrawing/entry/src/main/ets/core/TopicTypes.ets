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

// 专题页编号接在 19 个 native 能力域之后，只在 ArkTS 侧索引，不参与 native 分派。
export const TOPIC_NODE_TREE: number = 20;
export const TOPIC_RENDER_PROP: number = 21;
export const TOPIC_BLUR: number = 22;
export const TOPIC_ANIMATION: number = 23;
export const TOPIC_HIT_TEST: number = 24;
export const TOPIC_PERFORMANCE: number = 25;
export const TOPIC_RECORD: number = 26;
export const TOPIC_MULTI_DEVICE: number = 27;
export const TOPIC_LIFECYCLE: number = 28;
export const TOPIC_FRAME_TICK: number = 29;
export const TOPIC_COUNT: number = 10;

// 专题页布局：子节点按行或按列排列。
export const TOPIC_LAYOUT_ROW: number = 0;
export const TOPIC_LAYOUT_COLUMN: number = 1;

// 专题页状态快照：node 树规模、重绘次数、触摸次数等，统一喂给页面状态栏。
export class TopicStats {
  public nodes: number;
  public draws: number;
  public touches: number;
  public rebuilds: number;
  public costMs: number;
  public label: string;

  constructor(nodes: number, draws: number, touches: number, rebuilds: number, costMs: number, label: string) {
    this.nodes = nodes;
    this.draws = draws;
    this.touches = touches;
    this.rebuilds = rebuilds;
    this.costMs = costMs;
    this.label = label;
  }
}
