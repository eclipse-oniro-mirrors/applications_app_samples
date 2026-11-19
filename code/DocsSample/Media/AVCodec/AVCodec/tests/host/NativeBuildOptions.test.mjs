/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import assert from 'node:assert/strict';
import { nativeBuildOptions } from '../../scripts/NativeBuildOptions.mjs';

assert.deepEqual(nativeBuildOptions().flags, ['-O0', '-g']);
assert.deepEqual(nativeBuildOptions('release').flags, ['-O2', '-DNDEBUG']);
for (const sanitizer of ['address', 'undefined', 'thread']) {
  const profile = nativeBuildOptions('release', sanitizer);
  assert(profile.flags.includes('-DNDEBUG'));
  assert(profile.flags.includes('-fsanitize=' + sanitizer));
  assert.equal(profile.directory, 'release-' + sanitizer);
}
assert(nativeBuildOptions('release', 'address').flags.includes('-fno-pie'));
assert(nativeBuildOptions('release', 'address').flags.includes('-no-pie'));
assert(nativeBuildOptions('release', 'undefined').flags.includes('-fno-sanitize-recover=all'));
assert.throws(() => nativeBuildOptions('relese'), /Invalid Native build/);
assert.throws(() => nativeBuildOptions('debug', 'unknown'), /Invalid Native sanitizer/);
console.info('Native profiles: Debug, Release, sanitizer flags and invalid options passed');
