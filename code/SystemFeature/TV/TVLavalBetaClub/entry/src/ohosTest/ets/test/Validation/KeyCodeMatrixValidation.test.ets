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
import { KeyCode } from '../../../../main/ets/pages/common/KeyCode';

const CATEGORY_NAVIGATION: string = 'navigation';

const CATEGORY_CONFIRM: string = 'confirm';

const CATEGORY_SYSTEM: string = 'system';

const CATEGORY_DIGIT: string = 'digit';

const MIN_KEY_CODE: number = 1;

const MAX_KEY_CODE: number = 3000;

interface KeyDefinition {
  code: number;
  name: string;
  category: string;
}

// Catalogs remote key definitions by category
class KeyCatalog {
  private definitions: Map<number, KeyDefinition> = new Map<number, KeyDefinition>();

  public register(definition: KeyDefinition): boolean {
    if (definition.name.length === 0 || this.definitions.has(definition.code)) {
      return false;
    }
    if (definition.code < MIN_KEY_CODE || definition.code > MAX_KEY_CODE) {
      return false;
    }
    this.definitions.set(definition.code, {
      code: definition.code,
      name: definition.name,
      category: definition.category
    });
    return true;
  }

  public lookup(code: number): KeyDefinition | undefined {
    return this.definitions.get(code);
  }

  public nameOf(code: number): string {
    const definition = this.definitions.get(code);
    return definition === undefined ? '' : definition.name;
  }

  public byCategory(category: string): KeyDefinition[] {
    const result: KeyDefinition[] = [];
    this.definitions.forEach((definition: KeyDefinition) => {
      if (definition.category === category) {
        result.push(definition);
      }
    });
    return result;
  }

  public size(): number {
    return this.definitions.size;
  }

  public categories(): string[] {
    const seen: Set<string> = new Set<string>();
    const result: string[] = [];
    this.definitions.forEach((definition: KeyDefinition) => {
      if (!seen.has(definition.category)) {
        seen.add(definition.category);
        result.push(definition.category);
      }
    });
    return result;
  }

  public codes(): number[] {
    const result: number[] = [];
    this.definitions.forEach((definition: KeyDefinition) => {
      result.push(definition.code);
    });
    return result;
  }

  public clear(): void {
    this.definitions = new Map<number, KeyDefinition>();
  }
}

// Validates key sequences for navigation scripts
class KeySequenceValidator {
  public static hasDuplicates(codes: number[]): boolean {
    const seen: Set<number> = new Set<number>();
    for (let i = 0; i < codes.length; i++) {
      if (seen.has(codes[i])) {
        return true;
      }
      seen.add(codes[i]);
    }
    return false;
  }

  public static hasDuplicateSteps(codes: number[]): boolean {
    for (let i = 1; i < codes.length; i++) {
      if (codes[i] === codes[i - 1]) {
        return true;
      }
    }
    return false;
  }

  public static isNavigationSequence(codes: number[]): boolean {
    for (let i = 0; i < codes.length; i++) {
      if (!KeySequenceValidator.isNavigationKey(codes[i])) {
        return false;
      }
    }
    return codes.length > 0;
  }

  public static isNavigationKey(code: number): boolean {
    return code === KeyCode.KEY_DPAD_UP || code === KeyCode.KEY_DPAD_DOWN ||
      code === KeyCode.KEY_DPAD_LEFT || code === KeyCode.KEY_DPAD_RIGHT;
  }

  public static endsWithConfirm(codes: number[]): boolean {
    return codes.length > 0 && codes[codes.length - 1] === KeyCode.KEY_ENTER;
  }

  public static countOf(codes: number[], code: number): number {
    let count: number = 0;
    for (let i = 0; i < codes.length; i++) {
      if (codes[i] === code) {
        count++;
      }
    }
    return count;
  }

  public static directionOf(code: number): string {
    if (code === KeyCode.KEY_DPAD_UP) {
      return 'up';
    }
    if (code === KeyCode.KEY_DPAD_DOWN) {
      return 'down';
    }
    if (code === KeyCode.KEY_DPAD_LEFT) {
      return 'left';
    }
    if (code === KeyCode.KEY_DPAD_RIGHT) {
      return 'right';
    }
    return '';
  }
}

// Builds the default key catalog used by the app
class DefaultKeyCatalog {
  public static build(): KeyCatalog {
    const catalog = new KeyCatalog();
    catalog.register({ code: KeyCode.KEY_DPAD_UP, name: 'up', category: CATEGORY_NAVIGATION });
    catalog.register({ code: KeyCode.KEY_DPAD_DOWN, name: 'down', category: CATEGORY_NAVIGATION });
    catalog.register({ code: KeyCode.KEY_DPAD_LEFT, name: 'left', category: CATEGORY_NAVIGATION });
    catalog.register({ code: KeyCode.KEY_DPAD_RIGHT, name: 'right', category: CATEGORY_NAVIGATION });
    catalog.register({ code: KeyCode.KEY_ENTER, name: 'enter', category: CATEGORY_CONFIRM });
    catalog.register({ code: KeyCode.KEYCODE_TAB, name: 'tab', category: CATEGORY_CONFIRM });
    catalog.register({ code: KeyCode.KEY_BACK, name: 'back', category: CATEGORY_SYSTEM });
    catalog.register({ code: KeyCode.KEY_0, name: 'digit-0', category: CATEGORY_DIGIT });
    catalog.register({ code: KeyCode.KEY_9, name: 'digit-9', category: CATEGORY_DIGIT });
    return catalog;
  }
}

export default function keyCodeMatrixValidationTest() {
  describe('KeyCodeMatrixValidation_Test', () => {

    it('catalog_should_register_keys', 0, () => {
      const catalog = new KeyCatalog();
      expect(catalog.register({
        code: KeyCode.KEY_DPAD_UP, name: 'up', category: CATEGORY_NAVIGATION
      })).assertTrue();
      expect(catalog.register({
        code: KeyCode.KEY_DPAD_UP, name: 'duplicate', category: CATEGORY_NAVIGATION
      })).assertFalse();
      expect(catalog.register({
        code: KeyCode.KEY_DPAD_DOWN, name: '', category: CATEGORY_NAVIGATION
      })).assertFalse();
      expect(catalog.size()).assertEqual(1);
      expect(catalog.nameOf(KeyCode.KEY_DPAD_UP)).assertEqual('up');
      expect(catalog.nameOf(9999)).assertEqual('');
    });

    it('catalog_should_reject_out_of_range_codes', 0, () => {
      const catalog = new KeyCatalog();
      expect(catalog.register({
        code: 0, name: 'zero', category: CATEGORY_SYSTEM
      })).assertFalse();
      expect(catalog.register({
        code: MAX_KEY_CODE + 1, name: 'big', category: CATEGORY_SYSTEM
      })).assertFalse();
      expect(catalog.register({
        code: MIN_KEY_CODE, name: 'min', category: CATEGORY_SYSTEM
      })).assertTrue();
      expect(catalog.lookup(MIN_KEY_CODE) !== undefined).assertTrue();
      expect(catalog.lookup(0) === undefined).assertTrue();
    });

    it('catalog_should_filter_by_category', 0, () => {
      const catalog = DefaultKeyCatalog.build();
      expect(catalog.size()).assertEqual(9);
      expect(catalog.byCategory(CATEGORY_NAVIGATION).length).assertEqual(4);
      expect(catalog.byCategory(CATEGORY_CONFIRM).length).assertEqual(2);
      expect(catalog.byCategory(CATEGORY_SYSTEM).length).assertEqual(1);
      expect(catalog.byCategory(CATEGORY_DIGIT).length).assertEqual(2);
      expect(catalog.byCategory('unknown').length).assertEqual(0);
      expect(catalog.categories().length).assertEqual(4);
    });

    it('catalog_should_expose_codes', 0, () => {
      const catalog = DefaultKeyCatalog.build();
      const codes = catalog.codes();
      expect(codes.length).assertEqual(9);
      expect(codes.includes(KeyCode.KEY_ENTER)).assertTrue();
      expect(codes.includes(KeyCode.KEY_BACK)).assertTrue();
      expect(codes.includes(9999)).assertFalse();
      catalog.clear();
      expect(catalog.size()).assertEqual(0);
      expect(catalog.codes().length).assertEqual(0);
    });

    it('sequence_should_detect_duplicate_keys', 0, () => {
      const codes: number[] = [KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_ENTER];
      expect(KeySequenceValidator.hasDuplicates(codes)).assertTrue();
      expect(KeySequenceValidator.hasDuplicateSteps(codes)).assertTrue();
      const distinct: number[] = [KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_DPAD_UP];
      expect(KeySequenceValidator.hasDuplicates(distinct)).assertFalse();
      expect(KeySequenceValidator.hasDuplicateSteps(distinct)).assertFalse();
      expect(KeySequenceValidator.hasDuplicates([])).assertFalse();
    });

    it('sequence_should_validate_navigation', 0, () => {
      const navigation: number[] = [
        KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_DPAD_RIGHT, KeyCode.KEY_DPAD_LEFT
      ];
      expect(KeySequenceValidator.isNavigationSequence(navigation)).assertTrue();
      expect(KeySequenceValidator.isNavigationSequence([])).assertFalse();
      expect(KeySequenceValidator.isNavigationSequence([KeyCode.KEY_ENTER])).assertFalse();
      expect(KeySequenceValidator.isNavigationKey(KeyCode.KEY_DPAD_UP)).assertTrue();
      expect(KeySequenceValidator.isNavigationKey(KeyCode.KEY_BACK)).assertFalse();
    });

    it('sequence_should_require_final_confirm', 0, () => {
      expect(KeySequenceValidator.endsWithConfirm([
        KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_ENTER
      ])).assertTrue();
      expect(KeySequenceValidator.endsWithConfirm([KeyCode.KEY_ENTER])).assertTrue();
      expect(KeySequenceValidator.endsWithConfirm([KeyCode.KEY_DPAD_DOWN])).assertFalse();
      expect(KeySequenceValidator.endsWithConfirm([])).assertFalse();
    });

    it('sequence_should_count_and_map_directions', 0, () => {
      const codes: number[] = [
        KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_DPAD_UP, KeyCode.KEY_ENTER
      ];
      expect(KeySequenceValidator.countOf(codes, KeyCode.KEY_DPAD_DOWN)).assertEqual(2);
      expect(KeySequenceValidator.countOf(codes, KeyCode.KEY_BACK)).assertEqual(0);
      expect(KeySequenceValidator.directionOf(KeyCode.KEY_DPAD_UP)).assertEqual('up');
      expect(KeySequenceValidator.directionOf(KeyCode.KEY_DPAD_DOWN)).assertEqual('down');
      expect(KeySequenceValidator.directionOf(KeyCode.KEY_DPAD_LEFT)).assertEqual('left');
      expect(KeySequenceValidator.directionOf(KeyCode.KEY_DPAD_RIGHT)).assertEqual('right');
      expect(KeySequenceValidator.directionOf(KeyCode.KEY_ENTER)).assertEqual('');
    });

    it('catalog_should_match_keycode_enum', 0, () => {
      const catalog = DefaultKeyCatalog.build();
      expect(catalog.lookup(KeyCode.KEY_DPAD_UP) !== undefined).assertTrue();
      expect(catalog.lookup(KeyCode.KEY_DPAD_DOWN) !== undefined).assertTrue();
      expect(catalog.lookup(KeyCode.KEY_ENTER) !== undefined).assertTrue();
      expect(catalog.lookup(KeyCode.KEY_BACK) !== undefined).assertTrue();
      expect(catalog.lookup(KeyCode.KEY_0) !== undefined).assertTrue();
      expect(catalog.lookup(KeyCode.KEY_9) !== undefined).assertTrue();
      expect(KeyCode.KEY_ENTER).assertEqual(2054);
      expect(KeyCode.KEY_BACK).assertEqual(2);
    });

    it('sequence_flow_should_build_navigation_script', 0, () => {
      const sequence: number[] = [
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_ENTER
      ];
      const catalog = DefaultKeyCatalog.build();
      const directions: string[] = [];
      for (let i = 0; i < sequence.length; i++) {
        const direction = KeySequenceValidator.directionOf(sequence[i]);
        if (direction.length > 0) {
          directions.push(direction);
        }
        expect(catalog.nameOf(sequence[i]).length).assertLarger(0);
      }
      expect(directions).assertDeepEquals(['down', 'down']);
      expect(KeySequenceValidator.endsWithConfirm(sequence)).assertTrue();
      expect(KeySequenceValidator.hasDuplicates(sequence)).assertTrue();
      expect(KeySequenceValidator.countOf(sequence, KeyCode.KEY_DPAD_DOWN)).assertEqual(2);
    });

    it('key_matrix_constants_should_be_stable', 0, () => {
      expect(CATEGORY_NAVIGATION).assertEqual('navigation');
      expect(CATEGORY_CONFIRM).assertEqual('confirm');
      expect(CATEGORY_SYSTEM).assertEqual('system');
      expect(CATEGORY_DIGIT).assertEqual('digit');
      expect(MIN_KEY_CODE).assertEqual(1);
      expect(MAX_KEY_CODE).assertEqual(3000);
    });
  });
}

