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

import { describe, expect, it } from '@ohos/hypium';
import { SchemaMigration } from '../main/ets/data/SchemaMigration';

/** Registers the unit test suite for schema migration helpers. */
export default function schemaMigrationTest() {
  describe('SchemaMigration', () => {
    it('compare_version_upgrade', 0, () => {
      expect(SchemaMigration.compareVersion(1, 2)).assertEqual('UPGRADE');
    });

    it('compare_version_downgrade', 0, () => {
      expect(SchemaMigration.compareVersion(2, 1)).assertEqual('DOWNGRADE');
    });

    it('compare_version_same', 0, () => {
      expect(SchemaMigration.compareVersion(1, 1)).assertEqual('SAME');
    });
  });
}
