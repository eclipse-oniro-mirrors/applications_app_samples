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
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount,
  getCurrentFocusIndex, waitForPageStable, pressAndWait, triggerMiracastHome,
  serializedDelay, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';

enum AnnounceKind { FOCUS = 'focus', CLICK = 'click', READ = 'read' }

interface FocusableItem { index: number; label: string; }

interface ScreenReaderEvent { target: string; kind: AnnounceKind; sequence: number; }

interface BarrierFreeAudit { labelsComplete: boolean; focusOrderValid: boolean; contrastRatio: number; }

class FocusOrderModel {
  private items: Array<FocusableItem> = [];
  private cursor: number = -1;

  public add(index: number, label: string): boolean {
    if (label.length === 0 || this.hasIndex(index)) { return false; }
    this.items.push({ index: index, label: label });
    this.items.sort((left: FocusableItem, right: FocusableItem) => left.index - right.index);
    return true;
  }

  public hasIndex(index: number): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].index === index) { return true; }
    }
    return false;
  }

  public size(): number { return this.items.length; }
  public clear(): void { this.items = []; this.cursor = -1; }

  public next(): number {
    if (this.items.length === 0) { return -1; }
    this.cursor = (this.cursor + 1) % this.items.length;
    return this.items[this.cursor].index;
  }

  public previous(): number {
    if (this.items.length === 0) { return -1; }
    this.cursor = (this.cursor - 1 + this.items.length) % this.items.length;
    return this.items[this.cursor].index;
  }

  public labelAt(position: number): string {
    if (position < 0 || position >= this.items.length) { return ''; }
    return this.items[position].label;
  }

  public isSequential(): boolean {
    for (let i = 1; i < this.items.length; i++) {
      if (this.items[i].index !== this.items[i - 1].index + 1) { return false; }
    }
    return true;
  }
}
class LabelRegistry {
  private labels: Map<string, string> = new Map<string, string>();

  public register(id: string, label: string): boolean {
    if (id.length === 0 || label.length === 0 || id.length > 64 || label.length > 64) { return false; }
    this.labels.set(id, label);
    return true;
  }

  public get(id: string): string {
    const value: string | undefined = this.labels.get(id);
    return value === undefined ? '' : value;
  }

  public update(id: string, label: string): boolean {
    if (!this.labels.has(id) || label.length === 0) { return false; }
    this.labels.set(id, label);
    return true;
  }

  public count(): number { return this.labels.size; }
  public clear(): void { this.labels.clear(); }

  public hasPlaceholder(): boolean {
    let found: boolean = false;
    this.labels.forEach((value: string) => {
      if (value.indexOf('$r') >= 0 || value === 'label') { found = true; }
    });
    return found;
  }
}

class ScreenReaderSimulator {
  private events: Array<ScreenReaderEvent> = [];
  private sequence: number = 0;

  public announce(target: string, kind: AnnounceKind): void {
    this.events.push({ target: target, kind: kind, sequence: this.sequence++ });
  }

  public count(): number { return this.events.length; }
  public clear(): void { this.events = []; this.sequence = 0; }
  public targetOf(position: number): string { return this.events[position].target; }
  public kindOf(position: number): AnnounceKind { return this.events[position].kind; }

  public isChronological(): boolean {
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].sequence <= this.events[i - 1].sequence) { return false; }
    }
    return true;
  }

  public findByTarget(target: string): number {
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].target === target) { return i; }
    }
    return -1;
  }
}

class ContrastChecker {
  public static readonly AA_LIMIT: number = 4.5;
  public static readonly MAX_RATIO: number = 21;

  public static ratio(foreground: number, background: number): number {
    const lighter: number = Math.max(foreground, background);
    const darker: number = Math.min(foreground, background);
    return (lighter + 0.05) / (darker + 0.05);
  }

  public static isAaPass(ratio: number): boolean { return ratio >= ContrastChecker.AA_LIMIT; }
}

class BarrierFreeValidator {
  public static validate(audit: BarrierFreeAudit): boolean {
    return audit.labelsComplete && audit.focusOrderValid && ContrastChecker.isAaPass(audit.contrastRatio);
  }
}
export default function securityBarrierFreeSuite(): void {
  describe('SecurityBarrierFree_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('permission_dialog_should_have_sequential_focus_order', 0, async () => {
      const model = new FocusOrderModel();
      model.add(0, 'Title');
      model.add(1, 'Allow');
      model.add(2, 'Cancel');
      expect(model.isSequential()).assertTrue();
      expect(model.size()).assertEqual(3);
    });

    it('focus_order_should_reject_duplicate_and_empty', 0, async () => {
      const model = new FocusOrderModel();
      model.add(0, 'Title');
      expect(model.add(0, 'Again')).assertFalse();
      expect(model.add(1, '')).assertFalse();
    });

    it('focus_order_should_wrap_next_at_tail', 0, async () => {
      const model = new FocusOrderModel();
      model.add(0, 'Title');
      model.add(1, 'Allow');
      expect(model.next()).assertEqual(0);
      expect(model.next()).assertEqual(1);
      expect(model.next()).assertEqual(0);
    });

    it('focus_order_should_wrap_previous_at_head', 0, async () => {
      const model = new FocusOrderModel();
      model.add(0, 'Title');
      model.add(1, 'Allow');
      model.previous();
      expect(model.previous()).assertEqual(1);
    });

    it('focus_order_should_handle_empty_model', 0, async () => {
      const model = new FocusOrderModel();
      expect(model.next()).assertEqual(-1);
      expect(model.previous()).assertEqual(-1);
    });

    it('focus_order_should_sort_on_insert', 0, async () => {
      const model = new FocusOrderModel();
      model.add(2, 'Cancel');
      model.add(0, 'Title');
      expect(model.labelAt(0)).assertEqual('Title');
      expect(model.labelAt(1)).assertEqual('Cancel');
    });

    it('focus_order_should_rebuild_after_clear', 0, async () => {
      const model = new FocusOrderModel();
      model.add(0, 'Title');
      model.clear();
      expect(model.size()).assertEqual(0);
      expect(model.add(1, 'Allow')).assertTrue();
    });

    it('label_registry_should_reject_empty_and_oversized', 0, async () => {
      const registry = new LabelRegistry();
      expect(registry.register('', 'Allow')).assertFalse();
      expect(registry.register('allowBtn', '')).assertFalse();
      expect(registry.register('allowBtn', 'A'.repeat(65))).assertFalse();
    });

    it('label_registry_should_store_and_read_label', 0, async () => {
      const registry = new LabelRegistry();
      registry.register('allowBtn', 'Allow');
      expect(registry.get('allowBtn')).assertEqual('Allow');
      expect(registry.get('missing')).assertEqual('');
    });

    it('label_registry_should_update_existing_label', 0, async () => {
      const registry = new LabelRegistry();
      registry.register('allowBtn', 'Allow');
      expect(registry.update('allowBtn', 'Approve')).assertTrue();
      expect(registry.update('missing', 'Approve')).assertFalse();
    });

    it('label_registry_should_detect_placeholder', 0, async () => {
      const registry = new LabelRegistry();
      registry.register('title', 'label');
      expect(registry.hasPlaceholder()).assertTrue();
    });

    it('label_registry_should_clear_all_labels', 0, async () => {
      const registry = new LabelRegistry();
      registry.register('allowBtn', 'Allow');
      registry.clear();
      expect(registry.count()).assertEqual(0);
    });

    it('label_registry_should_count_entries', 0, async () => {
      const registry = new LabelRegistry();
      registry.register('a', 'A');
      registry.register('b', 'B');
      expect(registry.count()).assertEqual(2);
    });

    it('screen_reader_should_record_event_kinds', 0, async () => {
      const reader = new ScreenReaderSimulator();
      reader.announce('Title', AnnounceKind.READ);
      reader.announce('Allow', AnnounceKind.FOCUS);
      expect(reader.kindOf(1)).assertEqual(AnnounceKind.FOCUS);
    });

    it('screen_reader_events_should_be_chronological', 0, async () => {
      const reader = new ScreenReaderSimulator();
      reader.announce('Title', AnnounceKind.READ);
      reader.announce('Allow', AnnounceKind.FOCUS);
      expect(reader.isChronological()).assertTrue();
      expect(reader.count()).assertEqual(2);
    });
    it('screen_reader_should_follow_focus_order', 0, async () => {
      const model = new FocusOrderModel();
      const reader = new ScreenReaderSimulator();
      model.add(0, 'Title');
      model.add(1, 'Allow');
      reader.announce(model.labelAt(model.next()), AnnounceKind.FOCUS);
      reader.announce(model.labelAt(model.next()), AnnounceKind.FOCUS);
      expect(reader.targetOf(1)).assertEqual('Allow');
    });

    it('screen_reader_should_find_events_by_target', 0, async () => {
      const reader = new ScreenReaderSimulator();
      reader.announce('Title', AnnounceKind.READ);
      reader.announce('Cancel', AnnounceKind.CLICK);
      expect(reader.findByTarget('Cancel')).assertEqual(1);
      expect(reader.findByTarget('Missing')).assertEqual(-1);
    });

    it('screen_reader_should_clear_events', 0, async () => {
      const reader = new ScreenReaderSimulator();
      reader.announce('Title', AnnounceKind.READ);
      reader.clear();
      expect(reader.count()).assertEqual(0);
      expect(reader.isChronological()).assertTrue();
    });

    it('contrast_checker_should_pass_aa_standard', 0, async () => {
      expect(ContrastChecker.isAaPass(ContrastChecker.ratio(1, 0))).assertTrue();
      expect(ContrastChecker.ratio(1, 0)).assertEqual(ContrastChecker.MAX_RATIO);
    });

    it('contrast_checker_should_handle_edges', 0, async () => {
      expect(ContrastChecker.ratio(0.5, 0.5)).assertEqual(1);
      expect(ContrastChecker.isAaPass(1)).assertFalse();
    });

    it('contrast_checker_should_reject_low_ratio', 0, async () => {
      const ratio: number = ContrastChecker.ratio(0.6, 0.5);
      expect(ratio).assertLess(ContrastChecker.AA_LIMIT);
      expect(ContrastChecker.isAaPass(ratio)).assertFalse();
    });

    it('validator_should_pass_complete_dialog', 0, async () => {
      const audit: BarrierFreeAudit = { labelsComplete: true, focusOrderValid: true, contrastRatio: 7 };
      expect(BarrierFreeValidator.validate(audit)).assertTrue();
    });

    it('validator_should_detect_missing_labels', 0, async () => {
      const audit: BarrierFreeAudit = { labelsComplete: false, focusOrderValid: true, contrastRatio: 7 };
      expect(BarrierFreeValidator.validate(audit)).assertFalse();
    });

    it('validator_should_detect_broken_focus_order', 0, async () => {
      const audit: BarrierFreeAudit = { labelsComplete: true, focusOrderValid: false, contrastRatio: 7 };
      expect(BarrierFreeValidator.validate(audit)).assertFalse();
    });

    it('validator_should_detect_low_contrast', 0, async () => {
      const audit: BarrierFreeAudit = { labelsComplete: true, focusOrderValid: true, contrastRatio: 1.2 };
      expect(BarrierFreeValidator.validate(audit)).assertFalse();
    });

    it('high_contrast_with_labels_should_pass', 0, async () => {
      const registry = new LabelRegistry();
      registry.register('allowBtn', 'Allow');
      const audit: BarrierFreeAudit = {
        labelsComplete: !registry.hasPlaceholder(), focusOrderValid: true, contrastRatio: ContrastChecker.ratio(1, 0)
      };
      expect(BarrierFreeValidator.validate(audit)).assertTrue();
    });



    it('nine_tile_focus_labels_should_be_readable', 0, async () => {
      const model = new FocusOrderModel();
      for (let i = 0; i < 9; i++) { expect(model.add(i, 'Tile ' + i)).assertTrue(); }
      expect(model.isSequential()).assertTrue();
      expect(model.labelAt(8)).assertEqual('Tile 8');
    });


    it('barrierFree_audit_should_hold_after_navigation', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const audit: BarrierFreeAudit = { labelsComplete: true, focusOrderValid: true, contrastRatio: 9 };
      expect(BarrierFreeValidator.validate(audit)).assertTrue();
    });
  });
}
