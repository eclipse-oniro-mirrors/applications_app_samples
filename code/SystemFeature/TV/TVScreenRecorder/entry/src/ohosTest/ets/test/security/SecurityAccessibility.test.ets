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

import { describe, it, expect } from '@ohos/hypium';

/**
 * Accessibility checks of the recorder floating windows.
 * The timer window and the tip window are rendered on top of the TV content,
 * therefore their text has to stay readable and their focus behavior must not
 * trap the remote control focus.
 */

/** One accessibility node of a floating window. */
interface AccessibilityNode {
  nodeId: string;
  text: string;
  description: string;
  focusable: boolean;
  visible: boolean;
}

/** Contrast evaluation result of one color pair. */
interface ContrastResult {
  ratio: number;
  meetsAA: boolean;
  meetsAAA: boolean;
  largeTextOnly: boolean;
}

/** Marquee readability result of one scrolling text. */
interface MarqueeCheck {
  readable: boolean;
  loops: number;
  reason: string;
}

/**
 * Accessibility tree of one floating window.
 * The tree keeps insertion order so that traversal assertions stay stable.
 */
class RecorderAccessibilityTree {
  private nodes: AccessibilityNode[] = [];

  public addNode(node: AccessibilityNode): void {
    this.nodes.push(node);
  }

  public count(): number {
    return this.nodes.length;
  }

  public visibleCount(): number {
    let count = 0;
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].visible) {
        count++;
      }
    }
    return count;
  }

  public focusableCount(): number {
    let count = 0;
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].focusable) {
        count++;
      }
    }
    return count;
  }

  public findById(nodeId: string): AccessibilityNode | null {
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].nodeId === nodeId) {
        return this.nodes[index];
      }
    }
    return null;
  }

  /** Label exposed to the screen reader: the text wins over the description. */
  public readableLabel(nodeId: string): string {
    const node = this.findById(nodeId);
    if (node === null) {
      return '';
    }
    if (node.text.length > 0) {
      return node.text;
    }
    return node.description;
  }

  public hasLabel(nodeId: string): boolean {
    return this.readableLabel(nodeId).length > 0;
  }

  public labels(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      const label = this.readableLabel(this.nodes[index].nodeId);
      if (label.length > 0) {
        result.push(label);
      }
    }
    return result;
  }

  public invisibleNodes(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      if (!this.nodes[index].visible) {
        result.push(this.nodes[index].nodeId);
      }
    }
    return result;
  }
}

/**
 * WCAG contrast evaluator.
 * The floating windows use #B33A3F62 as background, where the leading byte is
 * the alpha channel and the remaining three bytes are the RGB color.
 */
class ContrastEvaluator {
  public static readonly TIP_BACKGROUND: string = '#B33A3F62';
  public static readonly TIMER_TEXT_COLOR: string = '#FFFFFFFF';
  public static readonly AA_THRESHOLD: number = 4.5;
  public static readonly AAA_THRESHOLD: number = 7;

  private static stripAlpha(color: string): string {
    const body = color.startsWith('#') ? color.substring(1) : color;
    if (body.length === 8) {
      return body.substring(2);
    }
    return body;
  }

  private static channelToLinear(value: number): number {
    const normalized = value / 255;
    if (normalized <= 0.03928) {
      return normalized / 12.92;
    }
    return Math.pow((normalized + 0.055) / 1.055, 2.4);
  }

  public static red(color: string): number {
    const rgb = ContrastEvaluator.stripAlpha(color);
    return parseInt(rgb.substring(0, 2), 16);
  }

  public static green(color: string): number {
    const rgb = ContrastEvaluator.stripAlpha(color);
    return parseInt(rgb.substring(2, 4), 16);
  }

  public static blue(color: string): number {
    const rgb = ContrastEvaluator.stripAlpha(color);
    return parseInt(rgb.substring(4, 6), 16);
  }

  public static luminance(color: string): number {
    const r = ContrastEvaluator.channelToLinear(ContrastEvaluator.red(color));
    const g = ContrastEvaluator.channelToLinear(ContrastEvaluator.green(color));
    const b = ContrastEvaluator.channelToLinear(ContrastEvaluator.blue(color));
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  public static ratio(foreground: string, background: string): number {
    const first = ContrastEvaluator.luminance(foreground);
    const second = ContrastEvaluator.luminance(background);
    const lighter = Math.max(first, second);
    const darker = Math.min(first, second);
    return (lighter + 0.05) / (darker + 0.05);
  }

  public static evaluate(foreground: string, background: string): ContrastResult {
    const ratio = ContrastEvaluator.ratio(foreground, background);
    const result: ContrastResult = {
      ratio: ratio,
      meetsAA: ratio >= ContrastEvaluator.AA_THRESHOLD,
      meetsAAA: ratio >= ContrastEvaluator.AAA_THRESHOLD,
      largeTextOnly: ratio >= 3 && ratio < ContrastEvaluator.AA_THRESHOLD
    };
    return result;
  }

  public static roundedRatio(foreground: string, background: string): number {
    return Math.round(ContrastEvaluator.ratio(foreground, background) * 10) / 10;
  }
}

/**
 * Marquee model of a long hint.
 * The hint of the timer window is longer than the TV safe area, so it scrolls
 * horizontally. The model verifies that the scrolling speed stays readable and
 * that the loop wraps without losing characters.
 */
class MarqueeTextModel {
  private readonly MAX_SPEED: number = 120;
  private readonly MIN_SPEED: number = 20;
  private text: string;
  private speedPxPerSecond: number;
  private viewportWidth: number;
  private textWidth: number;
  private offset: number = 0;
  private loops: number = 0;

  constructor(text: string, speedPxPerSecond: number, viewportWidth: number, textWidth: number) {
    this.text = text;
    this.speedPxPerSecond = speedPxPerSecond;
    this.viewportWidth = viewportWidth;
    this.textWidth = textWidth;
  }

  public advance(seconds: number): void {
    if (this.speedPxPerSecond <= 0) {
      return;
    }
    this.offset += this.speedPxPerSecond * seconds;
    const overflow = this.textWidth - this.viewportWidth;
    if (overflow <= 0) {
      this.offset = 0;
      return;
    }
    while (this.offset >= overflow) {
      this.offset -= overflow;
      this.loops++;
    }
  }

  public getOffset(): number {
    return Math.round(this.offset * 100) / 100;
  }

  public getLoops(): number {
    return this.loops;
  }

  public getText(): string {
    return this.text;
  }

  public isSpeedReadable(): boolean {
    return this.speedPxPerSecond >= this.MIN_SPEED && this.speedPxPerSecond <= this.MAX_SPEED;
  }

  public isFullyReachable(): boolean {
    return this.textWidth > 0 && this.text.length > 0;
  }

  public check(): MarqueeCheck {
    const readable = this.isSpeedReadable() && this.isFullyReachable() && this.viewportWidth > 0;
    const result: MarqueeCheck = {
      readable: readable,
      loops: this.loops,
      reason: readable ? 'readable' : 'not_readable'
    };
    return result;
  }

  public reset(): void {
    this.offset = 0;
    this.loops = 0;
  }
}

/**
 * Focus trap detector of a floating window.
 * The recorder timer window is not focusable on purpose, so the remote control
 * focus has to stay on the underlying application. A cycle inside the window
 * would break the TV navigation, hence the detector walks the focus chain.
 */
class FocusTrapDetector {
  private nextOf: Map<string, string> = new Map<string, string>();
  private focusable: string[] = [];

  public addFocusable(nodeId: string, nextNodeId: string): void {
    this.nextOf.set(nodeId, nextNodeId);
    this.focusable.push(nodeId);
  }

  public getFocusableCount(): number {
    return this.focusable.length;
  }

  public walk(startNodeId: string, maxSteps: number): string[] {
    const visited: string[] = [];
    let current = startNodeId;
    for (let step = 0; step < maxSteps; step++) {
      if (visited.includes(current)) {
        break;
      }
      visited.push(current);
      const next: string | undefined = this.nextOf.get(current);
      if (next === undefined) {
        break;
      }
      current = next;
    }
    return visited;
  }

  public isTrapped(): boolean {
    if (this.focusable.length === 0) {
      return false;
    }
    const visited = this.walk(this.focusable[0], this.focusable.length + 1);
    const last = visited[visited.length - 1];
    const next: string | undefined = this.nextOf.get(last);
    if (next === undefined || next === 'exit') {
      return false;
    }
    return visited.includes(next);
  }

  public canReachExit(): boolean {
    if (this.focusable.length === 0) {
      return true;
    }
    const visited = this.walk(this.focusable[0], this.focusable.length + 1);
    const last = visited[visited.length - 1];
    const next: string | undefined = this.nextOf.get(last);
    return next === undefined || next === 'exit';
  }
}

/** Announcement log used to verify screen reader feedback. */
class AnnouncementLog {
  private events: string[] = [];

  public announce(nodeId: string, text: string): void {
    this.events.push(`announce:${nodeId}:${text}`);
  }

  public focusChange(nodeId: string, text: string): void {
    this.events.push(`focus:${nodeId}:${text}`);
  }

  public count(): number {
    return this.events.length;
  }

  public countByPrefix(prefix: string): number {
    let count = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].startsWith(prefix)) {
        count++;
      }
    }
    return count;
  }

  public hasEvent(event: string): boolean {
    return this.events.includes(event);
  }

  public clear(): void {
    this.events = [];
  }
}

export default function securityAccessibilityTest(): void {
  describe('SecurityAccessibility_Test', () => {
    it('timer_hint_should_be_readable_by_screen_reader', 0, () => {
      const tree = new RecorderAccessibilityTree();
      const hint: AccessibilityNode = {
        nodeId: 'timer_hint',
        text: '同时按下菜单键与音量减键，即可结束录屏',
        description: '',
        focusable: false,
        visible: true
      };
      tree.addNode(hint);
      expect(tree.hasLabel('timer_hint')).assertTrue();
      expect(tree.readableLabel('timer_hint')).assertContain('菜单键');
      expect(tree.readableLabel('timer_hint').length).assertLarger(10);
    });

    it('timer_label_should_be_announced_with_description', 0, () => {
      const tree = new RecorderAccessibilityTree();
      const label: AccessibilityNode = {
        nodeId: 'timer_label',
        text: '',
        description: '录屏时长 00:00:05',
        focusable: false,
        visible: true
      };
      tree.addNode(label);
      expect(tree.readableLabel('timer_label')).assertEqual('录屏时长 00:00:05');
      expect(tree.hasLabel('timer_label')).assertTrue();
    });

    it('unknown_node_should_have_empty_label', 0, () => {
      const tree = new RecorderAccessibilityTree();
      expect(tree.findById('missing')).assertNull();
      expect(tree.readableLabel('missing')).assertEqual('');
      expect(tree.hasLabel('missing')).assertFalse();
    });

    it('tip_window_should_expose_two_labels', 0, () => {
      const tree = new RecorderAccessibilityTree();
      const title: AccessibilityNode = {
        nodeId: 'tip_title', text: '录屏', description: '', focusable: false, visible: true
      };
      const content: AccessibilityNode = {
        nodeId: 'tip_content', text: '录屏视频已存储到"照片"', description: '', focusable: false, visible: true
      };
      tree.addNode(title);
      tree.addNode(content);
      const labels = tree.labels();
      expect(labels.length).assertEqual(2);
      expect(labels[0]).assertEqual('录屏');
      expect(labels[1]).assertContain('照片');
    });

    it('invisible_nodes_should_be_tracked', 0, () => {
      const tree = new RecorderAccessibilityTree();
      const hidden: AccessibilityNode = {
        nodeId: 'hidden_tip', text: '录屏', description: '', focusable: false, visible: false
      };
      tree.addNode(hidden);
      expect(tree.count()).assertEqual(1);
      expect(tree.visibleCount()).assertEqual(0);
      expect(tree.invisibleNodes()[0]).assertEqual('hidden_tip');
    });

    it('debug_overlay_should_not_add_focusable_nodes', 0, () => {
      const tree = new RecorderAccessibilityTree();
      const timer: AccessibilityNode = {
        nodeId: 'timer_root', text: '', description: '录屏计时', focusable: false, visible: true
      };
      tree.addNode(timer);
      expect(tree.focusableCount()).assertEqual(0);
      expect(tree.visibleCount()).assertEqual(1);
    });

    it('contrast_of_timer_text_should_meet_aa', 0, () => {
      const result = ContrastEvaluator.evaluate(
        ContrastEvaluator.TIMER_TEXT_COLOR, ContrastEvaluator.TIP_BACKGROUND);
      expect(result.meetsAA).assertTrue();
      expect(result.meetsAAA).assertTrue();
      expect(result.ratio).assertLarger(7);
      expect(result.largeTextOnly).assertFalse();
    });

    it('contrast_ratio_should_be_deterministic', 0, () => {
      const first = ContrastEvaluator.roundedRatio('#FFFFFFFF', '#B33A3F62');
      const second = ContrastEvaluator.roundedRatio('#FFFFFFFF', '#B33A3F62');
      expect(first).assertEqual(second);
      expect(first).assertLargerOrEqual(10);
      expect(first).assertLessOrEqual(11);
    });

    it('light_gray_text_should_only_pass_large_text', 0, () => {
      const result = ContrastEvaluator.evaluate('#FFA0A0A0', ContrastEvaluator.TIP_BACKGROUND);
      expect(result.meetsAA).assertFalse();
      expect(result.ratio).assertLess(4.5);
      expect(result.ratio).assertLarger(3);
      expect(result.largeTextOnly).assertTrue();
    });

    it('black_text_should_be_readable_on_light_background', 0, () => {
      const result = ContrastEvaluator.evaluate('#FF000000', '#FFFFFFFF');
      expect(result.ratio).assertEqual(21);
      expect(result.meetsAAA).assertTrue();
    });

    it('identical_colors_should_have_minimal_ratio', 0, () => {
      const result = ContrastEvaluator.evaluate('#FF3A3F62', '#B33A3F62');
      expect(result.ratio).assertEqual(1);
      expect(result.meetsAA).assertFalse();
      expect(result.largeTextOnly).assertFalse();
    });

    it('alpha_channel_should_not_change_luminance', 0, () => {
      const opaque = ContrastEvaluator.luminance('#FF3A3F62');
      const translucent = ContrastEvaluator.luminance('#B33A3F62');
      expect(opaque).assertEqual(translucent);
      expect(ContrastEvaluator.red('#B33A3F62')).assertEqual(0x3A);
      expect(ContrastEvaluator.green('#B33A3F62')).assertEqual(0x3F);
      expect(ContrastEvaluator.blue('#B33A3F62')).assertEqual(0x62);
    });

    it('marquee_hint_should_scroll_within_readable_speed', 0, () => {
      const marquee = new MarqueeTextModel('同时按下菜单键与音量减键，即可结束录屏', 60, 600, 900);
      expect(marquee.isSpeedReadable()).assertTrue();
      expect(marquee.check().readable).assertTrue();
      expect(marquee.check().reason).assertEqual('readable');
    });

    it('marquee_should_wrap_after_full_cycle', 0, () => {
      const marquee = new MarqueeTextModel('hint', 100, 100, 200);
      marquee.advance(1);
      expect(marquee.getOffset()).assertEqual(0);
      expect(marquee.getLoops()).assertEqual(1);
      marquee.advance(0.5);
      expect(marquee.getLoops()).assertEqual(1);
      expect(marquee.getOffset()).assertEqual(50);
    });

    it('marquee_without_overflow_should_stay_at_origin', 0, () => {
      const marquee = new MarqueeTextModel('ok', 60, 400, 120);
      marquee.advance(2);
      expect(marquee.getOffset()).assertEqual(0);
      expect(marquee.getLoops()).assertEqual(0);
    });

    it('too_fast_marquee_should_be_reported', 0, () => {
      const marquee = new MarqueeTextModel('hint', 300, 600, 900);
      expect(marquee.isSpeedReadable()).assertFalse();
      expect(marquee.check().readable).assertFalse();
      expect(marquee.check().reason).assertEqual('not_readable');
    });

    it('too_slow_marquee_should_be_reported', 0, () => {
      const marquee = new MarqueeTextModel('hint', 5, 600, 900);
      expect(marquee.isSpeedReadable()).assertFalse();
      marquee.advance(10);
      expect(marquee.getOffset()).assertEqual(50);
    });

    it('marquee_reset_should_restore_origin', 0, () => {
      const marquee = new MarqueeTextModel('hint', 100, 100, 400);
      marquee.advance(1);
      marquee.reset();
      expect(marquee.getOffset()).assertEqual(0);
      expect(marquee.getLoops()).assertEqual(0);
    });

    it('floating_window_should_not_trap_focus', 0, () => {
      const detector = new FocusTrapDetector();
      detector.addFocusable('app_button', 'exit');
      expect(detector.getFocusableCount()).assertEqual(1);
      expect(detector.canReachExit()).assertTrue();
      expect(detector.isTrapped()).assertFalse();
    });

    it('self_loop_should_be_detected_as_trap', 0, () => {
      const detector = new FocusTrapDetector();
      detector.addFocusable('timer_root', 'timer_root');
      expect(detector.canReachExit()).assertFalse();
      expect(detector.isTrapped()).assertTrue();
      expect(detector.walk('timer_root', 5).length).assertEqual(1);
    });

    it('two_node_cycle_should_be_detected_as_trap', 0, () => {
      const detector = new FocusTrapDetector();
      detector.addFocusable('a', 'b');
      detector.addFocusable('b', 'a');
      expect(detector.isTrapped()).assertTrue();
      const visited = detector.walk('a', 6);
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual('a');
      expect(visited[1]).assertEqual('b');
    });

    it('empty_focus_chain_should_not_be_a_trap', 0, () => {
      const detector = new FocusTrapDetector();
      expect(detector.isTrapped()).assertFalse();
      expect(detector.canReachExit()).assertTrue();
      expect(detector.walk('none', 3).length).assertEqual(1);
    });

    it('screen_reader_announcement_should_be_logged', 0, () => {
      const log = new AnnouncementLog();
      log.announce('tip_title', '录屏');
      log.announce('tip_content', '录屏视频已存储到"照片"');
      log.focusChange('timer_root', '录屏计时');
      expect(log.count()).assertEqual(3);
      expect(log.countByPrefix('announce')).assertEqual(2);
      expect(log.countByPrefix('focus')).assertEqual(1);
      expect(log.hasEvent('announce:tip_title:录屏')).assertTrue();
    });

    it('cleared_announcement_log_should_be_empty', 0, () => {
      const log = new AnnouncementLog();
      log.announce('a', 'b');
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.hasEvent('announce:a:b')).assertFalse();
      expect(log.countByPrefix('announce')).assertEqual(0);
    });

    it('accessibility_scenario_should_keep_labels_and_contrast', 0, () => {
      const tree = new RecorderAccessibilityTree();
      const hint: AccessibilityNode = {
        nodeId: 'hint', text: '同时按下菜单键与音量减键，即可结束录屏', description: '',
        focusable: false, visible: true
      };
      tree.addNode(hint);
      const log = new AnnouncementLog();
      log.announce('hint', tree.readableLabel('hint'));
      const contrast = ContrastEvaluator.evaluate('#FFFFFFFF', '#B33A3F62');
      expect(tree.visibleCount()).assertEqual(1);
      expect(contrast.meetsAA).assertTrue();
      expect(log.countByPrefix('announce')).assertEqual(1);
      expect(tree.focusableCount()).assertEqual(0);
    });
  });
}

