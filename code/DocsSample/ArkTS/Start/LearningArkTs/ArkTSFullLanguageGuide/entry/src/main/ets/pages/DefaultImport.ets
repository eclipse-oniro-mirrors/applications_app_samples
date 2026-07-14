/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

export {}

// [Start default_import]
import Logger from '../common/Logger';

let logger: Logger = new Logger();
logger.info('module loaded');
// [End default_import]

// [Start default_import_usage]
import Logger from '../common/Logger';

let logger: Logger = new Logger();
// [End default_import_usage]
