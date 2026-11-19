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

import { TopicNodeController } from './TopicNode';
import {
  TOPIC_ANIMATION,
  TOPIC_BLUR,
  TOPIC_FRAME_TICK,
  TOPIC_HIT_TEST,
  TOPIC_LAYOUT_COLUMN,
  TOPIC_LAYOUT_ROW,
  TOPIC_LIFECYCLE,
  TOPIC_MULTI_DEVICE,
  TOPIC_NODE_TREE,
  TOPIC_PERFORMANCE,
  TOPIC_RECORD,
  TOPIC_RENDER_PROP
} from './TopicTypes';

const DEFAULT_COUNT: number = 4;
const DEFAULT_GAP: number = 8;
const RAMP_MIN: number = 0.2;
const RAMP_MAX: number = 1;

// 专题分派层：把「专题编号 + 场景编号 + 参数数组」翻译成一串 TopicNodeController 调用。
// 所有页面共用这一层，页面本身只声明 schema 与宿主，不关心具体建树或属性细节。
export class TopicEngine {
  // 返回给页面状态栏的一句话结果说明。
  static apply(topic: number, sceneId: number, values: number[], node: TopicNodeController): string {
    switch (topic) {
      case TOPIC_NODE_TREE:
        return TopicEngine.nodeTree(sceneId, values, node);
      case TOPIC_RENDER_PROP:
        return TopicEngine.renderProp(sceneId, values, node);
      case TOPIC_BLUR:
        return TopicEngine.blur(sceneId, values, node);
      case TOPIC_ANIMATION:
        return TopicEngine.animation(sceneId, values, node);
      case TOPIC_HIT_TEST:
        return TopicEngine.hitTest(sceneId, values, node);
      case TOPIC_PERFORMANCE:
        return TopicEngine.performance(sceneId, values, node);
      case TOPIC_RECORD:
        return TopicEngine.record(sceneId, values, node);
      case TOPIC_MULTI_DEVICE:
        return TopicEngine.multiDevice(sceneId, values, node);
      case TOPIC_LIFECYCLE:
        return TopicEngine.lifecycle(sceneId, values, node);
      case TOPIC_FRAME_TICK:
        return TopicEngine.frameTick(sceneId, values, node);
      default:
        return 'unsupported topic ' + topic.toString();
    }
  }

  // 20 节点树：追加、插入、移除、行列切换。
  private static nodeTree(sceneId: number, values: number[], node: TopicNodeController): string {
    node.resetStats();
    if (sceneId === 1) {
      const count: number = TopicEngine.intOf(values, 0, 3);
      const after: number = TopicEngine.intOf(values, 1, 1);
      const gap: number = TopicEngine.num(values, 2, DEFAULT_GAP);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, gap);
      const total: number = node.insertBox(after);
      return 'insertChildAfter(' + after.toString() + ') -> ' + total.toString() + ' children';
    }
    if (sceneId === 2) {
      const count: number = TopicEngine.intOf(values, 0, 6);
      const mode: number = TopicEngine.intOf(values, 1, 0);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, DEFAULT_GAP);
      const total: number = node.removeBoxes(mode);
      return 'remove mode ' + mode.toString() + ' -> ' + total.toString() + ' children';
    }
    if (sceneId === 3) {
      const count: number = TopicEngine.intOf(values, 0, DEFAULT_COUNT);
      const layout: number = TopicEngine.intOf(values, 1, TOPIC_LAYOUT_ROW);
      const gap: number = TopicEngine.num(values, 2, 10);
      const total: number = node.rebuildBoxes(count, layout, gap);
      const name: string = layout === TOPIC_LAYOUT_ROW ? 'row' : 'column';
      return name + ' layout -> ' + total.toString() + ' children, gap ' + gap.toFixed(0) + ' vp';
    }
    const count: number = TopicEngine.intOf(values, 0, DEFAULT_COUNT);
    const gap: number = TopicEngine.num(values, 1, DEFAULT_GAP);
    const total: number = node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, gap);
    return 'appendChild x' + total.toString() + ', gap ' + gap.toFixed(0) + ' vp';
  }

  // 21 渲染属性：透明度、缩放旋转、平移、阴影边框。
  private static renderProp(sceneId: number, values: number[], node: TopicNodeController): string {
    if (sceneId === 1) {
      const count: number = TopicEngine.intOf(values, 2, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 14);
      const scale: number = TopicEngine.num(values, 0, 1);
      const rotation: number = TopicEngine.num(values, 1, 0);
      node.setTransform(scale, rotation);
      return 'scale ' + scale.toFixed(2) + ', rotation ' + rotation.toFixed(0) + ' deg';
    }
    if (sceneId === 2) {
      const count: number = TopicEngine.intOf(values, 2, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 16);
      const dx: number = TopicEngine.num(values, 0, 0);
      const dy: number = TopicEngine.num(values, 1, 0);
      node.setTranslate(dx, dy);
      return 'translation (' + dx.toFixed(0) + ', ' + dy.toFixed(0) + ') vp';
    }
    if (sceneId === 3) {
      const count: number = TopicEngine.intOf(values, 4, 3);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 24);
      const blur: number = TopicEngine.num(values, 0, 12);
      const alpha: number = TopicEngine.num(values, 1, 0.4);
      const radius: number = TopicEngine.num(values, 2, 10);
      const width: number = TopicEngine.num(values, 3, 0);
      node.setShadow(blur, alpha);
      node.setBorder(radius, width);
      return 'shadow ' + blur.toFixed(0) + ' vp / alpha ' + alpha.toFixed(2) + ', border ' + width.toFixed(1) +
        ' vp / radius ' + radius.toFixed(0) + ' vp';
    }
    const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
    node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 14);
    const opacity: number = TopicEngine.num(values, 0, 1);
    node.setOpacity(opacity);
    return 'opacity ' + opacity.toFixed(2) + ' on ' + count.toString() + ' children';
  }

  // 22 模糊：背景、内容、前景三种模糊层与半径扫描。
  private static blur(sceneId: number, values: number[], node: TopicNodeController): string {
    const count: number = TopicEngine.intOf(values, 1, sceneId === 0 ? DEFAULT_COUNT : 5);
    node.rebuildBoxes(count, sceneId === 2 ? TOPIC_LAYOUT_COLUMN : TOPIC_LAYOUT_ROW, 10);
    node.setBorder(10, 0);
    node.setShadow(0, 0);
    if (sceneId === 0) {
      const mode: number = TopicEngine.intOf(values, 0, 1);
      const radius: number = TopicEngine.num(values, 1, 12);
      node.setBlur(mode, radius);
      return 'blur mode ' + mode.toString() + ', radius ' + radius.toFixed(0) + ' vp';
    }
    if (sceneId === 1) {
      const radius: number = TopicEngine.num(values, 0, 20);
      node.setBlur(2, radius);
      return 'content blur radius ' + radius.toFixed(0) + ' vp';
    }
    if (sceneId === 2) {
      const radius: number = TopicEngine.num(values, 0, 8);
      node.setBlur(3, radius);
      return 'foreground blur radius ' + radius.toFixed(0) + ' vp';
    }
    const radius: number = TopicEngine.num(values, 0, 16);
    node.setBlur(1, radius);
    return 'background blur sweep, radius ' + radius.toFixed(0) + ' vp';
  }

  // 23 动画：定时器逐帧插值，等价于无框架依赖的属性动画。
  private static animation(sceneId: number, values: number[], node: TopicNodeController): string {
    if (sceneId === 3) {
      const count: number = TopicEngine.intOf(values, 2, 6);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 14);
      const duration: number = TopicEngine.num(values, 0, 240);
      const loops: number = TopicEngine.intOf(values, 1, 1);
      node.startAnimation(0, 1.8, duration, loops);
      return 'frame budget ' + duration.toFixed(0) + ' ms over ' + count.toString() + ' children';
    }
    node.rebuildBoxes(DEFAULT_COUNT, TOPIC_LAYOUT_ROW, 14);
    const duration: number = TopicEngine.num(values, 1, 480);
    const loops: number = TopicEngine.intOf(values, 2, 2);
    if (sceneId === 1) {
      const target: number = TopicEngine.num(values, 0, 180);
      node.startAnimation(1, target, duration, loops);
      return 'rotation 0 -> ' + target.toFixed(0) + ' deg, ' + duration.toFixed(0) + ' ms x' + loops.toString();
    }
    if (sceneId === 2) {
      const target: number = TopicEngine.num(values, 0, 40);
      node.startAnimation(2, target, duration, loops);
      return 'translation 0 -> ' + target.toFixed(0) + ' vp, ' + duration.toFixed(0) + ' ms x' + loops.toString();
    }
    const target: number = TopicEngine.num(values, 0, 1.6);
    node.startAnimation(0, target, duration, loops);
    return 'scale 1 -> ' + target.toFixed(2) + ', ' + duration.toFixed(0) + ' ms x' + loops.toString();
  }

  // 24 命中测试：触摸事件把坐标映射回子节点下标。
  private static hitTest(sceneId: number, values: number[], node: TopicNodeController): string {
    if (sceneId === 1) {
      const pad: number = TopicEngine.num(values, 0, 8);
      const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 12);
      node.setPad(pad);
      return 'hit area expanded by ' + pad.toFixed(0) + ' vp over ' + count.toString() + ' children';
    }
    if (sceneId === 2) {
      const count: number = TopicEngine.intOf(values, 0, DEFAULT_COUNT);
      const layout: number = TopicEngine.intOf(values, 1, TOPIC_LAYOUT_COLUMN);
      const total: number = node.rebuildBoxes(count, layout, 10);
      const name: string = layout === TOPIC_LAYOUT_ROW ? 'row' : 'column';
      return name + ' hit map over ' + total.toString() + ' children';
    }
    if (sceneId === 3) {
      const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 12);
      const reset: number = TopicEngine.intOf(values, 0, 0);
      if (reset > 0) {
        node.resetStats();
        return 'touch counters cleared, ' + count.toString() + ' children stay';
      }
      return 'touch counters kept, ' + count.toString() + ' children';
    }
    const count: number = TopicEngine.intOf(values, 0, DEFAULT_COUNT);
    const gap: number = TopicEngine.num(values, 1, DEFAULT_GAP);
    const total: number = node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, gap);
    return 'tap the canvas to hit one of ' + total.toString() + ' children';
  }

  // 25 性能：重绘突发、节点规模成本、周期负载。
  private static performance(sceneId: number, values: number[], node: TopicNodeController): string {
    if (sceneId === 1) {
      const count: number = TopicEngine.intOf(values, 0, 8);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 10);
      const times: number = TopicEngine.intOf(values, 1, 40);
      node.resetStats();
      const cost: number = node.invalidateTimes(times);
      return count.toString() + ' children, ' + times.toString() + ' invalidates in ' + cost.toString() + ' ms';
    }
    if (sceneId === 2) {
      const count: number = TopicEngine.intOf(values, 2, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 10);
      const interval: number = TopicEngine.num(values, 0, 32);
      const work: number = TopicEngine.intOf(values, 1, 2);
      node.startTick(interval, work);
      return 'tick every ' + interval.toFixed(0) + ' ms, ' + work.toString() + ' invalidates per tick';
    }
    if (sceneId === 3) {
      const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 10);
      if (TopicEngine.intOf(values, 0, 1) > 0) {
        node.stopTick();
        return 'tick stopped, ' + count.toString() + ' children kept';
      }
      node.startTick(48, 1);
      return 'tick running, ' + count.toString() + ' children';
    }
    const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
    node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 10);
    const times: number = TopicEngine.intOf(values, 0, 50);
    node.resetStats();
    const cost: number = node.invalidateTimes(times);
    return 'invalidate burst x' + times.toString() + ' in ' + cost.toString() + ' ms over ' + count.toString() +
      ' children';
  }

  // 26 录制回放：先录一段透明度斜坡，再按间隔重放。
  private static record(sceneId: number, values: number[], node: TopicNodeController): string {
    node.rebuildBoxes(DEFAULT_COUNT, TOPIC_LAYOUT_ROW, 14);
    if (sceneId === 3) {
      if (TopicEngine.intOf(values, 0, 1) > 0) {
        node.clearRecord();
        return 'record buffer cleared, size 0';
      }
      return 'record buffer kept, size ' + node.recordSize().toString();
    }
    const steps: number = TopicEngine.intOf(values, 0, 8);
    if (sceneId === 1) {
      const interval: number = TopicEngine.num(values, 1, 48);
      TopicEngine.fillRamp(node, steps);
      node.replay(interval, 1);
      return 'replay ' + steps.toString() + ' steps once, interval ' + interval.toFixed(0) + ' ms';
    }
    if (sceneId === 2) {
      TopicEngine.fillRamp(node, steps);
      const loops: number = TopicEngine.intOf(values, 2, 3);
      const interval: number = TopicEngine.num(values, 1, 80);
      node.replay(interval, loops);
      return 'replay ' + steps.toString() + ' steps x' + loops.toString() + ', interval ' + interval.toFixed(0) + ' ms';
    }
    const size: number = TopicEngine.fillRamp(node, steps);
    node.setOpacity(RAMP_MAX);
    return 'recorded ' + size.toString() + ' opacity steps';
  }

  // 27 多设备：行列表布局、px 单位、密度缩放。
  private static multiDevice(sceneId: number, values: number[], node: TopicNodeController): string {
    if (sceneId === 1) {
      const count: number = TopicEngine.intOf(values, 0, DEFAULT_COUNT);
      const gap: number = TopicEngine.num(values, 1, 12);
      const total: number = node.rebuildBoxes(count, TOPIC_LAYOUT_COLUMN, gap);
      return 'wide column -> ' + total.toString() + ' children, gap ' + gap.toFixed(0) + ' vp';
    }
    if (sceneId === 2) {
      const unit: number = TopicEngine.intOf(values, 0, 0);
      const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 12);
      node.setUnit(unit);
      return 'length unit ' + (unit === 1 ? 'px' : 'vp') + ' over ' + count.toString() + ' children';
    }
    if (sceneId === 3) {
      node.rebuildBoxes(DEFAULT_COUNT, TOPIC_LAYOUT_ROW, 16);
      const scale: number = TopicEngine.num(values, 0, 1.2);
      const pad: number = TopicEngine.num(values, 1, 8);
      node.setPad(pad);
      node.setTransform(scale, 0);
      return 'density scale ' + scale.toFixed(2) + ', inset ' + pad.toFixed(0) + ' vp';
    }
    const count: number = TopicEngine.intOf(values, 0, 5);
    const gap: number = TopicEngine.num(values, 1, 6);
    const total: number = node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, gap);
    return 'compact row -> ' + total.toString() + ' children, gap ' + gap.toFixed(0) + ' vp';
  }

  // 28 生命周期：重建、销毁后重建、统计复位、标签检查。
  private static lifecycle(sceneId: number, values: number[], node: TopicNodeController): string {
    if (sceneId === 1) {
      const count: number = TopicEngine.intOf(values, 1, 3);
      node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 12);
      if (TopicEngine.intOf(values, 0, 0) > 0) {
        node.disposeNode();
        node.rebuildHost(count);
        return 'disposed then rebuilt, children ' + node.nodeCount().toString();
      }
      return 'dispose switch off, children ' + node.nodeCount().toString();
    }
    if (sceneId === 2) {
      node.rebuildBoxes(TopicEngine.intOf(values, 1, DEFAULT_COUNT), TOPIC_LAYOUT_ROW, 12);
      if (TopicEngine.intOf(values, 0, 1) > 0) {
        node.resetStats();
        return 'statistics reset, children ' + node.nodeCount().toString();
      }
      return 'statistics kept, draws ' + node.stats().draws.toString();
    }
    if (sceneId === 3) {
      node.rebuildBoxes(TopicEngine.intOf(values, 1, DEFAULT_COUNT), TOPIC_LAYOUT_ROW, 12);
      const index: number = TopicEngine.intOf(values, 0, 0);
      const label: string = index === 1 ? 'canvas' : (index === 2 ? '' : 'topic');
      node.setLabel(label);
      const shown: string = label.length === 0 ? 'no label' : 'label ' + label;
      return shown + ', children ' + node.nodeCount().toString();
    }
    const count: number = TopicEngine.intOf(values, 1, DEFAULT_COUNT);
    node.rebuildBoxes(count, TOPIC_LAYOUT_ROW, 12);
    if (TopicEngine.intOf(values, 0, 0) > 0) {
      node.rebuildHost(count);
      return 'makeNode called again, children ' + node.nodeCount().toString();
    }
    return 'host kept, children ' + node.nodeCount().toString();
  }

  // 29 帧回调：按固定间隔触发重绘，观察重绘计数增长。
  private static frameTick(sceneId: number, values: number[], node: TopicNodeController): string {
    node.rebuildBoxes(DEFAULT_COUNT, TOPIC_LAYOUT_ROW, 14);
    if (sceneId === 3) {
      const times: number = TopicEngine.intOf(values, 0, 30);
      node.resetStats();
      const cost: number = node.invalidateTimes(times);
      return times.toString() + ' manual invalidates in ' + cost.toString() + ' ms';
    }
    if (sceneId === 2) {
      if (TopicEngine.intOf(values, 0, 1) > 0) {
        node.stopTick();
        return 'frame tick stopped, draws ' + node.stats().draws.toString();
      }
      node.startTick(TopicEngine.num(values, 1, 32), 1);
      return 'frame tick running every ' + TopicEngine.num(values, 1, 32).toFixed(0) + ' ms';
    }
    const interval: number = sceneId === 1 ? TopicEngine.num(values, 0, 33) : TopicEngine.num(values, 0, 16);
    const work: number = TopicEngine.intOf(values, 1, 1);
    node.startTick(interval, work);
    return 'tick ' + interval.toFixed(0) + ' ms, work ' + work.toString() + ' per tick';
  }

  // 录制一段 0.2 -> 1.0 的透明度斜坡，返回步数。
  private static fillRamp(node: TopicNodeController, steps: number): number {
    node.clearRecord();
    const total: number = Math.max(Math.round(steps), 1);
    for (let index = 0; index < total; index++) {
      const ratio: number = total === 1 ? RAMP_MAX : index / (total - 1);
      node.record(RAMP_MIN + (RAMP_MAX - RAMP_MIN) * ratio);
    }
    node.setOpacity(RAMP_MIN);
    return node.recordSize();
  }

  private static num(values: number[], index: number, fallback: number): number {
    if (index < 0 || index >= values.length) {
      return fallback;
    }
    const value: number = values[index];
    return Number.isNaN(value) ? fallback : value;
  }

  private static intOf(values: number[], index: number, fallback: number): number {
    return Math.round(TopicEngine.num(values, index, fallback));
  }
}
