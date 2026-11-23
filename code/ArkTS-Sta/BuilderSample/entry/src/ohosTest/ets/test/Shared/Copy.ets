'use static';

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

import hilog from '@ohos.hilog';

export const PLACEHOLDER_DEFAULT: string = '\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...';
export const PLACEHOLDER_UPDATED: string = '\u65b0\u5e74\u5feb\u4e50!';
export const TEXT_DEFAULT: string = '"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"';
export const HEADER_TITLE: string = '\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199';
export const HEADER_SUBTITLE: string = '\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e';
export const INPUT_LABEL: string = '\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:';
export const FOOTER_COPY: string = '\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab';
export const UPDATE_LABEL: string = 'update';

export function logSuite(name: string, state: string): void {
  hilog.info(0x0000, 'BuilderSampleTest', '%{public}s %{public}s', name, state);
}
