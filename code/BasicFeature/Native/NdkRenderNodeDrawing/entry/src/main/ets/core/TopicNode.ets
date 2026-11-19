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

import {
  borderRadiuses,
  edgeColors,
  edgeWidths,
  Frame,
  FrameNode,
  LengthMetricsUnit,
  NodeController,
  RenderNode,
  Size,
  UIContext
} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../common/Logger';
import { TOPIC_LAYOUT_ROW, TopicStats } from './TopicTypes';

const PALETTE: number[] = [0xFF2563EB, 0xFFF59E0B, 0xFF16A34A, 0xFFDC2626, 0xFF7C3AED, 0xFF0EA5E9];
const CANVAS_COLOR: number = 0xFFF1F5F9;
const SHADOW_COLOR: number = 0x55000000;
const BOX_INSET: number = 12;
const MIN_SIDE: number = 12;
const FRAME_STEP_MS: number = 16;
const MAX_BOX_COUNT: number = 8;
const MAX_RECORD_STEPS: number = 32;
const MIN_OPACITY: number = 0;
const MAX_OPACITY: number = 1;

// 专题页通用节点控制器：维护一层画布 RenderNode 与若干子节点，所有专题只通过方法改变状态。
export class TopicNodeController extends NodeController {
  private frameNode: FrameNode | null = null;
  private canvas: RenderNode | null = null;
  private boxes: RenderNode[] = [];
  private width: number = 0;
  private height: number = 0;
  private layoutMode: number = TOPIC_LAYOUT_ROW;
  private gap: number = 8;
  private pad: number = 0;
  private opacity: number = 1;
  private scale: number = 1;
  private rotation: number = 0;
  private translateX: number = 0;
  private translateY: number = 0;
  private shadowRadius: number = 0;
  private shadowAlpha: number = 0;
  private radius: number = 8;
  private borderWidth: number = 0;
  private borderColor: number = 0xFF1E293B;
  private clip: boolean = false;
  private label: string = '';
  private blurMode: number = 0;
  private blurRadius: number = 0;
  private unit: number = 0;
  private pendingCount: number = 0;
  private draws: number = 0;
  private touches: number = 0;
  private rebuilds: number = 0;
  private costMs: number = 0;
  private timerId: number = -1;
  private recorded: number[] = [];
  private notifier: (status: string) => void = () => {};

  setNotifier(notifier: (status: string) => void): void {
    this.notifier = notifier;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    // rebuild 会再次回调 makeNode，旧画布在这里回收，避免残留节点挂在已卸载的树上。
    if (this.canvas !== null && !this.canvas.isDisposed()) {
      this.canvas.dispose();
    }
    this.canvas = null;
    // 旧画布上的子节点已随画布失效，新画布按待重建数量或上一棵树的规模重新创建。
    const keep: number = this.pendingCount > 0 ? this.pendingCount : this.boxes.length;
    this.pendingCount = 0;
    this.boxes = [];
    this.frameNode = new FrameNode(uiContext);
    this.rebuilds += 1;
    const host: RenderNode | null = this.frameNode.getRenderNode();
    if (host === null) {
      Logger.error('topic makeNode failed, root render node is null');
      return this.frameNode;
    }
    this.canvas = new RenderNode();
    this.canvas.backgroundColor = CANVAS_COLOR;
    try {
      host.appendChild(this.canvas);
    } catch (error) {
      Logger.error('topic appendChild failed, message=' + (error as BusinessError).message);
    }
    // 场景可能在 makeNode 之前就已下发，画布建好后补一次标签、单位与模糊。
    this.canvas.label = this.label;
    this.canvas.lengthMetricsUnit = this.unit === 1 ? LengthMetricsUnit.PX : LengthMetricsUnit.DEFAULT;
    this.applyBlur();
    if (keep > 0) {
      this.rebuildBoxes(keep, this.layoutMode, this.gap);
    } else {
      this.relayout();
    }
    return this.frameNode;
  }

  aboutToResize(size: Size): void {
    this.width = size.width;
    this.height = size.height;
    this.relayout();
  }

  aboutToDisappear(): void {
    this.disposeNode();
  }

  // NodeController 收到的触摸坐标即画布局部坐标，可直接用于命中测试。
  onTouchEvent(event: TouchEvent): void {
    if (event.type !== TouchType.Down || event.touches.length === 0) {
      return;
    }
    const x: number = event.touches[0].x;
    const y: number = event.touches[0].y;
    this.touches += 1;
    const hit: number = this.hitTest(x, y);
    const hitText: string = hit < 0 ? 'outside' : 'box ' + hit.toString();
    this.notifier('touch ' + this.touches.toString() + ' at (' + Math.round(x).toString() + ', ' +
      Math.round(y).toString() + ') · hit ' + hitText);
  }

  resize(width: number, height: number): void {
    if (width <= 0 || height <= 0) {
      return;
    }
    this.width = width;
    this.height = height;
    this.relayout();
  }

  // 重建子节点树：先清空再按数量补齐。
  rebuildBoxes(count: number, layoutMode: number, gap: number): number {
    this.layoutMode = layoutMode;
    this.gap = gap;
    this.clearTimers();
    if (this.canvas !== null) {
      this.canvas.clearChildren();
    }
    this.boxes = [];
    const total: number = Math.min(Math.max(count, 0), MAX_BOX_COUNT);
    for (let index = 0; index < total; index++) {
      this.appendBox(index);
    }
    this.relayout();
    this.invalidateCanvas();
    return this.boxes.length;
  }

  // 在指定下标之后插入一个子节点，下标越界时退回追加。
  insertBox(afterIndex: number): number {
    if (this.boxes.length >= MAX_BOX_COUNT) {
      return this.boxes.length;
    }
    const node: RenderNode = this.createBox(this.boxes.length);
    // 下标非法时节点被追加到末尾，数组也必须追加，否则布局序号与节点树顺序错位。
    const validAfter: boolean = afterIndex >= 0 && afterIndex < this.boxes.length;
    const sibling: RenderNode | null = validAfter ? this.boxes[afterIndex] : null;
    if (this.canvas !== null) {
      try {
        if (sibling === null) {
          this.canvas.appendChild(node);
        } else {
          this.canvas.insertChildAfter(node, sibling);
        }
      } catch (error) {
        Logger.error('topic insertChildAfter failed, message=' + (error as BusinessError).message);
      }
    }
    this.boxes.splice(validAfter ? afterIndex + 1 : this.boxes.length, 0, node);
    this.relayout();
    this.invalidateCanvas();
    return this.boxes.length;
  }

  // 移除子节点：0 末尾、1 第一个、2 全部。
  removeBoxes(mode: number): number {
    if (this.boxes.length === 0) {
      return 0;
    }
    if (mode === 2) {
      if (this.canvas !== null) {
        this.canvas.clearChildren();
      }
      this.boxes = [];
    } else {
      const target: RenderNode | undefined = mode === 1 ? this.boxes[0] : this.boxes[this.boxes.length - 1];
      if (target !== undefined) {
        if (this.canvas !== null) {
          try {
            this.canvas.removeChild(target);
          } catch (error) {
            Logger.error('topic removeChild failed, message=' + (error as BusinessError).message);
          }
        }
        this.boxes.splice(mode === 1 ? 0 : this.boxes.length - 1, 1);
      }
    }
    this.relayout();
    this.invalidateCanvas();
    return this.boxes.length;
  }

  setOpacity(value: number): void {
    this.opacity = value;
    this.applyBoxes();
  }

  setTransform(scale: number, rotation: number): void {
    this.scale = scale;
    this.rotation = rotation;
    this.applyBoxes();
  }

  setTranslate(dx: number, dy: number): void {
    this.translateX = dx;
    this.translateY = dy;
    this.applyBoxes();
  }

  setShadow(radius: number, alpha: number): void {
    this.shadowRadius = radius;
    this.shadowAlpha = alpha;
    this.applyBoxes();
  }

  setBorder(radius: number, width: number): void {
    this.radius = radius;
    this.borderWidth = width;
    this.applyBoxes();
  }

  setClip(useClip: boolean): void {
    this.clip = useClip;
    this.applyBoxes();
  }

  setPad(pad: number): void {
    this.pad = pad;
    this.relayout();
  }

  // 模糊模式：0 关闭、1 背景、2 内容、3 前景。
  setBlur(mode: number, radius: number): void {
    this.blurMode = mode;
    this.blurRadius = radius;
    this.applyBlur();
  }

  setLabel(label: string): void {
    this.label = label;
    if (this.canvas !== null) {
      this.canvas.label = label;
      this.invalidateCanvas();
    }
  }

  // 长度单位切换：0 vp、1 px，切换后同样的数值会按新单位解释。
  setUnit(unit: number): void {
    this.unit = unit;
    if (this.canvas !== null) {
      this.canvas.lengthMetricsUnit = unit === 1 ? LengthMetricsUnit.PX : LengthMetricsUnit.DEFAULT;
    }
    this.relayout();
  }

  // 连续触发重绘，返回这一批调用的耗时，用于性能专题观察。
  invalidateTimes(times: number): number {
    const start: number = Date.now();
    for (let index = 0; index < times; index++) {
      this.invalidateCanvas();
      this.draws += 1;
    }
    this.costMs = Date.now() - start;
    return this.costMs;
  }

  // 以定时器驱动属性插值，等价于逐帧动画，不依赖框架动画接口。
  startAnimation(kind: number, target: number, durationMs: number, loops: number): void {
    this.clearTimers();
    const steps: number = Math.max(Math.round(durationMs / FRAME_STEP_MS), 2);
    const totalLoops: number = Math.max(Math.round(loops), 1);
    let phase: number = 0;
    let loop: number = 0;
    this.timerId = setInterval(() => {
      phase += 1;
      const progress: number = phase / steps;
      const eased: number = 1 - (1 - progress) * (1 - progress);
      this.applyAnimatedStep(kind, target, eased);
      if (phase >= steps) {
        phase = 0;
        loop += 1;
        if (loop >= totalLoops) {
          this.clearTimers();
        }
      }
    }, FRAME_STEP_MS);
  }

  // 帧回调专题：按固定间隔触发重绘，work 控制每帧的额外重绘次数。
  startTick(intervalMs: number, work: number): void {
    this.clearTimers();
    this.timerId = setInterval(() => {
      for (let index = 0; index < Math.max(work, 1); index++) {
        this.invalidateCanvas();
        this.draws += 1;
      }
    }, Math.max(intervalMs, FRAME_STEP_MS));
  }

  stopTick(): void {
    this.clearTimers();
  }

  // 录制与回放专题：把一组透明度值录下来，再按间隔逐帧重放。
  record(value: number): number {
    if (this.recorded.length < MAX_RECORD_STEPS) {
      // 回放时记录的数值会直接写进 RenderNode.opacity，越界值必须在录制时就夹紧。
      const clamped: number = Number.isNaN(value) ? MAX_OPACITY : Math.min(Math.max(value, MIN_OPACITY), MAX_OPACITY);
      this.recorded.push(clamped);
    }
    return this.recorded.length;
  }

  recordSize(): number {
    return this.recorded.length;
  }

  clearRecord(): void {
    this.recorded = [];
  }

  replay(intervalMs: number, loops: number): number {
    this.clearTimers();
    if (this.recorded.length === 0) {
      return 0;
    }
    const steps: number[] = this.recorded.slice();
    const totalLoops: number = Math.max(Math.round(loops), 1);
    let index: number = 0;
    let loop: number = 0;
    this.timerId = setInterval(() => {
      this.opacity = steps[index];
      this.applyBoxes();
      index += 1;
      if (index >= steps.length) {
        index = 0;
        loop += 1;
        if (loop >= totalLoops) {
          this.clearTimers();
        }
      }
    }, Math.max(intervalMs, FRAME_STEP_MS));
    return steps.length;
  }

  // 清空统计计数，保留当前节点树与属性状态。
  resetStats(): void {
    this.draws = 0;
    this.touches = 0;
    this.costMs = 0;
  }

  isTicking(): boolean {
    return this.timerId >= 0;
  }

  // 请求重建宿主：rebuild 会再次回调 makeNode，子节点数量经 pendingCount 带给新画布。
  rebuildHost(count: number): void {
    this.clearTimers();
    this.pendingCount = Math.max(Math.round(count), 0);
    this.rebuild();
    // rebuild 同步回调时 makeNode 已把 pendingCount 消费掉；仍大于 0 说明需要补挂。
    if (this.pendingCount > 0) {
      const total: number = this.pendingCount;
      this.pendingCount = 0;
      this.rebuildBoxes(total, this.layoutMode, this.gap);
    }
  }

  disposeNode(): void {
    this.clearTimers();
    if (this.canvas !== null && !this.canvas.isDisposed()) {
      this.canvas.dispose();
    }
    this.canvas = null;
    this.boxes = [];
  }

  invalidateAll(): void {
    this.applyBoxes();
  }

  stats(): TopicStats {
    return new TopicStats(this.boxes.length, this.draws, this.touches, this.rebuilds, this.costMs, this.label);
  }

  nodeCount(): number {
    return this.boxes.length;
  }

  // 模糊属性单独抽出来，makeNode 补状态与滑杆调整都走这里。
  private applyBlur(): void {
    if (this.canvas === null) {
      return;
    }
    this.canvas.backgroundBlur = undefined;
    this.canvas.contentBlur = undefined;
    this.canvas.foregroundBlur = undefined;
    if (this.blurMode === 1) {
      this.canvas.backgroundBlur = { radius: this.blurRadius };
    } else if (this.blurMode === 2) {
      this.canvas.contentBlur = { radius: this.blurRadius };
    } else if (this.blurMode === 3) {
      this.canvas.foregroundBlur = { radius: this.blurRadius };
    }
    this.invalidateCanvas();
  }

  private applyAnimatedStep(kind: number, target: number, eased: number): void {
    if (kind === 0) {
      this.scale = 1 + (target - 1) * eased;
    } else if (kind === 1) {
      this.rotation = target * eased;
    } else {
      this.translateX = target * eased;
    }
    this.applyBoxes();
  }

  private createBox(index: number): RenderNode {
    const node: RenderNode = new RenderNode();
    node.backgroundColor = PALETTE[index % PALETTE.length];
    node.borderRadius = borderRadiuses(this.radius);
    return node;
  }

  private appendBox(index: number): void {
    const node: RenderNode = this.createBox(index);
    if (this.canvas !== null) {
      try {
        this.canvas.appendChild(node);
      } catch (error) {
        Logger.error('topic appendChild failed, message=' + (error as BusinessError).message);
      }
    }
    this.boxes.push(node);
  }

  private relayout(): void {
    if (this.canvas === null) {
      return;
    }
    this.canvas.frame = { x: 0, y: 0, width: this.width, height: this.height };
    const count: number = this.boxes.length;
    if (count === 0) {
      return;
    }
    const inset: number = BOX_INSET + this.pad;
    const row: boolean = this.layoutMode === TOPIC_LAYOUT_ROW;
    const availWidth: number = Math.max(this.width - inset * 2, MIN_SIDE);
    const availHeight: number = Math.max(this.height - inset * 2, MIN_SIDE);
    // 节点多、间距大时按最小边长反推可用间距，避免抬高单元格尺寸后整体溢出画布。
    const rowGap: number = count > 1 ? Math.min(this.gap, Math.max((availWidth - MIN_SIDE * count) / (count - 1),
      0)) : 0;
    const columnGap: number = count > 1 ? Math.min(this.gap, Math.max((availHeight - MIN_SIDE * count) / (count - 1),
      0)) : 0;
    const cellWidth: number = row ? Math.max((availWidth - rowGap * (count - 1)) / count, MIN_SIDE) : availWidth;
    const cellHeight: number = row ? availHeight * 0.6 :
      Math.max((availHeight - columnGap * (count - 1)) / count, MIN_SIDE);
    for (let index = 0; index < count; index++) {
      const box: RenderNode = this.boxes[index];
      const x: number = row ? inset + index * (cellWidth + rowGap) : inset;
      const y: number = row ? inset + (availHeight - cellHeight) / 2 : inset + index * (cellHeight + columnGap);
      box.frame = { x: x, y: y, width: cellWidth, height: cellHeight };
    }
    this.applyBoxes();
  }

  private applyBoxes(): void {
    for (const box of this.boxes) {
      box.opacity = this.opacity;
      box.scale = { x: this.scale, y: this.scale };
      box.rotation = { x: 0, y: 0, z: this.rotation };
      box.translation = { x: this.translateX, y: this.translateY };
      box.shadowColor = SHADOW_COLOR;
      box.shadowAlpha = this.shadowAlpha;
      box.shadowRadius = this.shadowRadius;
      box.shadowOffset = { x: this.shadowRadius / 2, y: this.shadowRadius / 2 };
      box.borderRadius = borderRadiuses(this.radius);
      box.borderWidth = edgeWidths(this.borderWidth);
      box.borderColor = edgeColors(this.borderColor);
      box.clipToFrame = this.clip;
      box.invalidate();
    }
    this.invalidateCanvas();
  }

  private invalidateCanvas(): void {
    if (this.canvas !== null && !this.canvas.isDisposed()) {
      this.canvas.invalidate();
    }
  }

  private hitTest(x: number, y: number): number {
    for (let index = 0; index < this.boxes.length; index++) {
      const frame: Frame = this.boxes[index].frame;
      if (x >= frame.x - this.pad && x <= frame.x + frame.width + this.pad &&
        y >= frame.y - this.pad && y <= frame.y + frame.height + this.pad) {
        return index;
      }
    }
    return -1;
  }

  private clearTimers(): void {
    if (this.timerId >= 0) {
      clearInterval(this.timerId);
      this.timerId = -1;
    }
  }
}
