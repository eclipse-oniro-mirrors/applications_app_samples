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

export function nativeBuildOptions(build = 'debug', sanitizer = 'none') {
  if (!['debug', 'release'].includes(build)) { throw new Error('Invalid Native build: ' + build); }
  if (!['none', 'address', 'undefined', 'thread'].includes(sanitizer)) {
    throw new Error('Invalid Native sanitizer: ' + sanitizer);
  }
  const flags = build === 'release' ? ['-O2', '-DNDEBUG'] : ['-O0', '-g'];
  if (sanitizer !== 'none') { flags.push('-g', '-fno-omit-frame-pointer', '-fsanitize=' + sanitizer); }
  // Linux宿主ASan使用固定装载地址，避免受WSL随机地址映射影响；检测规则不变。
  if (sanitizer === 'address') { flags.push('-fno-pie', '-no-pie'); }
  if (sanitizer === 'undefined') { flags.push('-fno-sanitize-recover=all'); }
  return { flags, directory: build + '-' + sanitizer };
}
