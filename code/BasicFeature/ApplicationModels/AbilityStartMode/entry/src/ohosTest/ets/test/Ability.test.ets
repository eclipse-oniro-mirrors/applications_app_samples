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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  ABILITY_MAIN,
  ABILITY_STANDARD,
  ABILITY_SPECIFIED,
  ABILITY_SINGLETON,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_START_MODE,
  logInfo
} from './Shared/SharedDriver';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      logInfo('ActsAbilityTest beforeAll');
    });

    beforeEach(() => {
      logInfo('ActsAbilityTest beforeEach');
    });

    afterEach(() => {
      logInfo('ActsAbilityTest afterEach');
    });

    afterAll(() => {
      logInfo('ActsAbilityTest afterAll');
    });

    it('assertContain', 0, () => {
      let sample: string = 'StartMode';
      expect(sample).assertContain('Mode');
      expect(sample).assertEqual(sample);
    });

    it('ability_names_should_be_unique', 0, () => {
      const names: string[] = [ABILITY_MAIN, ABILITY_STANDARD, ABILITY_SPECIFIED, ABILITY_SINGLETON];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < names.length; i++) {
        unique.add(names[i]);
      }
      expect(unique.size).assertEqual(names.length);
    });

    it('mode_labels_should_be_stable', 0, () => {
      expect(MODE_STANDARD).assertEqual('standard');
      expect(MODE_SPECIFIED).assertEqual('specified');
      expect(MODE_SINGLETON).assertEqual('sinleton');
    });

    it('timeout_should_be_positive', 0, () => {
      expect(TIMEOUT_PAGE_RENDER > 0).assertTrue();
      expect(DELAY_AFTER_START_MODE >= 0).assertTrue();
    });

    it('mode_labels_should_differ', 0, () => {
      expect(MODE_STANDARD === MODE_SPECIFIED).assertFalse();
      expect(MODE_SPECIFIED === MODE_SINGLETON).assertFalse();
      expect(MODE_STANDARD === MODE_SINGLETON).assertFalse();
    });

    it('ability_name_length_should_match', 0, () => {
      expect(ABILITY_MAIN.length).assertEqual('MainAbility'.length);
      expect(ABILITY_STANDARD.length).assertEqual('StandardAbility'.length);
      expect(ABILITY_SPECIFIED.length).assertEqual('SpecifiedAbility'.length);
      expect(ABILITY_SINGLETON.length).assertEqual('SingletonAbility'.length);
    });

    it('mode_label_index_should_be_valid', 0, () => {
      const labels: string[] = [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON];
      for (let i = 0; i < labels.length; i++) {
        expect(labels[i].length > 0).assertTrue();
      }
    });

    it('ability_name_should_contain_suffix', 0, () => {
      expect(ABILITY_STANDARD).assertContain('Ability');
      expect(ABILITY_SPECIFIED).assertContain('Ability');
      expect(ABILITY_SINGLETON).assertContain('Ability');
    });
  });
}
